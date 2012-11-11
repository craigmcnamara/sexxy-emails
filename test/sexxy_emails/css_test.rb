require File.expand_path('../../test_helper', __FILE__)

describe SexxyEmails::Css do
  it "should respond to #inline(html, options)" do
    html = "<html><head></head><body></body></html>"
    SexxyEmails::Css.expects(:inline).once.with(html)
    SexxyEmails::Css.inline(html)
  end
end