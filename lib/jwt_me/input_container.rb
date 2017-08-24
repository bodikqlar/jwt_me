require 'email_address'

module JwtMe
  # Encapsulates user's input and delegate
  # running validations to specific Validator
  class InputContainer
    include Thor::Shell

    attr_reader :storage

    VALIDATORS = {
      'email' => EmailValidator
    }.freeze

    def initialize
      @storage = {}
    end

    def add_key_value
      key = ask(key_number)

      if @storage.key?(key) || key.empty?
        say "Key is invalid or it's taken. Please choose another one."
        add_key_value
      else
        ask_value(key)
      end
    end

    private

    def ask_value(key)
      value = ask "Enter #{key} value:"
      validate(key, value)
      @storage[key] = value
    rescue ValidationError => e
      say e.to_s
      ask_value(key)
    end

    def key_number
      "Enter key #{@storage.count + 1}"
    end

    def validate(key, value)
      VALIDATORS[key].call(value) if VALIDATORS.keys.include?(key)
    end
  end
end
