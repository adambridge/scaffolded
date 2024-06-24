class CoachCallsProvider
  def initialize(user)
    @user = user
  end

  def all
    @user.calls.all
  end

  def available
    @user.calls.where(student: nil, start: Time.zone.now..)
  end

  def scheduled
    @user.calls.where.not(student: nil).where(start: Time.zone.now..)
  end

  def past
    @user.calls.where(start: ..Time.zone.now)
  end
end
