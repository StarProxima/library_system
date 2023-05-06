class Book
  attr_reader :book_id, :title, :author_id, :publisher_id

  def initialize(book_id, title, author_id, publisher_id)
    validate_null('book_id', book_id)
    validate_null('title', title)
    validate_null('author_id', author_id)
    validate_null('publisher_id', publisher_id)

    validate_title_length(title)

    @book_id = book_id
    @title = title
    @author_id = author_id
    @publisher_id = publisher_id
  end

  private

  def validate_null(name, value)
    if value.nil?
      raise ArgumentError, "Argument '#{name}' cannot be null"
    end
  end

  def validate_title_length(title)
    if title.length > 255
      raise ArgumentError, "Title exceeds 255 characters limit: #{title}"
    end
  end
end