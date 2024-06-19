class CoachCallsProvider
  def initialize(user)
    @user = user
  end

  def all
    @user.calls.all
  end
end
