# Create a class called Player.

# Every player should have four attributes: gold_coins, health_points, and lives.
# lives should start at 5.

# gold_coins should start at 0.

# health_points should start at 10.

# Your class should have an instance method called level_up that increases lives by one.

# Your class should have an instance method called collect_treasure that increases gold_coins by one. If gold_coins is a multiple of ten (eg, 10, 20, 30, and so on) then the collect_treasure method should run the level_up method.

# Your class should have an instance method called do_battle that accepts one damage argument and subtracts it from the player's health_points. If health_points falls below one, subtract one from lives and reset health_points to ten. If you have run out of lives, this method should run another method called restart (see below).

# The restart instance method should set all attributes back to their starting values (5, 0, and 10).

# Don't forget to test out your code every step of the way by creating instances of your class and trying to run your different methods. You should be committing every time you get a new method working.

class Player

  def initialize
    @gold_coins = 0
    @health_points = 10
    @lives = 5
  end

  def level_up
    @lives += 1

  end

  def collect_treasure
    @gold_coins += 1
    if @gold_coins % 10 == 0
      level_up
    end

  end

  def do_battle(damage)
    @health_points -= damage
    if @health_points < 1
      @lives -=1
      @health_points = 10
    elsif @lives == 0
      restart
    end

  end



end


player1 = Player.new


def line_break
  puts '-'*90
end


line_break
puts player1.inspect
puts "you have leveled up therefore your lives is now at #{player1.level_up}"
puts player1.inspect
line_break

puts "lets try to collect some treasure!!!"
7.times {
  player1.collect_treasure
  puts player1.inspect
}
puts player1.inspect
puts
puts "if we collect more than 10 coins, we level up!!! :D"
10.times {
  player1.collect_treasure.inspect
  puts player1.inspect
}


line_break
puts player1.do_battle(10)
puts player1.inspect
puts player1.do_battle(5)
puts player1.inspect
puts player1.do_battle(3)
puts player1.inspect
puts player1.do_battle(50)
puts player1.inspect

5.times {
  player1.do_battle(10)
  puts player1.inspect
}

line_break
