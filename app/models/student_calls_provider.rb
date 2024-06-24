class StudentCallsProvider
  def initialize(user)
    @user = user
  end

  def all(page)
    Call.where(student: nil).or(Call.where(student: @user)).page(page).per(5)
  end

  def available(page)
    Call.where(student: nil, start: Time.zone.now..).page(page).per(5)
  end

  def scheduled(page)
    @user.calls.where(start: Time.zone.now..).page(page).per(5)
  end

  def past(page)
    @user.calls.where(start: ..Time.zone.now).page(page).per(5)
  end
end
