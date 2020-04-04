require "byebug"
class PolyTreeNode

    attr_accessor :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(parent_node)
        return @parent = nil if parent_node == nil
        self.parent.children.delete(self) if !self.parent.nil? 
        if !(parent_node.children.include?(self)) 
            parent_node.children << self
        end
         @parent = parent_node
    end

    def add_child(child_node)
        @children << child_node
        child_node.parent = self
    end

    def remove_child(child_node)
        if !self.children.include?(child_node)
            raise "node is not a child!"
        end
        child_node.parent = nil
    end

    def dfs(target_value)
    # debugger
        return self if self.value == target_value
        # return nil if children.empty?
        
        self.children.each do |child|
            result =  child.dfs(target_value)
            return result if !result.nil?
        end
        return nil
    end

    def bfs(target_value)
        queue = [self]
        until queue.empty?
            first_node = queue.shift
            return first_node if first_node.value == target_value
            queue += first_node.children
        end
        return nil
    end
end



