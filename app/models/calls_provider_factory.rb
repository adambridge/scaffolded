class CallsProviderFactory
  TYPES = {
    "Coach" => CoachCallsProvider,
    "Student" => StudentCallsProvider
  }

  def self.for(user)
    TYPES[user.type].new(user)
  end
end
