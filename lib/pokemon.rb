class Pokemon
    attr_accessor :name, :type, :db
    attr_reader :id

    def initialize(id: nil, name:, type:, db:)
        @id = id
        @name = name
        @type = type
    end

    def self.save(name, type, db)
         sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
         db.execute(sql, name, type)
    end

    def self.find(id, db)
        sql = <<-SQL
            SELECT * FROM pokemon
            WHERE id = ?
        SQL
        new_pokemon = nil
        db.execute(sql, id).map do |row| 
          new_pokemon = Pokemon.new(id: row[0], name: row[1], type: row[2], db: db)
        end
        new_pokemon
    end
    
end
