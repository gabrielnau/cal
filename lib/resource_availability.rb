class ResourceAvailability

  def initialize(resource)
    @resource = resource
  end

  def on?(day)
    @resource.availabilities.where(date: day).any?
  end

  def set_on=(day)
    @resource.availabilities.find_or_create_by!(date: day)
  end

  def during?(period_range)
    period_range.count == @resource.availabilities.where(date: period_range).count
  end

  def during=(period_range)
    period_range.each{ |day| set_on = day.to_date }
  end

  def rate_during(month)
    availability_days = @resource.availabilities.where(
      date: (month.beginning_of_month..month.end_of_month)).count
    days_in_month = Time.days_in_month(month.month, month.year)

    return 0 if availability_days == 0
    return days_in_month/(availability_days*100)
  end

end