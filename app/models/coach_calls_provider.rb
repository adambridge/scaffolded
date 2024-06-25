class CoachCallsProvider < CallsProvider
  def initialize(user)
    @user = user
  end

  def all(page)
    @user.calls.page(page).per(CALLS_PER_PAGE)
  end

  def available(page)
    @user.calls.where(student: nil, start: Time.zone.now..).page(page).per(CALLS_PER_PAGE)
  end

  def scheduled(page)
    @user.calls.where.not(student: nil).where(start: Time.zone.now..).page(page).per(CALLS_PER_PAGE)
  end

  def past(page)
    @user.calls.where(start: ..Time.zone.now).page(page).per(CALLS_PER_PAGE)
  end
end
