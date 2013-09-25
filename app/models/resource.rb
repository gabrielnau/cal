class Resource < ActiveRecord::Base

  belongs_to :user

  has_many :availabilities

  # def available_on?(day)
  #   @availability_dates.include? day
  # end

  # def available_on=(day)
  #   @availability_dates.add day
  # end

  # def available_during?(period_range)
  #   available = true
  #   period_range.each do |day|
  #     available = false unless available_on?(day)
  #   end
  #   available
  # end

  # def available_during=(period_range)
  #   period_range.each{|day| available_on = day }
  # end

  # def availability_rate_during(month)
  #   days_during_month = month.days_during_month
  #   # copy = @availability_dates
  #   # availability_days = 
  # end

end