# Usage: awk -f gen2mgf.awk 22.gen > 22.mgf
BEGIN {
    fc=0; # Flipped count
}

{
    sum=0; # Dosage sum for single SNP
    snp=$2
    pos=$3
    a=$4
    b=$5
    sumb=0
    for(i=6; i<=NF; i=i+3){
	sumb+=$(i+2)*2+$(i+1);
    }
    # If dosage for allele B exceed sample count i.e., AF for B is > 0.5
    printf "%s", snp
    if(sumb>((NF-5)/2)){
	printf ",%s,%s", a,b
	fc+=1
	for(i=6; i<=NF; i+=3){ 
	    printf ",%0.2f", $(i)*2+$(i+1);
	}
    }
    else{
	printf ",%s,%s", b,a
	for(i=6; i<=NF; i+=3){
	    printf ",%0.2f", $(i+2)*2+$(i+1);
	}
    }
    printf "\n"
}
END {
    print "Total: ", NR > "/dev/stderr";
    print "Flipped: ",fc > "/dev/stderr";
}