module SexxyEmails
  extend ActiveSupport::Autoload
  extend ActiveSupport::Concern

  # Use ActiveSupports Autoload for happiness.
  autoload :Css

  included do |*args|
    logger.debug "Included args: #{args.to_s}"
    logger.warn "ActionMailer::Base becoming awesome."
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
