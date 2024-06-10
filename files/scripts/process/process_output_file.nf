//process_output_file.nf


params.transcriptome="${projectDir}/data/yeast/transcriptome/Saccharomyces_cerevisiae.R64-1-1.cdna.all.fa.gz"

process COUNT_CHR_SEQS {
  input:
  val chr

  output:
  path "${chr}_seq_count.txt"

  script:
  """
  zgrep -c '^>Y'$chr $params.transcriptome > ${chr}_seq_count.txt
  """
}
// Both 'Channel' and 'channel' keywords work to generate channels.
// However, it is a good practice to be consistent through the whole pipeline development
chr_ch = channel.of('A'..'P')

workflow {
  COUNT_CHR_SEQS(chr_ch)
  // use the view operator to display contents of the channel
  COUNT_CHR_SEQS.out.view()
}
