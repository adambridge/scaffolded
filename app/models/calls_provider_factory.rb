class CallsProviderFactory
  TYPES = {
    "Coach" => CoachCallsProvider,
    "Student" => StudentCallsProvider,
    nil => StudentCallsProvider
  }

  def self.for(user)
    return unless user

    TYPES[user.type].new(user)
  end
end
