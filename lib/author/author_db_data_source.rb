require 'mysql2'
require_relative '../data_sources/db_client'

class AuthorDBDataSource
  def initialize
    @client = DBClient.instance
  end


  def add(author)
    query = "INSERT INTO Author (FirstName, LastName) VALUES ('#{author.first_name}', '#{author.last_name}')"
    @client.query(query)
  end

  def change(author)
    query = "UPDATE Author SET FirstName='#{author.first_name}', LastName='#{author.last_name}' WHERE AuthorID=#{author.id}"
    @client.query(query)
  end

  def delete(id)
    query = "DELETE FROM Author WHERE AuthorID=#{id}"
    @client.query(query)
  end

  def get(id)
    query = "SELECT * FROM Author WHERE AuthorID=#{id}"
    result = @client.query(query).first
    if result
      Author.new(result[:'AuthorID'], result[:'FirstName'], result[:'LastName'])
    else
      nil
    end
  end

  def get_list(page_size, page_num, sort_field, sort_direction)
    offset = (page_num - 1) * page_size
    query = "SELECT * FROM Author ORDER BY #{sort_field} #{sort_direction} LIMIT #{page_size} OFFSET #{offset}"
    results = @client.query(query)

    authors = []
    results.each do |result|
      authors << Author.new(result[:'AuthorID'], result[:'FirstName'], result[:'LastName'])
    end

    authors
  end

  def count
    query = "SELECT COUNT(*) FROM Author"
    result = @client.query(query).first

    result[:'COUNT(*)']
  end
end