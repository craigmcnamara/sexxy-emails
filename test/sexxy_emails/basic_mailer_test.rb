require_relative '../test_helper'

describe TestMailer do  
  it "should inline the css on render" do
    SexxyEmails::Css.expects(:inline).once
    TestMailer.basic_css.deliver
  end

  it "should properly style the paragraph tags" do
    message = TestMailer.basic_css
    assert_match /<p style="font-size: 36px; font-family: Helvetica, sans-serif;">/, message.to_s
  end
end