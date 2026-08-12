#Bioconductor

if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install(version = "3.23")
install.packages("BiocManager")
BiocManager::install(c("GenomicFeatures", "AnnotationDbi"))
BiocManager::available()
BiocManager::install()
if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::valid()
library(BiocManager)

BiocManager::install("Biostrings")
library(Biostrings)
b <- BString("I am a BString object")
b
str(b)
length(b)
d <- DNAString("TTGAAAA-CTC")
d
str(b)
length(d)
d[1:3]
b[length(d):1]

