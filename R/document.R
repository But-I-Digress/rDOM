

#'@export
createDocument <- function () rJava::.jnew("rDOM")$getDocument()

#'@export
printDocument <- function (doc) rJava::.jnew("rDOM")$toString(doc)

#'@export
saveDocument <- function (doc, path) rJava::.jnew("rDOM")$toFile(doc, rJava::.jnew("java/lang/String", path))