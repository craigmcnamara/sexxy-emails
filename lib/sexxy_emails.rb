module SexxyEmails

  require File.expand_path('../sexxy_emails/css', __FILE__)

  VERSION = '0.0.4'.freeze

  class << self
    def public_folder
      if defined?(Padrino::Application) && apps = Padrino::Application.descendants
        apps.first.public_folder
      elsif defined?(Rails)
        Rails.public_path
      end
    end

    def included(base)
      if defined?(Padrino::Application) && base < Padrino::Application
        require File.expand_path('../sexxy_emails/padrino_mailer', __FILE__)
        Mail::Message.send(:include, PadrinoMailer::MailerHelper)
        Mail::Message.send(:include, PadrinoMailer::MailerMethods)
      elsif base < ::ActionMailer::Base
        require File.expand_path('../sexxy_emails/action_mailer', __FILE__)
        base.send(:include, ActionMailer::MailerMethods)
        base.instance_eval do
          helper SexxyEmails::ActionMailer::MailerHelper
        end
      end
    end
    # For Padrino
    alias :registered :included
  end
end
