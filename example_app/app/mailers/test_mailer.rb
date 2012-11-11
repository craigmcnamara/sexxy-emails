class TestMailer < ActionMailer::Base
  include SexxyEmails

  def basic_css
    mail(:to => "sexxy-email@test.com", :subject => "Test email subject line")
  end
end