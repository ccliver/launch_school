class InvalidCodonError < StandardError
end

class Translation
  PROTEIN_MAP = {
    'AUG' => 'Methionine',
    'UUU' => 'Phenylalanine', 'UUC' => 'Phenylalanine',
    'UUA' => 'Leucine', 'UUG' => 'Leucine',
    'UCU' => 'Serine', 'UCC' => 'Serine', 'UCA' => 'Serine', 'UCG' => 'Serine',
    'UAU' => 'Tyrosine', 'UAC' => 'Tyrosine',
    'UGU' => 'Cysteine', 'UGC' => 'Cysteine',
    'UGG' => 'Tryptophan',
    'UAA' => 'STOP', 'UAG' => 'STOP', 'UGA' => 'STOP'
  }.freeze

  def self.of_codon(codon)
    PROTEIN_MAP[codon]
  end

  def self.of_rna(strand)
    nucleotides = strand.chars
    proteins = []
    while nucleotides.length > 0
      codon = nucleotides.shift(3).join

      raise InvalidCodonError unless PROTEIN_MAP.keys.include?(codon)

      return proteins if PROTEIN_MAP[codon] == 'STOP'
      proteins << PROTEIN_MAP[codon]
    end
    proteins
  end
end
