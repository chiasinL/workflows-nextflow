//process_script_params.nf
nextflow.enable.dsl=2

process COUNT_BASES {

 script:
 """
 zgrep -v  '^>'   ${projectDir}/data/yeast/transcriptome/Saccharomyces_cerevisiae.R64-1-1.cdna.all.fa.gz|grep -o A|wc -l   
 """
}

workflow {
  COUNT_BASES()
}
