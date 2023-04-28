require 'mysql2'
require_relative 'db_client'
class BookDBDataSource
  def initialize
    @client = DBClient.instance
  end

  def add(book)
    query = "INSERT INTO Book (BookID, Title, AuthorID, PublisherID) VALUES (#{book.id}, '#{book.title}', #{book.author_id}, #{book.publisher_id})"
    @client.query(query)
  end

  def change(book)
    query = "UPDATE Book SET Title='#{book.title}', AuthorID=#{book.author_id}, PublisherID=#{book.publisher_id} WHERE BookID=#{book.id}"
    @client.query(query)
  end

  def delete(id)
    query = "DELETE FROM Book WHERE BookID=#{id}"
    @client.query(query)
  end

  def get(id)
    query = "SELECT * FROM Book WHERE BookID=#{id}"
    result = @client.query(query).first
    if result
      Book.new(result['BookID'], result['Title'], result['AuthorID'], result['PublisherID'])
    else
      nil
    end
  end

  def get_list(page_size, page_num, sort_field, sort_direction)
    offset = (page_num - 1) * page_size
    query = "SELECT * FROM Book ORDER BY #{sort_field} #{sort_direction} LIMIT #{page_size} OFFSET #{offset}"
    results = @client.query(query)
    books = []
    results.each do |result|
      books << Book.new(result['BookID'], result['Title'], result['AuthorID'], result['PublisherID'])
    end
    books
  end
end