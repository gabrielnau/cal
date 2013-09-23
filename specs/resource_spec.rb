require File.join(__dir__, 'spec_helper.rb')

describe Resource do

  before :all do
    @resource = Resource.new
  end

  it "is by default unavailable" do
    expect(@resource.available_during?(Date.today, 1.month.from_now)).to be_false
  end

  describe "#available_on?" do
    it "returns true if the resource is available the given day" do
      @resource.available_on = 1.day.from_now
      expect(@resource.available_on?(1.day.from_now)).to be_true
    end

    it "returns false if the resource is unavailable the given day" do
      @resource.available_on = 10.day.from_now
      expect(@resource.available_on?(1.day.from_now)).to be_false
    end
  end

  describe "#available_during?" do
    before do
      @period = 1.day.from_now..20.days.from_now
      @resource.available_during = @period
    end

    it "returns true if the resource is available each day of the given period" do
      expect(@resource.available_during?(@period)).to be_true
    end

    it "returns false if there is at least one day where the resource is unavailable" do
      expect(@resource.available_during?(1.day.from_now..21.days.from_now)).to be_false
    end
  end

  describe "#available_on=" do
    it "is only settable by the resource's owner" do
      pending "not implemented"
    end

    it "sets the availability for a given day" do
      @resource.available_on = 1.day.from_now
      expect(@resource.available_on?(1.day.from_now)).to be_true
    end
  end

  describe "#availability_rate_during" do
    it "is only accessible to admin users" do
      pending "not implemented"
    end

    it "calculates availability during a given month" do
      tomorrow = Date.tomorrow
      expect(@resource.availability_rate_during(tomorrow.month)).to eq(0)
      @resource.available_on = Date.tomorrow
      expected_rate = 1/tomorrow.days_during_month
      expect(@resource.availability_rate_during(tomorrow.month)).to eq(expected_rate)
    end
  end

end

