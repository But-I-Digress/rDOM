
import java.io.File;
import java.io.OutputStream;
import java.io.StringWriter;
import java.io.Writer;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Comment;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.Text;

import org.apache.fop.apps.FOUserAgent;
import org.apache.fop.apps.Fop;
import org.apache.fop.apps.FopFactory;
import org.apache.fop.apps.MimeConstants;

public class rDOM {

	public Document getDocument () throws Exception {
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = dbf.newDocumentBuilder();
		return builder.newDocument();
	}
	
	public void toFile (Document doc, String path) throws Exception {
		DOMSource domSource = new DOMSource(doc);
		File file = new File(path);
		StreamResult result = new StreamResult(file);
		TransformerFactory factory = TransformerFactory.newInstance();
		Transformer transformer = factory.newTransformer();
		transformer.transform(domSource, result);
	}
	
	public String toString (Document doc) {
		try {
			DOMSource domSource = new DOMSource(doc);
			StringWriter writer = new StringWriter();
			StreamResult result = new StreamResult(writer);
			TransformerFactory factory = TransformerFactory.newInstance();
			Transformer transformer = factory.newTransformer();
			transformer.transform(domSource, result);
			return writer.toString();
		} catch (Exception e) {
			return "Error";
		}
	}
	
	public void FOtoPDF (Document doc, String path, String configPath) throws Exception {
		File configFile = new File(configPath);
		File pdf = new File(path);
		FopFactory fopFactory = FopFactory.newInstance(configFile);
		FOUserAgent foUserAgent = fopFactory.newFOUserAgent();
		OutputStream out = new java.io.FileOutputStream(pdf);
		out = new java.io.BufferedOutputStream(out);
		Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, foUserAgent, out);
		TransformerFactory factory = TransformerFactory.newInstance();
		Transformer transformer = factory.newTransformer();
		Source src = new DOMSource(doc);
		Result res = new SAXResult(fop.getDefaultHandler());
		transformer.transform(src, res);
		out.close();
	}

}