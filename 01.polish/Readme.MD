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
```
Nextpolish2   
```
XXXX
```

# HiFi only
