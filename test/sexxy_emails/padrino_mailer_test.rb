require File.expand_path('../../test_helper', __FILE__)

# Load the example app
require 'padrino'
require File.expand_path('../../example_padrino_app/app', __FILE__)

describe PadrinoApp do

  before do
    @message = PadrinoApp.send_mail(:basic)
    @message_body = @message.body.raw_source
  end

  it "should let me pry" do
    style = /<p style="font-size: 36px; font-family: Helvetica, sans-serif;">/
    assert_match style, @message_body
  end

end