#' createDocument
#'
#' Create a DOM document.
#' 
#' @return The document as an \code{\link{rJava}} object.  
#'
#' @export
createDocument <- function () rJava::.jnew("rDOM")$getDocument()

#' printDocument
#'
#' Print a DOM document.
#'
#' @param doc An \code{\link{rJava}} object representing the document.
#' 
#' @return A string representation of the document.
#'
#' @export
printDocument <- function (doc) print(rJava::.jnew("rDOM")$toString(doc))

#' saveDocument
#' 
#' Save a DOM document to a file.
#'
#' @param doc An \code{\link{rJava}} object representing the document.
#' @param path File path and name for the resulting file.
#' 
#' @export
saveDocument <- function (doc, path) rJava::.jnew("rDOM")$toFile(doc, rJava::.jnew("java/lang/String", path))