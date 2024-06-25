class StudentCallsProvider < CallsProvider
  def initialize(user)
    @user = user
  end

  def all(page)
    Call.where(student: nil).or(Call.where(student: @user)).order(:start).page(page).per(CALLS_PER_PAGE)
  end

  def available(page)
    Call.where(student: nil, start: Time.zone.now..).order(:start).page(page).per(CALLS_PER_PAGE)
  end

  def scheduled(page)
    @user.calls.where(start: Time.zone.now..).order(:start).page(page).per(CALLS_PER_PAGE)
  end

  def past(page)
    @user.calls.where(start: ..Time.zone.now).order(:start).page(page).per(CALLS_PER_PAGE)
  end
end
