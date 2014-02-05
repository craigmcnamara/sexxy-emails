module SexxyEmails::ActionMailer
  module MailerMethods
    protected
    def render(*args)
      SexxyEmails::Css.inline(super(*args))
    end
  end

  module MailerHelper
    def stylesheet_include_tag(css)
      path = css.match(/\.css/) ? css : "#{css}.css"
      content_tag(:style) do
        if defined? Rails and defined? Sprockets # Asset pipeline support
          Rails.application.assets[path].body
        else
          File.open(File.join(SexxyEmails.public_folder, 'stylesheets', path)).read
        end
      end
    end
  end
end