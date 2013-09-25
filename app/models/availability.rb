class Availability < ActiveRecord::Base

  belongs_to :resource

  validates :date, presence: true

end