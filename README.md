# rDOM

**An R implementation of the W3C Document Object Model.**

This package makes the Java implementation of the W3C DOM available to R. 

## Installation

```r
# To install for both the i386 and x64 versions of R:
devtools::install_github("But-I-Digress/rDOM")

# To install for just the version of R that is running:
devtools::install_github("But-I-Digress/rDOM", args = "--no-multiarch")
```

## Example

```r

library(rDOM)

dom <- createDocument()
root <- appendChild(dom$createElement("root"))
root$setAttribute("some", "value")
printDocument(dom)
```