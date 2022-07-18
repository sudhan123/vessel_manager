class Vessel < ApplicationRecord
  has_many :vessel, dependent: :destroy
  validates :naccs_code, uniqueness: true
end
