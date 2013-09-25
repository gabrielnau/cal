require 'spec_helper'

describe Resource do

  before :all do
    @user = User.create email: "user@example.com"
    @user.resources.create name: "car"
  end

  it "is by default unavailable" do
    period = 1.day.from_now.to_date..1.month.from_now.to_date
    expect(@resource.available_during?(period)).to be_false
  end

  describe "#available_on?" do
    it "returns true if the resource is available the given day" do
      @resource.available_on = 1.day.from_now.to_date
      expect(@resource.available_on?(1.day.from_now.to_date)).to be_true
    end

    it "returns false if the resource is unavailable the given day" do
      @resource.available_on = 10.day.from_now.to_date
      puts @resource.availability_dates
      expect(@resource.available_on?(1.day.from_now.to_date)).to be_false
    end
  end

  describe "#available_on=" do
    it "is only settable by the resource's owner" do
      pending "not implemented"
    end

    it "sets the availability for a given day" do
      @resource.available_on = 1.day.from_now.to_date
      expect(@resource.available_on?(1.day.from_now.to_date)).to be_true
    end
  end

  describe "#available_during?" do
    before do
      @period = 1.day.from_now.to_date..20.days.from_now.to_date
      @resource.available_during = @period
    end

    it "returns true if the resource is available each day of the given period" do
      expect(@resource.available_during?(@period)).to be_true
    end

    it "returns false if there is at least one day where the resource is unavailable" do
      overlapping_period = 1.day.from_now.to_date..21.days.from_now.to_date
      expect(@resource.available_during?(overlapping_period)).to be_false
    end
  end

  describe "#available_during=" do

  end

  describe "#availability_rate_during" do
    it "is only accessible to admin users" do
      pending "not implemented"
    end

    it "calculates availability during a given month" do
      tomorrow = Date.tomorrow
      expect(@resource.availability_rate_during(tomorrow)).to eq(0)
      @resource.available_on = 2.days.from_now
      expected_rate = 1/tomorrow.days_during_month
      expect(@resource.availability_rate_during(tomorrow)).to eq(expected_rate)
    end
  end

end

