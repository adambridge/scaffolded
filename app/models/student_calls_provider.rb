class StudentCallsProvider
  def initialize(user)
    @user = user
  end

  def all
    Call.where(student: nil).or(Call.where(student: @user))
  end
end
