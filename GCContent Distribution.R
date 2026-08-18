library(Biostrings)
library(tidyverse)
library(patchwork)
BiocManager::install("patchwork")
library(patchwork)

seq1 <- DNAString("ATCGGACTA")
length(seq1)
width(seq1)
letterFrequency(seq1, letters = c("G", "C"))
letterFrequency(seq1, letters = "GC", as.prob = TRUE)

#Set seed for reproductive simulations
set.seed(42)

n_reads <- 5000

seq_data <- tibble(
  Illumina = rnorm(n_reads, mean = 150, sd = 2),
  Nanopore = rlnorm(n_reads, meanlog = 8.5, sdlog = 0.6)
) %>%
  pivot_longer(
    cols = everything(),
    names_to = "Platform",
    values_to = "Length"
  )
head(seq_data)

ggplot(seq_data, aes(x = Length, fill = Platform)) +
  geom_histogram(bins = 50, alpha = 0.6, position = "identity") +
  scale_x_log10() +
  theme_minimal() +
  labs(
    title = "Sequence Length Distribution by Platform",
    x = "Read Length (bp, log10 scale)",
    y = "Count"
  )


chr_region1 <- sample(DNAString("AT"), 20000, replace = TRUE)
chr_island  <- sample(DNAString("GC"), 10000, replace = TRUE) # GC-rich region
chr_region2 <- sample(DNAString("AT"), 20000, replace = TRUE)

chromosome <- c(chr_region1, chr_island, chr_region2)

calc_sliding_gc <- function(seq, window_size = 1000, step_size = 200) {
  seq_len <- length(seq)
  starts  <- seq(1, seq_len - window_size + 1, by = step_size)

  gc_values <- map_dbl(starts, function(start_pos) {
    sub_seq <- subseq(seq, start = start_pos, width = window_size)
    # Calculate GC percentage
    letterFrequency(sub_seq, letters = "GC", as.prob = TRUE) %>% sum()
  })

  tibble(
    Position = starts + (window_size / 2),
    GC_Content = gc_values
  )
}

gc_profile <- calc_sliding_gc(chromosome, window_size = 1000, step_size = 200)

# Plot GC Profile
ggplot(gc_profile, aes(x = Position, y = GC_Content)) +
  geom_line(color = "steelblue", linewidth = 0.8) +
  geom_hline(yintercept = mean(gc_profile$GC_Content), linetype = "dashed", color = "red") +
  theme_light() +
  labs(
    title = "Sliding-Window GC Content Profile",
    subtitle = "Window Size = 1000bp, Step Size = 200bp",
    x = "Genomic Position (bp)",
    y = "GC Proportion"
  )

# Statistical Inference & Bootstrapping ----
# Population of window GC values
sample_gc <- gc_profile$GC_Content

# Bootstrap 1,000 replicate sample means
num_bootstraps <- 1000
boot_means <- map_dbl(1:num_bootstraps, ~ {
  sample(sample_gc, size = length(sample_gc), replace = TRUE) %>% mean()
})

boot_df <- tibble(boot_mean = boot_means)

# Calculate 95% Percentile Confidence Interval
ci_bounds <- quantile(boot_means, probs = c(0.025, 0.975))
print(ci_bounds)

# Visualize Sampling Distribution
ggplot(boot_df, aes(x = boot_mean)) +
  geom_histogram(bins = 30, fill = "cadetblue", color = "white") +
  geom_vline(xintercept = ci_bounds, linetype = "dotted", color = "darkred", linewidth = 1) +
  theme_minimal() +
  labs(
    title = "Bootstrap Distribution of Mean GC Content",
    subtitle = "Red dotted lines indicate 95% Percentile Confidence Interval",
    x = "Sample Mean GC Content",
    y = "Frequency"
  )
