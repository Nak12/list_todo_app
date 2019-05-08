require 'rails_helper'

RSpec.describe Task, type: :model do 
  let(:list){List.new(list_title: 'teste', user_id: 1)}
  subject{described_class.new(task_title: 'tarefa ola', list: list)}

  context "Attribute validations" do 
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "the task_title attribute does not have  the minimum of characters" do
      min = subject.task_title.size
      expect(min).to_not be < 3
    end

    it "the task_title attribute does not have the maximum of characters" do
      max = subject.task_title.size
      expect(max).to_not be > 50
    end

    it "is not valid without a task_title" do 
      subject.task_title = nil
      expect(subject).to_not be_valid 
    end
  end

  context "Association validations" do 
    it "a task belongs to a list" do 
      assoc = described_class.reflect_on_association(:list)
      expect(assoc.macro).to eq :belongs_to
    end
  end
end