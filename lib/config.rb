module Config
  Settings = { # hold config values (keys are same as those in Options hash)
    :verbose => false
  }
  Options = { # available options, and their key (keys are same as those in Settings hash)
    :verbose => ['-v', '--verbose']
  }

  # parse options, if a command line arg is one of the available switches, set relevant Settings parameter to true
  def self.parse_opts(arg_array)
    arg_array.each do |arg|
      Options.each_with_index { |(key, val), index| # val is a string array
        if val.include? arg
          Settings[key] = true
        end
      }
    end
  end

  def self.if_verbose(string)
    if Settings[:verbose]
      puts string
    end
  end
end
