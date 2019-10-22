class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
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

        db.execute(sql, name, type)
   end

   def self.find(id, db)
    sql = <<-SQL
      SELECT *
      FROM pokemon
      WHERE id = ?
    SQL

    info = db.execute(sql, id).flatten
    Pokemon.new(
    id: info[0],
    name: info[1],
    type: info[2],
    db: db
    )
  end

end
