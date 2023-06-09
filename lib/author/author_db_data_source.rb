require 'mysql2'
require_relative '../data_sources/db_client'

class AuthorDBDataSource
  def initialize
    @client = DBClient.instance
  end

  # def add(author)
  #   query = "INSERT INTO Author (FirstName, LastName, FatherName) VALUES ('#{author.first_name}', '#{author.last_name}', #{author.father_name.nil? ? 'NULL' : "'#{author.father_name}'"})"
  #   @client.query(query)
  # end



  # добавляет нового автора в базу данных, возвращает созданную запись.
  def add(author)
    query = "INSERT INTO Author (FirstName, LastName, FatherName) VALUES ('#{author.first_name}', '#{author.last_name}', #{author.father_name.nil? ? 'NULL' : "'#{author.father_name}'"})"
    @client.query(query)
    author_id = @client.last_id
    get(author_id)
  end

  #  изменяет данные об авторе в базе данных, возвращает измененную запись.
  def change(author)
    query = "UPDATE Author SET FirstName='#{author.first_name}', LastName='#{author.last_name}', FatherName=#{author.father_name.nil? ? 'NULL' : "'#{author.father_name}'"} WHERE AuthorID=#{author.author_id}"
    @client.query(query)
    get(author.author_id)
  end

  # удаляет запись об авторе из базы данных.
  def delete(id)
    query = "DELETE FROM Author WHERE AuthorID=#{id}"
    @client.query(query)
  end

  #  возвращает запись об авторе по заданному id.
  def get(id)
    query = "SELECT * FROM Author WHERE AuthorID=#{id}"
    result = @client.query(query).first
    if result
      Author.new(result[:'AuthorID'], result[:'FirstName'], result[:'LastName'], result[:'FatherName'])
    else
      nil
    end
  end

  # def get_list(page_size, page_num, sort_field, sort_direction)
  #   offset = (page_num - 1) * page_size
  #   query = "SELECT * FROM Author ORDER BY #{sort_field} #{sort_direction} LIMIT #{page_size} OFFSET #{offset}"
  #   results = @client.query(query)
  #
  #   authors = []
  #   results.each do |result|
  #     authors << Author.new(result[:'AuthorID'], result[:'FirstName'], result[:'LastName'], result[:'FatherName'])
  #   end
  #
  #   authors
  # end

  # возвращает список авторов с учетом фильтра по наличию отчества и сортировки, позволяет задавать количество элементов на странице и номер страницы.
  def get_list(page_size, page_num, sort_field, sort_direction, has_father_name = nil)
    offset = (page_num - 1) * page_size
    query = "SELECT * FROM Author"

    if has_father_name == true
      query += " WHERE FatherName IS NOT NULL"
    elsif has_father_name == false
      query += " WHERE FatherName IS NULL"
    end

    query += " ORDER BY #{sort_field} #{sort_direction} LIMIT #{page_size} OFFSET #{offset}"
    results = @client.query(query)

    authors = []
    results.each do |result|
      authors << Author.new(result[:'AuthorID'], result[:'FirstName'], result[:'LastName'], result[:'FatherName'])
    end

    authors
  end

  # возвращает количество записей об авторах в базе данных.
  def count
    query = "SELECT COUNT(*) FROM Author"
    result = @client.query(query).first

    result[:'COUNT(*)']
  end
end