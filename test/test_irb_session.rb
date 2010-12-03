require "test/unit"
require "mocha"
require "irb_session"

class TestIrbSession < Test::Unit::TestCase

  class TestError < StandardError; end

  def get_binding
    # how hacky is this?!
    injected_binding = nil
    IRB::Context.expects(:new).with do |*params|
      injected_binding = params[1].binding
      Binding === injected_binding
    end.raises TestError
    # this is just because I don't want to actually go into irb.
    assert_raise TestIrbSession::TestError do
      IrbSession.start_irb
    end
    injected_binding
  end

  def test_binding_being_correctly_set
    injected_binding = get_binding
    # injected_binding should be from IrbSession.new
    vers = eval "VERSION", injected_binding
    assert_equal IrbSession::VERSION, vers
    klass_name = eval "self.name", injected_binding
    assert_equal IrbSession.name, klass_name
  end
end
