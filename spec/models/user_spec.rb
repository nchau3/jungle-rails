require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    #needs password and password confirmation, should also match
    context "given matching entries for password and password confirmation" do
      it "validates the user" do
        @user = User.new(email: "test@testing.com", first_name: "firstname", last_name: "lastname", password: "junglebook", password_confirmation: "junglebook")
        expect(@user).to be_valid
      end
    end

    #need unique email
    context "given a unique email" do
      it "validates the user" do
        @user = User.create(email: "test@testing.com", first_name: "firstname", last_name: "lastname", password: "junglebook", password_confirmation: "junglebook")
        @user2 = User.new(email: "test@testing.com", first_name: "firstname", last_name: "lastname", password: "junglebook", password_confirmation: "junglebook")
        @user3 = User.new(email: "anothertest@testing.com", first_name: "firstname", last_name: "lastname", password: "junglebook", password_confirmation: "junglebook")
        expect(@user2).to_not be_valid
        expect(@user3).to be_valid
      end
    end

    #minimum password length
    context "given a password greater than 10 characters" do
      it "validates the user" do
        @user = User.create(email: "test@testing.com", first_name: "firstname", last_name: "lastname", password: "junglebook", password_confirmation: "junglebook")
        expect(@user).to be_valid
      end
    end
    
    
  end
  
  #authenticate_with_credentials method
  describe '.authenticate_with_credentials' do

    context "given invalid email/password combination" do
      it "returns nil" do
        @user = User.create(email: "test@testing.com", first_name: "firstname", last_name: "lastname", password: "junglebook", password_confirmation: "junglebook")
        expect(@user.authenticate_with_credentials(@user.email, "wrong password")).to equal(nil)
      end
    end

    #spaces after email entry (still valid)
    context "given an email with trailing and/or leading spaces" do
      it "returns user" do
        @user = User.create(email: "test@testing.com", first_name: "firstname", last_name: "lastname", password: "junglebook", password_confirmation: "junglebook")
        expect(@user.authenticate_with_credentials(" test@testing.com  ", @user.password)).to eq(@user)
      end
    end
    #email should NOT be case sensitive
    context "given a valid email with mixed letter casing" do
      it "returns user" do
        @user = User.create(email: "test@testing.com", first_name: "firstname", last_name: "lastname", password: "junglebook", password_confirmation: "junglebook")
        expect(@user.authenticate_with_credentials("TEsT@teSTing.cOm", @user.password)).to eq(@user)
      end
    end
  end

end
