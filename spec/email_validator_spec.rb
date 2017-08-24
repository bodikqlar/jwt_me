require 'spec_helper'

RSpec.describe EmailValidator do
  context 'email is not valid' do
    it '.call raises error' do
      expect { EmailValidator.call('assa@sass') }.to raise_error(ValidationError)
    end
  end

  context 'email is valid' do
    it '.call returns nil' do
      expect(EmailValidator.call('syed@thredup.com')).to be_nil
    end
  end
end
