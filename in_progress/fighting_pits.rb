#https://www.hackerrank.com/challenges/fighting-pits/problem
# started 12/23/17

class Team

  @@number_of_teams = 0
  attr_accessor :team_number, :lineup

  def initialize
    @@number_of_teams += 1
    @team_number = @@number_of_teams
    @lineup = []
  end

  def sort_fighters
    @lineup.sort!
  end

  def add(fighter)
    @lineup << fighter
    self.sort_fighters
  end
end

def fight_simulator(x, y)
  x_lineup = x.lineup.dup
  y_lineup = y.lineup.dup
  while true
    fighter = x_lineup[-1]
    fighter.times {y_lineup.pop}
    if y_lineup.empty?
      return x.team_number
    end
    fighter = y_lineup[-1]
    fighter.times {x_lineup.pop}
    if x_lineup.empty?
      return y.team_number
    end
  end
end


input_count, team_count, masters_inputs = gets.strip.split(' ').map(&:to_i)

#populate list with teams
team_list = []
team_count.times do
  team_list << Team.new
end

#first set of team inputs
input_count.times do
  fighter, team = gets.strip.split(' ').map(&:to_i)
  team_list[team - 1].lineup << fighter
end

# initial team sort before strt of Masters query
team_list.each {|x| x.sort_fighters}

# Masters inputs
masters_inputs.times do
  three_input = gets.strip.split(' ').map(&:to_i)
  if three_input[0] == 1
    fighter, team = three_input[1], three_input[2] -1
    team_list[team].add(fighter)
  else
    x, y = three_input[1] - 1, three_input[2] -1
    puts fight_simulator(team_list[x], team_list[y])
  end
end
