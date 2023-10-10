Racon + Merfin  
```
git clone https://github.com/isovic/racon.git
cd racon
git checkout -b liftover origin/liftover
git checkout remotes/origin/liftover

```
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
