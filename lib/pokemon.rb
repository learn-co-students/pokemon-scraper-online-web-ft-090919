class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(id: nil, name: nil, type: nil, db: nil)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save (name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type)
            VALUES (?, ?);
        SQL

        db.execute(sql, name, type)
    end

    def self.find(id, db)
        sql = <<-SQL
            SELECt * FROM pokemon WHERE id = ?;
        SQL

        pokemon = nil
        db.execute(sql, id).map do |row|
            pokemon = Pokemon.new(id: row[0], name: row[1], type: row[2])
        end
        pokemon
    end
end
