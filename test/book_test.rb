require 'minitest/autorun'
require './lib/models/book'
class TestBook < Minitest::Test
  def test_initialize_raises_error_with_null_book_id
    assert_raises(ArgumentError) { Book.new(nil, 'title', 1, 1) }
  end

  def test_initialize_raises_error_with_null_title
    assert_raises(ArgumentError) { Book.new(1, nil, 1, 1) }
  end

  def test_initialize_raises_error_with_null_author_id
    assert_raises(ArgumentError) { Book.new(1, 'title', nil, 1) }
  end

  def test_initialize_raises_error_with_null_publisher_id
    assert_raises(ArgumentError) { Book.new(1, 'title', 1, nil) }
  end

  def test_initialize_raises_error_with_long_title
    long_title = 'a' * 256
    assert_raises(ArgumentError) { Book.new(1, long_title, 1, 1) }
  end

  def test_book_attributes_are_set
    book = Book.new(1, 'title', 2, 3)

    assert_equal 1, book.book_id
    assert_equal 'title', book.title
    assert_equal 2, book.author_id
    assert_equal 3, book.publisher_id
  end
end
