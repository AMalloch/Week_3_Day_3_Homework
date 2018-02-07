require('pg')
require_relative('../db/sql_runner')

class Artist

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save
    sql = 'INSERT INTO artists (name) VALUE ($1) RETURNING id'
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

end