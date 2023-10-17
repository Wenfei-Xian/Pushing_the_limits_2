# Pushing_the_limits_2
Pushing the limits of Pacbio HiFi data

# Motivation   
I want to investigate the upper limit of genome assembly quality achievable using only PacBio HiFi data.   
I will evaluate from three perspectives: 1) Accuracy, 2) Contiguity, and 3) Completeness.   

## Genome assembly   
The genome was assembled using Hifiasm.   

## Accuracy   
Initially, we combined Illumina data with HiFi data and employed two state-of-the-art polishing tools (NextPolish2 and Racon+Merfin) to achieve the current best QV value.

## Idea
Initially, DeepVariant was employed to identify potential assembly errors.   
Why is reassembly needed in the telomere region?   
When the length of the telomere region in an assembly is long enough, aligners may not fully align the reads to the genome, resulting in soft clipping.   
![soft-clip](https://github.com/Wenfei-Xian/Pushing_the_limits_2/blob/main/Soft_clip_in_telomere.png)
