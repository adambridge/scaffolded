class Call < ApplicationRecord
  belongs_to :coach
  belongs_to :student, optional: true
end
