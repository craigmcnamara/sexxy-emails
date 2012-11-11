module SexxyEmails
  extend ActiveSupport::Concern

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
