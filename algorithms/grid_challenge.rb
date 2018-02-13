#https://www.hackerrank.com/challenges/grid-challenge/problem
#completed 12/22/17

class Board
    attr_accessor :size, :data

    def initialize(size)
        @size = size
        @data = []
    end

    def insert_row(row)
        @data << row
    end

    def sort
        self.data.map! {|x| x.sort}
    end

    def print
        self.data.each {|x| puts x.join("")}
    end
    
    def lexographic
        self.data.each_with_index do |row,i|
            next_row = self.data[i + 1]
            if next_row
                row.each_with_index do |char,j|
                    if char > next_row[j]
                        return "NO"
                    end
                end
            end
        end
        
        "YES"
    end
                    
                
end

n = gets.strip.to_i
n.times do 
    size = gets.strip.to_i
    board =  Board.new(size)
    size.times {board.insert_row(gets.strip.split(""))}
    board.sort
    puts board.lexographic
end
