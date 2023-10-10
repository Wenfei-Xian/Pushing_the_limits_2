# illumina + HiFi   

Using two state-of-the-art software tools, combining both short-read and long-read data, we evaluated the QV of the genome assembly.   

Racon (liftover branch)  
```
git clone https://github.com/isovic/racon.git
cd racon
git checkout -b liftover origin/liftover
git checkout remotes/origin/liftover
```
[Racon+Merfin](https://github.com/arangrhie/T2T-Polish/tree/master/automated_polishing)
```
k=19
thread=64
# Construct k-mer db
meryl count k=${k} threads=${thread} Col-0.PCRfree.clean.*.fastq.gz output reads.meryl

# Collect histogram for GenomeScope
meryl histogram reads.meryl > reads.hist

# Exclude frequency = 1 k-mers
meryl greater-than 1 reads.meryl output reads.gt1.meryl

bash automated-polishing.sh ${thread} 1 Col-0.bp.p_ctg.gfa.fa Col-0.q20.fastq.gz reads.gt1.meryl racon.meryl
#-peak 106.7 need to be modified
#bam file generated in this step will be used in the following tools.
samtools view -h racon.meryl.iter_1.falconc.sam |samtools sort -@12 -o racon.meryl.iter_1.falconc.sorted.bam -
```
[Nextpolish2](https://github.com/Nextomics/NextPolish2)
```
yak count -o 21.yak -k 21 -b 37 <(zcat Col-0.PCRfree.clean.*gz)  <(zcat Col-0.PCRfree.clean.*gz)
yak count -o 31.yak -k 31 -b 37 <(zcat Col-0.PCRfree.clean.*gz)  <(zcat Col-0.PCRfree.clean.*gz)
nextPolish2 -t 8 racon.meryl.iter_1.falconc.sorted.bam ../Col-0.bp.p_ctg.gfa.fa 21.yak 31.yak > Col-0.bp.p_ctg.gfa.fa.nextpolish2.fa
```

# HiFi only

[Racan](https://github.com/lbcb-sci/racon)

[Pilon](https://github.com/broadinstitute/pilon)

[Nextpolish1](https://github.com/Nextomics/NextPolish)

[Inspector](https://github.com/Maggi-Chen/Inspector)
