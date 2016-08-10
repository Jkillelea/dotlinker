=begin
Copyright Jacob Killelea <jkillelea@protonmail.ch>
MIT license
=end

class DotFile

  attr_accessor :basename, :absolute_path, :dotfile_path

  def initialize(relative_filepath) # determine absolute path and basename from a given file path
    unless File.exists?(File.absolute_path relative_filepath)
      raise "File does not exist!"
    end
    @absolute_path = File.absolute_path relative_filepath
    @basename      = File.basename @absolute_path
    @dotfile_path  = "#{Dir.home}/#{self.dot}"
  end

  def is_dotted? # true if file begins with a '.'
    if @basename[0] == '.'
      true
    else
      false
    end
  end

  def undot # removes a preceeding dot from the file name, if there is one
    if self.is_dotted?
      return @basename[1...basename.length] # everything except the first character
    else
      return @basename
    end
  end

  def undot!
    @basename = self.undot
  end

  def dot # adds a preceeding dot, if there isn't one
    if self.is_dotted?
      return @basename
    else
      return ".#{@basename}"
    end
  end

end
