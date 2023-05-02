require 'rails_helper'

RSpec.describe Cat, type: :model do
  it "should validate name exists in the entry" do
    cat = Cat.create(age:3, enjoys:'sleeping and more sleeping', image: 'somecatpic.jpg')
    expect(cat.errors[:name]).to_not be_empty
  end

  it "should validate age exists in the entry" do
    cat = Cat.create(name: 'Buster', enjoys:'napping', image: 'somepic.com')
    expect(cat.errors[:age]).to_not be_empty
  end

  it "Should validate enjoys exists" do
    cat = Cat.create(name:'Buster', age:5, image:'something.com')
    expect(cat.errors[:enjoys]).to_not be_empty
  end

  it "should have an enjoys statement >= 10" do
    cat = Cat.create(name:'Buster', age:6, enjoys:'nothing', image:'busterdoingnothing.com')
    expect(cat.errors[:enjoys]).to_not be_empty
  end
end
