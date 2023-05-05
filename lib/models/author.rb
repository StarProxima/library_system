class Author
  attr_reader :author_id, :first_name, :last_name, :father_name

  def initialize(author_id, first_name, last_name, father_name = nil)
    validate_null('author_id', author_id)
    validate_null('first_name', first_name)
    validate_null('last_name', last_name)

    validate_name_length(first_name, last_name, father_name)

    @author_id = author_id
    @first_name = first_name
    @last_name = last_name
    @father_name = father_name
  end

  private

  def validate_null(name, value)
    if value.nil?
      raise ArgumentError, "Argument '#{name}' cannot be null"
    end
  end

  def validate_name_length(first_name, last_name, father_name)
    [first_name, last_name, father_name].each do |name|
      if name && name.length > 50
        raise ArgumentError, "Name exceeds 50 characters limit: #{name}"
      end
    end
  end
end
