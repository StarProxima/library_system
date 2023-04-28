require 'mysql2'

class PublisherDBDataSource
  def initialize(host, username, password, database)
    @client = Mysql2::Client.new(
      host: host,
      username: username,
      password: password,
      database: database
    )
  end

  def add(publisher)
    query = "INSERT INTO Publisher (PublisherID, Name) VALUES (#{publisher.id}, '#{publisher.name}')"
    @client.query(query)
  end

  def change(publisher)
    query = "UPDATE Publisher SET Name='#{publisher.name}' WHERE PublisherID=#{publisher.id}"
    @client.query(query)
  end

  def delete(id)
    query = "DELETE FROM Publisher WHERE PublisherID=#{id}"
    @client.query(query)
  end

  def get(id)
    query = "SELECT * FROM Publisher WHERE PublisherID=#{id}"
    result = @client.query(query).first
    if result
      Publisher.new(result['PublisherID'], result['Name'])
    else
      nil
    end
  end

  def get_list(page_size, page_num, sort_field, sort_direction)
    offset = (page_num - 1) * page_size
    query = "SELECT * FROM Publisher ORDER BY #{sort_field} #{sort_direction} LIMIT #{page_size} OFFSET #{offset}"
    results = @client.query(query)
    publishers = []
    results.each do |result|
      publishers << Publisher.new(result['PublisherID'], result['Name'])
    end
    publishers
  end
end