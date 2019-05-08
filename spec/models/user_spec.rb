require 'rails_helper'

RSpec.describe User, type: :model do 
  subject{described_class.new(email: 'lorem@lorem.com', password: 'lorem123456')}

  context "Attribute validations" do 
    it "is valid with valid attributes" do 
      expect(subject).to be_valid
    end

    it "is not valid without a email" do 
      subject.email = nil
      expect(subject).to_not be_valid 
    end

    it "is not valid without a password" do 
      subject.password = nil
      expect(subject).to_not be_valid 
    end

    it "is not valid a password with less than 6 characters" do 
      subject.password = '12345'
      expect(subject).to_not be_valid 
    end
  end

  context "Association validations" do 
    it "a user has many lists" do 
      assoc = described_class.reflect_on_association(:lists)
      expect(assoc.macro).to eq :has_many
    end

    it "a user has many favorites" do 
      assoc = described_class.reflect_on_association(:favorites)
      expect(assoc.macro).to eq :has_many
    end

  end
end