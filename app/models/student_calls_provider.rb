class StudentCallsProvider
  def initialize(user)
    @user = user
  end

  def all
    Call.where(student: nil).or(Call.where(student: @user))
  end

  def available
    Call.where(student: nil, start: Time.zone.now..)
  end

  def scheduled
    @user.calls.where(start: Time.zone.now..)
  end

  def past
    @user.calls.where(start: ..Time.zone.now)
  end
end
