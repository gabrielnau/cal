require 'spec_helper'
require 'resource_availability'

describe ResourceAvailability do

  before :each do
    @resource_availability = ResourceAvailability.new(Resource.create!(name: "car"))
  end

  it "is by default unavailable" do
    period = 1.day.from_now.to_date..1.month.from_now.to_date
    expect(@resource_availability.during?(period)).to be_false
  end

  describe "#on?" do
    it "returns true if the resource is available the given day" do
      @resource_availability.set_on 1.day.from_now.to_date
      expect(@resource_availability.on?(1.day.from_now.to_date)).to be_true
    end

    it "returns false if the resource is unavailable the given day" do
      @resource_availability.set_on 10.day.from_now.to_date
      expect(@resource_availability.on?(1.day.from_now.to_date)).to be_false
    end
  end

  describe "#unset_on" do
    pending "not implemented"
  end

  describe "#set_on" do
    it "is only settable by the resource's owner" do
      pending "not implemented"
    end

    it "sets the availability for a given day" do
      @resource_availability.set_on 1.day.from_now.to_date
      expect(@resource_availability.on?(1.day.from_now.to_date)).to be_true
    end

    pending "doesn't create a new one if an availability already exists"

  end

  describe "#during?" do
    before :each do
      @period = 1.day.from_now.to_date..2.days.from_now.to_date
      @resource_availability.during @period
    end

    it "returns true if the resource is available each day of the given period" do
      expect(@resource_availability.during?(@period)).to be_true
    end

    it "returns false if there is at least one day where the resource is unavailable" do
      overlapping_period = 1.day.from_now.to_date..3.days.from_now.to_date
      expect(@resource_availability.during?(overlapping_period)).to be_false
    end
  end

  describe "#during" do
    it "sets availability for each day of the given period" do
      @resource_availability.during(1.day.from_now.to_date..2.days.from_now.to_date)
      expect(@resource_availability.on?(1.day.from_now.to_date)).to be_true
      expect(@resource_availability.on?(2.day.from_now.to_date)).to be_true
    end
  end

  describe "#rate_during" do
    it "is only accessible to admin users" do
      pending "not implemented"
    end

    it "calculates availability during a given month" do
      today = Time.now
      expect(@resource_availability.rate_during(today)).to eq(0)
      @resource_availability.set_on 2.days.from_now
      expected_rate = 1/Time.days_in_month(today.month, today.year)
      expect(@resource_availability.rate_during(today)).to eq(expected_rate)
    end
  end


end

