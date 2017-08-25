require 'spec_helper'
require 'pry'
RSpec.describe JwtMe::InputContainer do
  describe '.add_key_value' do
    let(:valid_email) { 'syed@thredup.com' }
    let(:invalid_email) { 'asasas@ass.ss' }

    context 'prompts user to enter key and value' do
      context 'when key and value are correct' do
        it 'succeeds' do
          expect(subject).to receive(:ask).with('Enter key 1').and_return('test')
          expect(subject).to receive(:ask).with('Enter test value:').and_return('test')
          expect(subject).to receive(:add_key_value).once.and_call_original

          subject.add_key_value

          expect(subject.storage).to include('test' => 'test')
        end
      end

      context 'when key is invalid' do
        let(:key_error) { "Key is invalid or it's taken. Please choose another one.\n" }

        it "prints error and ask's user to enter valid key" do
          allow(subject).to receive(:ask).with('Enter key 1').and_return('', 'email')
          expect(subject).to receive(:ask).with('Enter email value:').and_return(valid_email)

          check_output_in_console(key_error)

          subject.add_key_value
        end
      end

      context 'when email value is invalid' do
        let(:email_error) { "Invalid Host/Domain Name\n" }

        it "prints error and ask's user to enter valid key" do
          allow(subject).to receive(:ask).with('Enter key 1').and_return('email')
          allow(subject).to receive(:ask).with('Enter email value:').and_return(invalid_email, valid_email)

          check_output_in_console(email_error)

          subject.add_key_value
        end
      end

      def check_output_in_console(error)
        expect(STDOUT).to receive(:print).with(error)
      end
    end
  end
end
