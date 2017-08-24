require 'email_address'
require 'jwt_me/validation_error'

# Validator for email
class EmailValidator
  def self.call(value)
    err = EmailAddress.error value
    raise ValidationError, err if err
  end
end
