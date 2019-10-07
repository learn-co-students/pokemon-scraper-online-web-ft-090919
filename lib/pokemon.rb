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
        pk = db.execute(sql, id).flatten
        self.new(id: pk[0], name: pk[1], type: pk[2], db: db)
    end

    # def self.find(id, db)
    #     sql = <<-SQL
    #     SELECT *
    #     FROM pokemon
    #     WHERE id = ?
    #     SQL
    #     pk = db.execute(sql, id)
    #     pk.map do |row|
    #         self.new(id: row[0], name: row[1], type: row[2], db: db)
    #     end.first
    # end
    
end