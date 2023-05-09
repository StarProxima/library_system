require 'minitest/autorun'
require './lib/models/author'
class TestAuthor < Minitest::Test
  def test_initialize_sets_attributes
    author = Author.new(1, 'John', 'Doe', 'Smith')

    assert_equal 1, author.author_id
    assert_equal 'John', author.first_name
    assert_equal 'Doe', author.last_name
    assert_equal 'Smith', author.father_name
  end

  def test_initialize_raises_error_if_author_id_is_nil
    assert_raises ArgumentError do
      Author.new(nil, 'John', 'Doe')
    end
  end

  def test_initialize_raises_error_if_first_name_is_nil
    assert_raises ArgumentError do
      Author.new(1, nil, 'Doe')
    end
  end

  def test_initialize_raises_error_if_last_name_is_nil
    assert_raises ArgumentError do
      Author.new(1, 'John', nil)
    end
  end

  def test_initialize_raises_error_if_first_name_exceeds_50_characters
    long_name = 'a' * 51
    assert_raises ArgumentError do
      Author.new(1, long_name, 'Doe')
    end
  end

  def test_initialize_raises_error_if_last_name_exceeds_50_characters
    long_name = 'a' * 51
    assert_raises ArgumentError do
      Author.new(1, 'John', long_name)
    end
  end

  def test_initialize_raises_error_if_father_name_exceeds_50_characters
    long_name = 'a' * 51
    assert_raises ArgumentError do
      Author.new(1, 'John', 'Doe', long_name)
    end
  end
end
