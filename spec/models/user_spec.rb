require "spec_helper"

describe User do

  before do 
    @user = User.create(email: 'hayduke19us', password: 'footinmouth')
  end

  it 'needs an email' do
    @user.email = nil
    refute @user.valid?
  end

  it 'needs a password' do
    @user.password = nil
    refute @user.valid?
  end
end
