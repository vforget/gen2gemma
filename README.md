# CONVERT IMPUTE2 to GEMMA FORMAT

## REQUIREMENTS

 * Requires file in IMPUTE2 GEN format.
 * Assumes first 5 columns of GEN file are SNP descriptives and not genotype probabilities.
   I.e.: chrom, snpid, pos, alleleA, alleleB
 * Assumes column 6 is first genotype probability 'AA' for first sample.

## CONVERT GEN TO MGF

   This script will also flip genotype probabilities such that dosage reported in MGF 
file is always the minor allele.

Usage:
    awk -f gen2mgf.awk 22.gen > 22.mgf

## CONVERT GEN to ANNOTATION FILE

   Due to chromosome being missing often from GEN format, this script requires you to
specify the chromosome via awk variable.

Usage:
    awk -v chrom=22 -f gen2ann.awk 22.gen > 22.ann