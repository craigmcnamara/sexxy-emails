ENV['PADRINO_ENV'] = 'test'
PADRINO_ROOT = File.dirname(__FILE__) unless defined? PADRINO_ROOT

class PadrinoApp < Padrino::Application
  register Padrino::Rendering
  register Padrino::Helpers
  register Padrino::Mailer
  register SexxyEmails

  set :delivery_method, :test
  self.logger.level = 7

  mailer :example do
    email :basic do
      subject "Sexxy Emails!"
      to      'john@fake.com'
      from    'noreply@fake.com'
      # locals  :name => name, :age => age
      via     :test
      render  'basic'
    end
  end

  get :index do
    "Index"
  end

  def self.send_mail(sym)
    deliver(:example, sym)
  end
end