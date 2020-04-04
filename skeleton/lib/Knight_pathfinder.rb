require_relative "00_tree_node"

class KnightPathFinder
    attr_accessor :position
    def self.root_node
        starting_pos = PolyTreeNode.new(@position)
    end

    def self.valid_moves(position)
        row, col = position
        grid = Array.new(8){Array.new(8,"X")}
        valid_moves_array = []
  
        if (row-2 < 8 && row-2 >= 0) && (col+1 <8 && col+1 >=0)
            valid_moves_array << [row-2, col+1]
        end

        if (row+2 < 8 && row+2 >= 0) && (col+1 <8 && col+1 >=0)

            valid_moves_array << [row+2, col+1]
        end

        if (row+1 < 8 && row+1 >= 0) && (col+2 <8 && col+2 >=0)
        
            valid_moves_array << [row+1, col+2]
        end

        if (row-1 < 8 && row-1 >= 0) && (col+2 <8 && col+2 >=0)
      
            valid_moves_array << [row-1, col+2]
        end

        if (row-2 < 8 && row-2 >= 0) && (col-1 <8 && col-1 >=0)
            valid_moves_array << [row-2, col-1]
        end
 
        if (row-1 < 8 && row-1 >= 0) && (col-2 <8 && col-2 >=0)
            valid_moves_array << [row-1, col-2]
        end

        if (row+1 < 8 && row+1 >= 0) && (col-2 <8 && col-2 >=0)
            valid_moves_array << [row+1, col-2]
        end
    
        if (row+2 < 8 && row+2 >= 0) && (col-1 <8 && col-1 >=0)
            valid_moves_array << [row+2, col-1]
        end

        valid_moves_array
    end



    def initialize(position)
        @position = position
        self.root_node = PolyTreeNode.new(position)
        self.build_move_tree
        @considered_positions = [position]
     end

    def new_move_positions(position)
        # debugger
        valid_moves_array = KnightPathFinder.valid_moves(position)
        valid_moves_array.each do |move|
            if !@considered_positions.include?(move)
                @considered_positions << move
            end
        end
        @considered_positions
    end

    def build_move_tree
        root = KnightPathFinder.root_node
        self.new_move_positions(root.position)
    end
end

k1 = KnightPathFinder.new([0,0])
p k1.considered_positions
p k1.new_move_positions([0,0])