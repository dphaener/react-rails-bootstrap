class UserContext
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def id
    user.id
  end
end
