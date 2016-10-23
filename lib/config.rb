Config = { # hold config values (keys are same as those in Options hash)
  :verbose => false
}
Options = { # available options, and their key (keys are same as those in Config hash)
  :verbose => ['-v', '--verbose']
}

# parse options, if a command line arg is one of the available switches, set relevant Config parameter to true
def parse_opts(arg_array)
  arg_array.each do |arg|
    Options.each_with_index { |(key, val), index| # val is a string array
      if val.include? arg
        Config[key] = true
      end
    }
  end
end

def if_verbose(string)
  if Config[:verbose]
    puts string
  else
    return nil
  end
end
