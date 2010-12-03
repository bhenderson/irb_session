require "irb/irb_session_patch"

class IrbSession
  VERSION = '1.0.0'

  # purely for testing
  def self.start_irb # :nodoc:
    IRB.start_session(nil, binding)
  end
end
