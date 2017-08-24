require 'jwt'

module JwtMe
  # A wrapper for JWT gem that handles encoding of hash
  class Token
    SECRET_KEY = 'secret_key'.freeze

    def self.generate(payload)
      JWT.encode payload, SECRET_KEY, 'HS256'
    end
  end
end
