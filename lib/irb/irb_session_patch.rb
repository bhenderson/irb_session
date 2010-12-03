# thank you!

require "irb"

# I originally used the code snippet from
# {here}[http://jameskilton.com/2009/04/02/embedding-irb-into-your-ruby-application/],
# which turned out to be a snippet from `ruby-debug'. However, I was having
# problems with CNTR-C and I realized I didn't need to copy the code, I just
# needed to be able to actually pass Irb.new a workspace param which it
# expected.

module IRB
  # originally used the code snippet from the above link, which turned out to
  # be a snippet from `ruby-debug'. However, I was having problems with CNTR-C
  # and I realized I wanted to mimic irb, just be able to actually pass Irb.new
  # a workspace param which it expected.

  ##
  # === Examples
  #
  #   IRB.start_session(ap_path, binding)

  def self.start_session(ap_path = nil, binding = nil)
    @@hack_binding = binding
    IRB.start ap_path
  end

  private
    def self.get_binding
      @@hack_binding
    end

  ##
  # Open up the class in inject a WorkSpace into the initialize method

  class Irb

    ##
    # === Description
    #
    # inject WorkSpace into args of Irb.new because the lib doesn't allow us to
    # pass one and I'm not sure why if Irb.new takes one??

    def initialize *args
      workspace = args.shift
      # only override if someone isn't actually passing a WorkSpace object to
      # Irb.new
      workspace ||= WorkSpace.new(IRB.get_binding)
      args.unshift workspace
      org_initialize *args
    end
  end
end
