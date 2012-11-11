module SexxyEmails
  extend ActiveSupport::Autoload
  extend ActiveSupport::Concern

  autoload :Css

  included do |base|
    base.instance_eval do
      helper SexxyEmails::MailerHelper
    end
  end

  module MailerHelper
    def stylesheet_include_tag(css)
      path = css.match(/\.css/) ? s : "#{css}.css"
      content_tag(:style) do
        File.open(File.join(Rails.root, 'public', 'stylesheets', path)).read
      end
    end
  end

  # module ClassMethods
  #   # Some day we'll use ClassMethods
  # end

  module InstanceMethods
    protected
    def render(*args)
      SexxyEmails::Css.inline(super(*args))
    end
  end
end
