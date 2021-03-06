% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rDOM.R
\docType{package}
\name{rDOM-package}
\alias{rDOM}
\alias{rDOM-package}
\title{r Document Object Model}
\description{
This package makes the Java implementation of the W3C DOM available to R.
}
\details{
This package requires the installation of Java and may only work for the version of R associated w

If the FOPjars package is installed then this package can be used to create a Formatting Objects document tree and then save a document as PDF. 

To install for both the i386 and x64 versions of R:
\code{devtools::install_github("But-I-Digress/rDOM")}

To install for just the version of R that is running:
\code{devtools::install_github("But-I-Digress/rDOM", args = "--no-multiarch")}
}
\examples{
\dontrun{

dom <- createDocument()
root <- appendChild(dom$createElement("root"))
root$setAttribute("some", "value")
printDocument(dom)
}

}
\seealso{
Useful links:
\itemize{
  \item \url{https://github.com/But-I-Digress/rDOM}
}

}
\author{
\strong{Maintainer}: Charles Scheid \email{charleshscheid@gmail.com}

}
