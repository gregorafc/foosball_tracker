require 'rails_helper'

describe Operator do
  context 'validations' do
    it { should validate_presence_of :login }
    it { should validate_presence_of :password_digest }
    it { should validate_uniqueness_of :login }
    it { should have_secure_password }
  end

end
