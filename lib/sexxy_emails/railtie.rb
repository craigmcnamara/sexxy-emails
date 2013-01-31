require 'rails/railtie'

module SexxyEmails
  class Railtie < Rails::Railtie

    # config.after_initialize do |app|
    #   app.config.paths.add 'app/paths', eager_load: true

    #   if Rails.env.test?
    #     # Require test gems.
    #   end
    # end

    initializer "sexxy_emails.setup_action_mailer" do |app|
      ActiveSupport.on_load :action_mailer do
        SexxyEmails.setup_action_mailer self
      end
    end
  end
end
