
.onAttach <- function (libname, pkgname) {
    jversion <- rJava::.jcall("java.lang.System", "S", "getProperty", "java.version")
    if (jversion < "1.5.0") stop(paste("Your java version is ", jversion, ".  Need 9.0.1 or higher.", sep = ""))
}

.onLoad <- function (libname, pkgname) {
	rJava::.jpackage(pkgname)
	if(requireNamespace("FOPjars", quietly = TRUE)) {
		rJava::.jpackage("FOPjars")	
		options("fop.config.path" = getOption("fop.config.path", default = system.file("conf", "fop.xconf", package = "FOPjars")))
	}
}