module SexxyEmails::ActionMailer
  module MailerMethods
    protected
    def render(*args)
      SexxyEmails::Css.inline(super(*args))
    end
  end

  module MailerHelper
    def stylesheet_include_tag(css)
      path = css.match(/\.css/) ? s : "#{css}.css"
      content_tag(:style) do
        File.open(File.join(SexxyEmails.public_folder, 'stylesheets', path)).read
      end
    end
  end
end