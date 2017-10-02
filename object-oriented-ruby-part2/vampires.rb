class Vampire

  #-------CLASS ARRAY-----
  @@coven = []
  attr_accessor :name, :age, :in_coffin, :drank_blood_today

  def initialize(name, age)
    @name = name
    @age = age
    @in_coffin = true
    @drank_blood_today = true
  end
#CLASS Methods---------------------
  def self.create(name, age)
    @@coven << Vampire.new(name, age)
    return @@coven.last
  end

  def self.coven
    @@coven
  end

  def self.sunrise
    return false unless drink_blood || in_coffin
    @@coven.delete(self)
    @@coven
  end

  def self.sunset
    @@coven.each { |vampire|
      vampire.drank_blood_today = false
      vampire.in_coffin = false
    }
    return @@coven
  end

#INSTANCE METHODS--------------------------
  def drink_blood
    @drank_blood_today = true
  end

  def go_home
    in_coffin = true
  end

end


Vampire.create("Morty", 107)
Vampire.create("Juan", 99)
Vampire.create("Mary", 33)
Vampire.create("Lola", 139)
p Vampire.coven
p "-------------------------"
Vampire.coven[0].drink_blood
Vampire.coven[1].go_home
p Vampire.coven
p "-------------------------"
Vampire.sunrise
p Vampire.coven
