require 'mysql2'
require_relative '../data_sources/db_client'
require_relative '../models/publisher'

class PublisherDBDataSource
  def initialize
    @client = DBClient.instance
  end

  def add(publisher)
    query = "INSERT INTO Publisher (Name, Email) VALUES ('#{publisher.name}', #{publisher.email.nil? ? 'NULL' : "'#{publisher.email}'"})"
    @client.query(query)
    publisher_id = @client.last_id
    get(publisher_id)
  end

  def change(publisher)
    query = "UPDATE Publisher SET Name='#{publisher.name}', Email=#{publisher.email.nil? ? 'NULL' : "'#{publisher.email}'"} WHERE PublisherID=#{publisher.publisher_id}"
    @client.query(query)
    get(publisher.publisher_id)
  end

  def delete(id)
    query = "DELETE FROM Publisher WHERE PublisherID=#{id}"
    @client.query(query)
  end

  def get(id)
    query = "SELECT * FROM Publisher WHERE PublisherID=#{id}"
    result = @client.query(query).first
    if result
      Publisher.new(result[:'PublisherID'], result[:'Name'], result[:'Email'])
    else
      nil
    end
  end

  def get_list(page_size, page_num, sort_field, sort_direction, has_email = nil)
    offset = (page_num - 1) * page_size
    query = "SELECT * FROM Publisher"

    if has_email == true
      query += " WHERE Email IS NOT NULL"
    elsif has_email == false
      query += " WHERE Email IS NULL"
    end

    query += " ORDER BY #{sort_field} #{sort_direction} LIMIT #{page_size} OFFSET #{offset}"

    results = @client.query(query)
    publishers = []
    results.each do |result|
      publishers << Publisher.new(result[:'PublisherID'], result[:'Name'], result[:'Email'])
    end
    publishers
  end

  def count
    query = "SELECT COUNT(*) FROM Publisher"
    result = @client.query(query).first
    result[:'COUNT(*)']
  end
end