require "spec_helper"

describe User do

  before do 
    @user_hash = {email: 'hayduke19us', password: 'footinmouth'}
    @user = User.create(email: 'hayduke19us', password: 'footinmouth')
  end

  it 'needs an email' do
    @user.email = nil
    refute @user.valid?
  end

  it '#create, creates a new user encrypting the password b_password is 
    a BCrypt instance' do 
    assert_equal @user.b_password, @user_hash[:password]
  end

  it 'authenticates a user by email and password' do
    assert User.authenticate @user_hash
  end

  it 'denies access if email does not exist' do
    hash = {email: 'doesntexist@gmail.com', password: 'noconsequence'}
    refute User.authenticate hash
  end

  it 'denies access if password does not b_password, per user found by_email' do
    hash = {email: @user.email, password: 'wrongpassword'}
    refute User.authenticate hash
  end
end
