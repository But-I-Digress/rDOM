

#'@export 
FOtoPDF <- function (doc, path, config.path=getOption("FOP.config.path")) rJava::.jnew("rDOM")$FOtoPDF(doc, rJava::.jnew("java/lang/String", path), rJava::.jnew("java/lang/String", config.path))