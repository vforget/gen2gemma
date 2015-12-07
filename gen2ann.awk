## Usage: awk -v chrom=22 -f gen2ann.awk 22.gen > 22.ann
{
    snp=$2
    pos=$3
    print snp","pos","chrom
}