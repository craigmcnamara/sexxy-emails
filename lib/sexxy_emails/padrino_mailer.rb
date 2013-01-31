module SexxyEmails::PadrinoMailer
  module MailerMethods
    private
    def render(*args)
      SexxyEmails::Css.inline(super(*args))
    end 
  end

  module MailerHelper
    def stylesheet_include_tag(css)
      path = css.match(/\.css/) ? css : "#{css}.css"
      style = "<style>"
      style << File.open(File.join(SexxyEmails.public_folder, 'stylesheets', path)).read
      style << "</style>"
    end
  end
end