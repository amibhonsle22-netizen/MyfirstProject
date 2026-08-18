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

DNAseq = DNAString("GTACCTGACAAGCTACATCGCATGCAATTAG")
length(DNAseq)
subseq(DNAseq, 3, 6)

#Extract consecutive codons
codons_set1 <- codons(DNAseq)
codons_set2 <- codons(DNAseq[2:length(DNAseq)])
codons_set3 <- codons(DNAseq[3:length(DNAseq)])
print(codons_set1)
print(codons_set2)
print(codons_set3)
codons_set

#Overlapping 3-mer frequencies(step-1)
all_counts <- trinucleotideFrequency(DNAseq, step = 1)
all_counts

#FastQ and Fasta
BiocManager::install("ShortRead")
library(Biostrings)
library(ShortRead)

getwd()
setwd()

#Create a DNAstrings manually
my_seqs <- DNAStringSet(c("ATGCATCGTCTC", "CTACTGATCGGTCG"))
names(my_seqs) <- c("Seq1_geneA", "Seq2_geneB")

#Export
writeXStringSet(my_seqs, filepath = "sequence.fasta")
DNAseq <- readDNAStringSet("sequence.fasta")

#Read FASTA files
DNAseq <- readDNAStringSet("C:/Users/Ami Mukesh Bhonsle/Downloads/sequence.fasta")
DNAseq
names(DNAseq)

#Acess sequence lengths and individual elements
width(DNAseq)
first_seq <- DNAseq[[1]]

#Construct a Shortread () Object
my_reads <- ShortReadQ(
  sread = DNAStringSet(c("ATCG", "ACTG")),
  quality = BStringSet(c("IIII", "I#II")),
  id = BStringSet(c("Read1", "Read2"))
)

#Global and Pairwise alignment
BiocManager::install("pwalign")
library(Biostrings)
library(pwalign)
#Define target sequence vectors
pattern_seq <- DNAString("ATCGGCATCTAG")
subject_seq <- DNAString("ACTGCATGCATG")
#Execute Global Alignment (Needleman-Wunsch)
global_aln <- pairwiseAlignment(
  pattern = pattern_seq,
  subject = subject_seq,
  type = "global"
)
print(global_aln)
#Execute Local Alignment (Smith-Waterman)
local_aln <- pairwiseAlignment(
  pattern = pattern_seq,
  subject = subject_seq,
  type = "local"
)
print(local_aln)


