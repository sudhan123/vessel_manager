class Vessel < ApplicationRecord
  validates :naccs_code, uniqueness: true
end
