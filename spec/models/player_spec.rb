require 'rails_helper'

describe Player do
  context 'validations' do
    it { should validate_presence_of :firstname }
    it { should validate_presence_of :lastname }
    it { should validate_attachment_content_type(:avatar).
                allowing('image/png', 'image/gif', 'image/jpeg') }
    it { should validate_attachment_size(:avatar).
                less_than(300.kilobytes) }
  end

  context 'relations' do
    it { should have_many(:home_matches).class_name('Match') }
    it { should have_many(:away_matches).class_name('Match') }
  end
  
end
