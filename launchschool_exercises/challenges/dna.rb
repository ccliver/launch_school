class DNA
  def initialize(strand)
    @strand = strand
  end 

  def hamming_distance(distance)
    hamming = 0
    0.upto(@strand.length < distance.length ? @strand.length - 1 : distance.length - 1).each do |idx|
      hamming += 1 unless @strand[idx] == distance[idx]
    end
    hamming
  end
end
