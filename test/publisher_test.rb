require 'minitest/autorun'
require './lib/models/publisher'
class TestPublisher < Minitest::Test
  def test_initialize_with_valid_arguments
    publisher = Publisher.new(1, "Test Publisher", "test@example.com")
    assert_equal 1, publisher.publisher_id
    assert_equal "Test Publisher", publisher.name
    assert_equal "test@example.com", publisher.email
  end

  def test_initialize_with_null_publisher_id
    error = assert_raises(ArgumentError) do
      Publisher.new(nil, "Test Publisher", "test@example.com")
    end
    assert_equal "Argument 'publisher_id' cannot be null", error.message
  end

  def test_initialize_with_null_name
    error = assert_raises(ArgumentError) do
      Publisher.new(1, nil, "test@example.com")
    end
    assert_equal "Argument 'name' cannot be null", error.message
  end

  def test_initialize_with_name_length_exceeding_limit
    long_name = "a" * 101
    error = assert_raises(ArgumentError) do
      Publisher.new(1, long_name, "test@example.com")
    end
    assert_equal "Name exceeds 100 characters limit: #{long_name}", error.message
  end

  def test_initialize_with_invalid_email_format
    error = assert_raises(ArgumentError) do
      Publisher.new(1, "Test Publisher", "invalid-email")
    end
    assert_equal "Invalid email format: invalid-email", error.message
  end
end
