class BTreeSort
  attr_accessor :payload, :left, :right

  def initialize(payload, left, right)
    @payload = payload
    @left = left
    @right = right
    
  end

  def self.sort(array)
    root = BTreeSort.new(array.shift, nil, nil)

    while array.any? do
      self.insert(root,array.shift)
    end

    return root
  end

  def self.insert(root,val)
    return BTreeSort.new(val,nil,nil) if root.nil? 
    if val < root.payload then
      root.left = self.insert(root.left,val)
    elsif val > root.payload then
      root.right = self.insert(root.right,val)
    end
    return root
  end

=begin
  def output() 
    _output(self)
    puts ""
  end

  def _output(root,ws=0)
    return if root.nil?
    ws += 5
    _output(root.right,ws)
    puts ""
    (5..ws).each { print(" ") }
    print(root.payload)
    _output(root.left,ws)
  end
  # (p l r)
  def to_sexp()
    puts _to_sexp(self)
  end

  def _to_sexp(r) 
    return "nil" if r.nil?
    return "(#{r.payload} #{_to_sexp(r.left)} #{_to_sexp(r.right)})"
  end
=end

  def to_a
    return _to_a(self)
  end

  def _to_a(root)
    return [] if root.nil?
    return _to_a(root.left) + [root.payload] + _to_a(root.right)
  end

end

