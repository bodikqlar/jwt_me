require "spec_helper"

RSpec.describe JwtMe::Token do
  describe ".generate" do
    let(:payload) { { 'email' => 'frodo@gmail.com', 'user_id' => '1', 'foo' => 'bar' } }
    let(:expected_hash_result) { 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImZyb2RvQGdtYWlsLmNvbSIsInVzZXJfaWQiOiIxIiwiZm9vIjoiYmFyIn0.BxoiI5RRjz8sXTA0Pg1jRXNoz8GFpCBwG4TXKeAIyc4' }

    it 'creates unprotected token' do
      expect(described_class.generate(payload)).to eq expected_hash_result
    end
  end
end
