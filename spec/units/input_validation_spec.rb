require "spec_helper.rb"
require "input_validation.rb"

describe InputVallidation do
  
  it "raises error if not valid url" do
    expect {InputVallidation.check_url("not-valid-url")}.to raise_error "Not a valid URL"
  end

end