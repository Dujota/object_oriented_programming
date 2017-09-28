#
# Start a new project (create a new subfolder) and add a new file called "paperboy.rb". Run your program and commit your work after each step.
#
# Each paperboy should have several attributes:
#
# Name
# Experience (the number of papers they've delivered)
# Earnings (amount of money they've earned)
# This needs to be read-only!
# Every day, each paperboy is given a house number to start at and a house number to finish at. They get paid $0.25 for every paper they deliver and $0.50 for every paper over their quota. If at the end of the day they haven't met their quota, they lose $2.
#
# The minimum number of papers to deliver is 50. The quota is calculated as half of your experience added to the minimum. So the first time a paperboy makes a delivery, the quota is 50. The next time, the quote is 50 plus half the number of papers that the paperboy has delivered in the past. In this way the quota should increase after every delivery the paperboy makes.
#
# Each paperboy should have at least these methods:
#
# quota
# This method should calculate and return the paperboy's quota for his next delivery
# deliver(start_address, end_address)
# This method will take two house numbers and return the amount of money earned on this delivery as a floating point number. It should also update the paperboy's experience!
# Let's assume that the start_address is always a smaller number than the end_address
# As a stretch exercise you can figure out how to ensure it still works if the above assumption isn't met!
# report
# This method should return a string about the paperboy's performance
# e.g. "I'm Tommy, I've delivered 90 papers and I've earned $38.25 so far!"

#

require 'pry'

class Paperboy
  def initialize(name)
    @name = name
    @experience = 0
    @earnings = 0.0
    @quota = 50
  end

#need a start and end point, find out the total # of deliveries by subtracting the start point from the end point
#with that value update @experience.
#then check the value of @experience against the quota to find out earnings
#use if to go through the possibilities and multiply them by the earning amount


#we need to capture earnings in a variable in order to return it and not rund earnings function again on the new updated Experience.

# we have to update experience so that the next delviery will capture the carry over amount on quota method so that the earnings function will calculate the next delivery accurate
  def deliver(start_address, end_address)
    earn = earnings
    @experience = (end_address - start_address) + 1
    return earn
  end

  def earnings
    # binding.pry
    if @experience == quota
      puts 'test2'
      @earnings = @experience * 0.25
    elsif @experience > quota
      puts "@experience > 50"
      @earnings = (quota * 0.25) + ((@experience-quota)*0.5)
    else
      puts '@experience < 50'
      @earnings = (@experience * 0.25 )- 2.0
    end
  end

  def quota
    quota = (@experience/2)+ @quota

  end





  def report
    puts "I'm #{@name}, I've delivered #{@experience} papers and I've earned $#{@earnings} so far!"
  end




end




tommy = Paperboy.new("Tommy")

puts tommy.quota # => 50
puts tommy.deliver(101, 160) # => 17.5
puts tommy.earnings #=> 17.5
puts tommy.report # => "I'm Tommy, I've delivered 60 papers and I've earned $17.5 so far!"

puts tommy.quota # => 80
puts tommy.deliver(1, 75) # => 16.75
puts tommy.earnings #=> 34.25
puts tommy.report # => "I'm Tommy, I've been delivered 135 papers and I've earned $34.25 so far!"




# Here's some sample code, using your Paperboy class:
#
# tommy = Paperboy.new("Tommy")
#
# tommy.quota # => 50
# tommy.deliver(101, 160) # => 17.5
# tommy.earnings #=> 17.5
# tommy.report # => "I'm Tommy, I've delivered 60 papers and I've earned $17.5 so far!"
#
# tommy.quota # => 80
# tommy.deliver(1, 75) # => 16.75
# tommy.earnings #=> 34.25
# tommy.report # => "I'm Tommy, I've been delivered 135 papers and I've earned $34.25 so far!"
