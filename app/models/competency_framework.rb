class CompetencyFramework < ApplicationRecord
  has_many :competency

  validates :name, presence: true
end
