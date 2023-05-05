class Book
  attr_reader :book_id, :title, :author_id, :publisher_id

  def initialize(book_id, title, author_id, publisher_id)
    validate_all_null(book_id, title, author_id, publisher_id)
    validate_title_length(title)

    @book_id = book_id
    @title = title
    @author_id = author_id
    @publisher_id = publisher_id
  end

  private

  def validate_all_null(*args)
    args.each do |arg|
      if arg.nil?
        raise ArgumentError, "Argument '#{caller_locations(1,1)[0].label}' cannot be null"
      end
    end
  end

  def validate_title_length(title)
    if title.length > 255
      raise ArgumentError, "Title exceeds 255 characters limit: #{title}"
    end
  end
end