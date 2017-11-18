
.onAttach <- function (libname, pkgname) {
    jversion <- rJava::.jcall("java.lang.System", "S", "getProperty", "java.version")
    if (jversion < "1.5.0") stop(paste("Your java version is ", jversion, ".  Need 9.0.1 or higher.", sep = ""))
}

.onLoad <- function (libname, pkgname) {
	#rJava::.jpackage(pkgname, lib.loc=libname)
	rJava::.jpackage(pkgname)
	rJava::.jpackage("FOPjars")
	
	#FOP.config.path <- file.path(libname, pkgname, "conf", "fop.xconf") 
	default.config.path <- file.path(libname, "FOPjars", "conf", "fop.xconf")
	FOP.config.folder <- file.path(libname, pkgname, "conf") 
	dir.create(FOP.config.folder, showWarnings=FALSE)
	file.copy(default.config.path, FOP.config.folder)
	
	options(FOP.config.path=file.path(FOP.config.folder, "fop.xconf"))
}

#'@export
createDocument <- function () rJava::.jnew("rDOM")$getDocument()

#'@export
printDocument <- function (doc) rJava::.jnew("rDOM")$toString(doc)

#'@export
saveDocument <- function (dc, path) rJava::.jnew("rDOM")$toFile(doc, rJava::.jnew("java/lang/String", path))

#'@export 
FOtoPDF <- function (doc, path, config.path=getOption("FOP.config.path")) rJava::.jnew("rDOM")$FOtoPDF(doc, rJava::.jnew("java/lang/String", path), rJava::.jnew("java/lang/String", config.path))