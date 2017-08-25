require 'email_address'
require 'jwt_me/validation_error'

# Validator for email
module JwtMe
  class EmailValidator
    def self.call(value)
      err = EmailAddress.error value
      raise JwtMe::ValidationError, err if err
    end
  end
end
