class Publisher
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  attr_reader :publisher_id, :name, :email

  def initialize(publisher_id, name, email = nil)
    validate_null('publisher_id', publisher_id)
    validate_null('name', name)

    validate_name_length(name)
    validate_email(email)

    @publisher_id = publisher_id
    @name = name
    @email = email
  end

  private

  def validate_null(name, value)
    if value.nil?
      raise ArgumentError, "Argument '#{name}' cannot be null"
    end
  end

  def validate_name_length(name)
    if name.length > 100
      raise ArgumentError, "Name exceeds 100 characters limit: #{name}"
    end
  end

  def validate_email(email)
    if email && !email.match?(EMAIL_REGEX)
      raise ArgumentError, "Invalid email format: #{email}"
    end
  end
end
