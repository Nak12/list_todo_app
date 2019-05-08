require 'rails_helper'


RSpec.describe Favorite, type: :model do 
  let(:user){User.new(email: 'lorem@lorem.com', password: "lorem123")}
  let(:list){List.new(list_title: 'teste', user_id: 1)}
  subject{described_class.new(user: user, list: list)}

  context "Attribute validations" do
    it "is valid with valid attributes" do 
      expect(subject).to be_valid
    end

    it "is not valid without valid attributes" do 
      subject.user = nil
      subject.list = nil
      expect(subject).to_not be_valid
    end
  end

  context "Association validations" do 
    it "a favorite belong to a user" do 
      assoc = described_class.reflect_on_association(:user)
      expect(assoc.macro).to eq :belongs_to
    end

    it "a favorite belong to a list" do 
      assoc = described_class.reflect_on_association(:list)
      expect(assoc.macro).to eq :belongs_to
    end
  end
end