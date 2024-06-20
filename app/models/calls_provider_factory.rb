class CallsProviderFactory
  TYPES = {
    "Coach" => CoachCallsProvider,
    "Student" => StudentCallsProvider
  }

  def self.for(user)
    return unless user
    
    TYPES[user.type].new(user)
  end
end
