require 'fivemat/elapsed_time'

module Fivemat
  autoload :Cucumber, 'fivemat/cucumber'
  autoload :MiniTest, 'fivemat/minitest/unit'
  autoload :RSpec, 'fivemat/rspec'
  autoload :RSpec3, 'fivemat/rspec3'
  autoload :Spec, 'fivemat/spec'

  def self.new(*args)
    case args.size
    when 0 then MiniTest::Unit
    when 1 then
      if ::RSpec::Core::Version::STRING >= '3.0.0'
        RSpec3
      else
        RSpec
      end
    when 2 then Spec
    when 3 then Cucumber
    else
      raise ArgumentError
    end.new(*args)
  end
end
