=begin
  TODO: include an '--as' flag so you can call `dotlinker filename --as dotfile_name`
  that'd make it very easy to keep a lot of profiles in some folder and give each one a unique name
  and still be able to swap them in and out of the same symlink spot.
  This requires rewiting some of the parsing logic so that it understands that not everything it is sent
  is either a filename or a flag (there will now be settings for the --as flag)
=end
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

  def self.verbose?
    Settings[:verbose]
  end
  def self.help?
    Settings[:help]
  end
  def self.settings
    Settings
  end
  def self.options
    Options
  end
end
