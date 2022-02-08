require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'should create valid user' do
      user = User.create(
        last_name: "Jaden",
        first_name: "King",
        email: "example@example.com",
        password: "july12345",
        password_confirmation: "july12345"
        )
      expect(user).to be_valid
    end

    it 'should have password and password confirmation' do
      user = User.create(
        last_name: "Jaden",
        first_name: "King",
        email: "example@example.com",
        password: "july12345",
        password_confirmation: ""
        )
      expect(user).to_not be_valid
    end

    it 'should not save without unique email' do
      user = User.create(
        last_name: "Jaden",
        first_name: "King",
        email: "example@example.com",
        password_digest: "123"
        )
      user2 = User.create(
        last_name: "Tyrese",
        first_name: "williams",
        email: "example@example.com",
        password_digest: "123"
        )
      expect(user2).to_not be_valid
    end

    it 'should have matching password and password confirmation' do
      user = User.create(
        last_name: "Jaden",
        first_name: "King",
        email: "example@example.com",
        password: "july12345",
        password_confirmation: "august12345"
        )
      expect(user.password).to_not be_equal(user.password_confirmation)
    end

    it 'should have a password with a minimum length of 5' do
      user = User.create(
        last_name: "Jaden",
        first_name: "King",
        email: "example@example.com",
        password: "july",
        password_confirmation: "july"
        )
      expect(user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it 'check if user input password match in database' do
    user = User.create(
      last_name: "Jaden",
      first_name: "King",
      email: "example@example.com",
      password: "july12345",
      password_confirmation: "july12345"
      )
    authenticate = User.authenticate_with_credentials(user.email, user.password)
    expect(authenticate).to_not be_valid
    end
  end
end