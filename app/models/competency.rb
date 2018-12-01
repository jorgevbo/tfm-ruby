class Competency < ApplicationRecord
  belongs_to :competency_framework
  has_and_belongs_to_many :courses


  validates :name, presence: true
end
