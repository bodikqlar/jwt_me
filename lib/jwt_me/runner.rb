require 'jwt_me/token'
require 'clipboard'

module JwtMe
  # Main class that invokes all the neccessary system components.
  class Runner < Thor
    desc 'start [DEFAULT COMMAND]', 'Add required fields and start Json Web Token generation'
    def start
      say 'Starting with Json Web Tokens generation.'
      container = JwtMe::InputContainer.new
      2.times { container.add_key_value }

      ask_for_additional_info(container)
      token = JwtMe::Token.generate(container.storage)
      Clipboard.copy(token)
      say 'The JWT has been copied to your clipboard!'
    end

    default_task :start

    private

    def ask_for_additional_info(container)
      container.add_key_value while yes?('Any additional inputs? (yes/no)')
    end
  end
end
