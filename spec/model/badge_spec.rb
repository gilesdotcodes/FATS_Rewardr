require 'rails_helper'

RSpec.describe Badge, :type => :model do

  context 'that exists and is awarded' do

    it 'must be assigned to a user' do
      badge = Badge.new(name: 'Angel')
      expect(badge).not_to be_valid
    end

    it 'must know when it was created' do
      badge = Badge.create(name: 'Angel', user_id: 1)
      time = Time.new
      expect(badge.created_at.strftime("%d %B %Y")).to eq (time.strftime("%d %B %Y"))
    end

    it 'should be present in the list of pre-defined badges' do
      badge = Badge.new(name: 'Office Angel', user_id: 1)
      expect(badge.name).to be_in(Badge::BADGES)
    end
  end

  context 'that is created by Admin and then awarded' do

    it 'cannot be created without a name' do
      badge = Badge.new(name: '', user_id: 1)
      expect(badge).not_to be_valid
    end

    it 'is added to the pre-defined list' do
      badge = Badge.create(name: 'Superstar', user_id: 1)
      Badge::BADGES << badge.name.to_s
      expect(badge.name).to be_in(Badge::BADGES)
    end

  end

end