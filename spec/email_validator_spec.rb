require 'spec_helper'

RSpec.describe JwtMe::EmailValidator do
  context 'email is not valid' do
    it '.call raises error' do
      expect { JwtMe::EmailValidator.call('assa@sass') }.to raise_error(JwtMe::ValidationError)
    end
  end

  context 'email is valid' do
    it '.call returns nil' do
      expect(JwtMe::EmailValidator.call('syed@thredup.com')).to be_nil
    end
  end
end
