#https://www.hackerrank.com/challenges/30-nested-logic/problem

returned = gets.strip.split.map(&:to_i)
due = gets.strip.split.map(&:to_i)

def overdue(ret, due)
    rd, rm, ry = ret
    dd, dm, dy = due
    if dy > ry
        return 0
    elsif dy < ry
        return 10000
    else
        if dm < rm
            return 500 * (rm - dm)
        else
            if dd < rd
                return 15 * (rd - dd)
            else
                return 0
            end
        end       
    end
end

puts overdue(returned, due)
