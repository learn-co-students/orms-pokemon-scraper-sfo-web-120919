class Pokemon
  attr_reader :name, :type, :db, :id

  def initialize(id:, name:, type:, db:)
    @name = name
    @type = type
    @db = db
    @id = id 
  end

  def self.save(my_name, my_type, chosen_db)
    sql = <<-SQL
       INSERT INTO pokemon (name, type)
       VALUES (?, ?) 
     SQL

     chosen_db.execute(sql, my_name, my_type)
  end

 
  def self.find(my_id, my_db)
     
    sql = <<-SQL
      SELECT *
      FROM pokemon
      WHERE id = ?
    SQL

    pokemon_info = my_db.execute(sql, my_id)[0]
    new_pokemon = self.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], db: my_db)
    #binding.pry
     
  end 

end
