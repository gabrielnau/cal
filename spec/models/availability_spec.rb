require 'spec_helper'

describe Availability do

  it "requires a date" do
    availability = Availability.new
    expect(availability.valid?).to be_false
    availability.date = Date.today
    expect(availability.save!).to be_true
  end

end

