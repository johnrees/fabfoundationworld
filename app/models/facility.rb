class Facility < ActiveRecord::Base
  validates :type, :name, presence: true
end
