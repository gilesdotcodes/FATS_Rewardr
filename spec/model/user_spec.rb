require 'rails_helper'

RSpec.describe User, :type => :model do

  context 'being signed up' do

    it 'must have a valid email address' do
      user = User.new(email: "a@a.com", name: "Me", password: "testtest")
      expect(user).to be_valid
    end

    it 'cannot have an invalid email address' do
      user = User.new(email: "a.com", name: "Me", password: "testtest")
      # expect(user).to have(1).error_on(:email)
      expect(user).not_to be_valid
    end

    it 'must have a name' do
      user = User.new(email: "a@a.com", name: "Me", password: "testtest")
      expect(user).to be_valid
    end

    it 'cannot leave the name blank' do
      user = User.new(email: "a@a.com", name: "", password: "testtest")
      # expect(user).to have(1).error_on(:email)
      expect(user).not_to be_valid
    end

    it 'must have a password of at least 8 characters' do
      user = User.new(email: 'a@a.com', name: 'Me', password: 'testtest')
      expect(user).to be_valid
    end

    it 'cannot have a password of less than 8 characters' do
      user = User.new(email: 'a@a.com', name: 'Me', password: 'test')
      expect(user).not_to be_valid
    end

    it 'must have a unique email' do
      user = User.create(email: 'a@a.com', name: 'Me', password:'testtest')
      user_two = User.new(email: 'a@a.com', name: 'You', password:'12345678')
      expect(user_two).not_to be_valid
    end
  end
end