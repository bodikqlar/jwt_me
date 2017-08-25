require 'spec_helper'

RSpec.describe JwtMe::Runner do
  describe '#start' do
    let(:token) { 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6InN5ZWRAdGhyZWR1cC5jb20iLCJ1c2VyX2lkIjoiMTYiLCJ0ZXN0IjoidGVzdCJ9.Zz2_EDqHgx0Pia549c-ahvqM3fHjyfWK_OR32LFErK8' }
    let(:valid_email) { 'syed@thredup.com' }
    let(:user_id)     { '16' }

    it 'is a default task' do
      expect(described_class.default_task).to eq 'start'
    end

    it 'copies jwt token to clibboard' do
      enter_key(1, 'email')
      enter_value('email', valid_email)

      enter_key(2, 'user_id')
      enter_value('user_id', user_id)

      allow(subject).to receive(:yes?).with('Any additional inputs? (yes/no)').and_return(true, false)

      enter_key(3, 'test')
      enter_value('test', 'test')

      subject.start

      expect(Clipboard.paste).to eq token
    end

    def enter_key(number, key)
      allow_any_instance_of(JwtMe::InputContainer).to receive(:ask).with("Enter key #{number}").and_return(key)
    end

    def enter_value(key, value)
      allow_any_instance_of(JwtMe::InputContainer).to receive(:ask).with("Enter #{key} value:").and_return(value)
    end
  end
end
