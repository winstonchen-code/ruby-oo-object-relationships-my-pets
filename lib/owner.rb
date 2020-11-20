# class Owner
#   attr_reader :name
#   # code goes here
#   def name
#   end

# end

class Owner
  attr_accessor :pets
  attr_reader :species, :name, :cat
  
  @@all = []

  def initialize(name)  
    @name = name
    @species = "human"
    @pets = []
    @@all << self
  end 

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length 
  end

  def self.reset_all
    @@all.clear
  end

  def pets
      @@pets
    end
  
  def cats
    @@pets[:cats]
  end

  def cats 
    Cat.all.select {|cat| cat.owner == self} 
  end

  #Cat.all.select do |cat| 
  #cat.owner == self

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(cat)
    Cat.new(cat, self)
  end

  def buy_dog(dog)
    Dog.new(dog, self)
  end

  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = "happy"
    end
  end
  
  def feed_cats
    self.cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    self.dogs.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
    self.dogs.clear
    self.cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
    self.cats.clear
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end

# class Owner
#   attr_reader :species
#   attr_accessor :name, :pets, :fish, :dog, :cat

#   @@all = []
#   @@pets = {:fishes => [], :dogs => [], :cats => []}

#   def initialize(species)
#     @species = species
#     @name = name
#     @@all << self
#   end

#   def pets
#     @@pets
#   end

#   def buy_fish(fish)
#     @@pets[:fishes] << Fish.new(fish)
#   end

#   def buy_cat(cat)
#     @@pets[:cats] << Cat.new(cat)
#   end

#   def buy_dog(dog)
#     @@pets[:dogs] << Dog.new(dog)
#   end

#   def walk_dogs
#     @@pets[:dogs].each do |dog|
#       dog.mood = 'happy'
#     end
#   end

#   def play_with_cats
#     @@pets[:cats].each do |cat|
#       cat.mood = 'happy'
#     end
#   end

#   def feed_fish
#     @@pets[:fishes].each do |fish|
#       fish.mood = 'happy'
#     end
#   end

#   def list_pets
#     "I have #{pets[:fishes].length} fish, #{pets[:dogs].length} dog(s), and #{pets[:cats].length} cat(s)."
#   end

#   def sell_pets
#     pets.each do |pet, arr|
#       arr.map do |pet|
#         pet.mood = 'nervous'
#       end
#       arr.clear
#     end
#   end

# end