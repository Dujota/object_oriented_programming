class Zombie
  @@horde = []
  @@plague_level = 10

  #---constants----
    MAX_SPEED = 5
    MAX_STRENGTH = 8
    DEFAULT_SPEED = 1
    DEFAULT_STENGHT = 3

attr_accessor :speed, :strength

  def initialize(speed, strength)
    @speed =
    if speed > MAX_SPEED
      @speed = DEFAULT_SPEED
    else
      speed
    end

    if strength <= MAX_STRENGTH
      @strength = DEFAULT_STENGHT
    else
      strength
    end
  end

#one line if statements : terniary statements
#check marian's git hub for the short hand for this
# @speed = speed > MAX_SPEED ? DEFAULT_SPEED : speed
# @strength = strength <= MAX_STRENGTH ? DEFAULT_STENGHT : strength

# --------Class Methods

  def self.all
    @@horde
  end

  def self.new_day
    some_die_off
    spawn
    increase_plague_level
  end

  def self.some_die_off
    random_number = rand(1..10).to_i
    # random_number.times { all.pop } -- using pop
    @@horde = all.drop(random_number)
  end
  # This class method should use @@plague_level to generate a random number and then create that number of new zombies, adding each one to @@horde. Use @@max_speed and @@max_strength to generate random values for each new zombie's speed and strength.
  def self.spawn
    spawned = rand(1..@@plague_level) ### this can return 0, therefore value of array is nil!!!!!!!!! started at range of 1 to fix this issue
    spawned.to_i.times do ## needed to convert the rand into integer
      Zombie.all << Zombie.new(rand(MAX_SPEED), rand(MAX_STRENGTH))
    end
  end

  def self.increase_plague_level
    increase = rand(1..2).to_i
    @@plague_level =+increase
  end

#---------INSTANCE METHODS -------
  def outrun_zombie?
    my_speed = rand(1..MAX_SPEED).to_i
    if my_speed > @speed
      true
    else
      false
    end
  end

  def survive_attack?
    my_strength = rand(1..MAX_STRENGTH).to_i
    if my_strength > @strength
      true
    else
      false
    end
  end


  def encounter
    if outrun_zombie? == true
      return puts "escaping unscathed "
    elsif survive_attack? == false
      return puts 'being killed by the zombie'
    else
      puts "you are infected and became a zombie"
      Zombie.all << Zombie.new(rand(1..MAX_SPEED), rand(1..MAX_STRENGTH))
    end
  end

end


puts Zombie.all.inspect # []
Zombie.new_day
puts Zombie.all.inspect # [#<Zombie:0x005626ecc5ebd0 @speed=4, @strength=0>, #<Zombie:0x005626ecc5eba8 @speed=0, @strength=4>, #<Zombie:0x005626ecc5eb80 @speed=4, @strength=4>]
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
puts zombie1.encounter # You are now a zombie
puts zombie2.encounter # You died
puts zombie3.encounter # You died
Zombie.new_day
puts Zombie.all.inspect # [#<Zombie:0x005626ecc5e1f8 @speed=0, @strength=0>, #<Zombie:0x005626ecc5e180 @speed=3, @strength=3>, #<Zombie:0x005626ecc5e158 @speed=1, @strength=2>, #<Zombie:0x005626ecc5e090 @speed=0, @strength=4>]
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
puts zombie1.encounter # You got away
puts zombie2.encounter # You are now a zombie
puts zombie3.encounter # You died
