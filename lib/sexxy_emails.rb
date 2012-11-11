module SexxyEmails
  extend ActiveSupport::Autoload
  extend ActiveSupport::Concern

  # Use ActiveSupports Autoload for happiness.
  autoload :Css

  included do |base|
    puts "#{base} is now sexxy."
  end

  module ClassMethods
  end

  module InstanceMethods
    protected
    def render(*args)
      SexxyEmails::Css.inline(super(*args))
    end
  end
end
