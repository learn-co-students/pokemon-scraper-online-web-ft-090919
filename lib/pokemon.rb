class Pokemon
  attr_reader :id, :name, :type, :db

  def initialize (id:, name:, type:, db:)
    @id = id 
    @name = name 
    @type = type 
    @db = db
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL

    id = db.execute(sql, [name, type])
    self.new(id: id, name: name, type: type, db: db)
  end
  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    name = pokemon[1]
    type = pokemon[2]


    pokemon_inst = Pokemon.new(id: id, name: name, type: type, db: db)
  end
end