require 'pry'
class Pokemon
    attr_accessor :id , :name , :type , :db
   
    def initialize (id: , name: , type: , db:)
        @id , @name , @type , @db = id , name , type , db
    end

    def self.save (name , type , db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type) VALUES (? , ?)
        SQL
        
        db.execute(sql, name, type)
    end

    def self.find(id , db)
        info = db.execute("SELECT * FROM pokemon WHERE id=? " , id)[0]
        Pokemon.new(id: info[0], name:info[1], type:info[2], db: db)
    end

end
