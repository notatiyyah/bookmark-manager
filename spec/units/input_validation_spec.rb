require "spec_helper.rb"
require "input_validation.rb"

describe InputValidation do
  
  it "raises error if not valid url" do
    expect {InputValidation.check_url("not-valid-url")}.to raise_error "Not a valid URL"
  end

end