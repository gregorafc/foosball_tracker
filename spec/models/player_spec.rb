require 'rails_helper'

describe Player do
  context 'validations' do
    it { should validate_presence_of :firstname }
    it { should validate_presence_of :lastname }
  end
  
end
