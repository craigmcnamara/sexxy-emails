require_relative '../test_helper'

describe TestMailer do  
  it "should inline the css on render" do
    SexxyEmails::Css.expects(:inline).once
    TestMailer.basic_css.deliver
  end
end