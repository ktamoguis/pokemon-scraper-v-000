require 'pry'

class Pokemon

  attr_accessor :id, :name, :type, :hp, :db;

  @@all = []

  def initialize(hash)
    @id = hash[:id]
    @name = hash[:name]
    @type = hash[:type]
    if !hash[:hp].nil?
      @hp = hp
    end
    @@all << self
  end

  def self.save(name, type, db)
    #self.new
    #id = @@all.count
    db.execute("INSERT INTO pokemon(name, type) VALUES ('#{name}', '#{type}')")

    #binding.pry
  end

  def self.find(id, db)
    #@@all.detect { |element| element = db.execute("SELECT * FROM pokemon where id = #{id}") }
    #newobject = Pokemon.new
    array = []
    object = {}
    array = db.execute("SELECT * FROM pokemon where id = #{id}")
    object[:id] = array[0][0][0]
    object[:name] = array[0][0][1]
    object[:type] = array[0][0][2]
    object
    binding.pry
  end

  def alter_hp(hp, db)
    #db.execute("UPDATE pokemon SET hp = '#{hp}' WHERE id = '#{self.id}'")
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)

    #db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
    #binding.pry
  end


end
