require 'spec_helper'

describe User do

  before :all do
    @user = User.create email: "user@example.com"
  end

  it "owns a resource" do
    @user.resources.create!(name: "car")
    expect(@user.resources.first.name).to eq("car")
  end

end

