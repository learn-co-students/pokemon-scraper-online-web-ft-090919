require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db 
  def initialize(pokemon)
    #binding.pry
    @id = id 
    @name = name 
    @type = type 
    @db = db 
  end 
  
   def self.save (name, type, db)
      sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
      SQL
      
      db.execute(sql, name, type)
    end
    
    def self.find(id, db)
      sql = <<-SQL 
      SELECT * FROM pokemon
      WHERE id = ?
      LIMIT 1 
      SQL
      row = db.execute(sql, id)
      new_pokemon = Pokemon.new(row) 
    
      new_pokemon.id = row[0][0]
      new_pokemon.name = row[0][1]
      new_pokemon.type = row[0][2]
      new_pokemon
      
    end
  
  
end
