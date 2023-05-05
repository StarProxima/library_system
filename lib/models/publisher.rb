class Publisher
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  attr_reader :publisher_id, :name, :email

  def initialize(publisher_id, name, email = nil)
    validate_all_null(name)
    validate_name_length(name)
    validate_email(email)

    @publisher_id = publisher_id
    @name = name
    @email = email
  end

  private

  def validate_all_null(*args)
    args.each do |arg|
      if arg.nil?
        raise ArgumentError, "Argument '#{caller_locations(1,1)[0].label}' cannot be null"
      end
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
