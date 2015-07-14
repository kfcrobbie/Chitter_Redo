describe User do

  it 'authenticates when given a valid email address and password' do
  	user = User.create(username: 'jon', name: 'rob', password: 'test', password_confirmation: 'test', email: 'anything') #
    authenticated_user = User.authenticate(user.username, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
  	user = User.create(username: 'rob', password: 'tester', password_confirmation: 'tester', email: 'robs') #
    expect(User.authenticate(user.username, 'wrong_stupid_password')).to be_nil
  end


end
