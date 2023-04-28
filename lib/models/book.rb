class Book
  attr_accessor :id, :title, :author_id, :publisher_id

  def initialize(id, title, author_id, publisher_id)
    @id = id
    @title = title
    @author_id = author_id
    @publisher_id = publisher_id
  end
end