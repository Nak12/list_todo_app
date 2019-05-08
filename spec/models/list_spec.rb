require 'rails_helper'

RSpec.describe List, type: :model do 
  let(:user){User.new(email: 'lorem@lorem.com', password: 'lorem123456')}
  subject{described_class.new(list_title: 'teste', user: user)}

  context "Attribute validations" do 
    it "is valid with valid attributes" do 
      expect(subject).to be_valid
    end

    it "the list_title attribute does not have  the minimum of characters" do
      min = subject.list_title.size
      expect(min).to_not be < 3
    end

    it "the list_title attribute does not have the maximum of characters" do
      max = subject.list_title.size
      expect(max).to_not be > 30
    end


    it "is_private attribute is false by default" do 
      expect(subject.is_private).to be_falsey
    end

    it "is not valid without a list_title" do 
      subject.list_title = nil
      expect(subject).to_not be_valid 
    end
  end

  context "Association validations" do 
    it "a list belongs to a user" do 
      assoc = described_class.reflect_on_association(:user)
      expect(assoc.macro).to eq :belongs_to
    end

    it "a list has many tasks" do 
      assoc = described_class.reflect_on_association(:tasks)
      expect(assoc.macro).to eq :has_many
    end

    it "a list has many favorites " do 
      assoc = described_class.reflect_on_association(:favorites)
      expect(assoc.macro).to eq :has_many
    end
  end
end