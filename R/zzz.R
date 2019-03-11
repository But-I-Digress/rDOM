
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