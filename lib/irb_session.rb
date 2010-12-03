require "irb/irb_session_patch"

class IrbSession
  VERSION = '1.0.0'

  def self.start_irb
    IRB.start_session(nil, binding)
  end
end
