require 'rails_helper'

describe User do
  it "is valid with an username, password, and password_confirmation" do
    expect(build(:user)).to be_valid
  end

  it "is invalid without an username" do
    user = build(:invalid_user)
    user.valid?
    expect(user.errors[:username]).to include("can't be blank")
  end

  it "is invalid with a duplicate username" do
    user1 = create(:user, username: "nanda")
    user2 = build(:user, username: "nanda")

    user2.valid?
    expect(user2.errors[:username]).to include("has already been taken")
  end

  context "on new user" do
    it "is invalid without a password" do
      user = build(:invalid_user)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid with less than 8 characters password" do
      user = build(:user, password: "short", password_confirmation: "short")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 8 characters)")
    end

    it "is invalid with a confirmation mismatch" do
      user = build(:user, password: "longpassword", password_confirmation: "longpasswordd")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
  end

  context "on an existing user" do
    before :each do
      @user = create(:user)
    end

    it "is valid with no changes" do
      expect(@user.valid?).to be true
    end

    it "is invalid with an empty password" do
      @user.password_digest = ""
      @user.valid?
      expect(@user.errors[:password]).to include("can't be blank")
    end

    it "is valid with a new (valid) password" do
      @user.password = "newlongpassword"
      @user.password_confirmation = "newlongpassword"
      expect(@user.valid?).to be true
    end
  end
end
