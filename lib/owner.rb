class Owner
  attr_reader :name, :species

  @@all = []
  
  def initialize(name)
    @name = name
    @species = "human"
    save
  end

  def save
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name)
    new_cat = Cat.new(name, self)
    new_cat.mood = "happy"
    new_cat
  end

  def buy_dog(name)
    new_dog = Dog.new(name, self)
    new_dog.mood = "happy"
    new_dog
  end

  def walk_dogs
    dogs = self.dogs
    dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    cats = self.cats
    cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    pets = self.cats + self.dogs
    pets.each do |pet| 
      pet.mood = "nervous"
      pet.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

  def self.all
    @@all
  end

  def self.count
    return @@all.length
  end

  def self.reset_all
    @@all.clear
  end

end