% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/FOtoPDF.R
\name{FOtoPDF}
\alias{FOtoPDF}
\title{Save Formatting Objects to PDF.}
\usage{
FOtoPDF(doc, path, config.path = getOption("fop.config.path"))
}
\arguments{
\item{doc}{Formatting Objects as an rDOM document.}

\item{path}{The generated file.}

\item{config.path}{The FOP configuration file, defaults to the one shipped with FOP.}
}
\description{
Save Formatting Objects to PDF.
}
\examples{
\dontrun{

library(rDOM)

dom <- createDocument()
ns <- "http://www.w3.org/1999/XSL/Format"
root <- dom$appendChild(dom$createElementNS(ns, "fo:root"))

layout_master_set <- root$appendChild(dom$createElementNS(ns, "layout-master-set"))
simple_page_master <- layout_master_set$appendChild(dom$createElementNS(ns, "simple-page-master"))
simple_page_master$setAttribute("master-name", "master")
region_body <- simple_page_master$appendChild(dom$createElementNS(ns, "region-body"))
region_body$setAttribute("margin", "1in")

page_sequence <- root$appendChild(dom$createElementNS(ns, "page-sequence"))
page_sequence$setAttribute("master-reference", "master")
flow <- page_sequence$appendChild(dom$createElementNS(ns, "flow"))
flow$setAttribute("flow-name", "xsl-region-body")
block <- flow$appendChild(dom$createElementNS(ns, "block"))
text <- block$appendChild(dom$createTextNode("Hello, World!"))

FOtoPDF(root, "Hello_World.pdf")
}
}
