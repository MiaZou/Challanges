class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end

  def dfs(root, needle)
    return root if root.payload == needle
    if root.children.any? then
      root.children.each do |child|
        r = dfs(child, needle)
        return r if r
      end
    end
    return nil
  end

  def bfs(root, needle)
    queue = [root]
    while ! queue.empty? do
      current = queue.shift()
      return current if current.payload == needle
      if current.children.any? then
        current.children.each do |child|
          queue.push(child)
          return queue
        end
      end
    end
    return nil
  end

end


# The "Leafs" of a tree, elements that have no children
deep_fifth_node = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])

# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [deep_fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
shallow_fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk   = Tree.new(2, [seventh_node, shallow_fifth_node])

puts trunk.dfs(trunk, 11).inspect
puts trunk.dfs(trunk, 2).inspect
puts trunk.dfs(trunk, 9).inspect

puts trunk.bfs(trunk, 11).inspect
puts trunk.bfs(trunk, 2).inspect
puts trunk.bfs(trunk, 9).inspect
