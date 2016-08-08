require_relative "dotfileutils.rb"

class DotFile

  attr_accessor :basename, :absolute_path, :dotfile_path

  def initialize(relative_filepath) # determine absolute path and basename from a given file path
    unless File.exists?(File.absolute_path relative_filepath)
      raise "File does not exist!"
    end
    @absolute_path = File.absolute_path relative_filepath
    @basename = File.basename @absolute_path
  end

  def is_dotted? # true if file begins with a '.'
    if basename[0] == '.'
      true
    else
      false
    end
  end

  def undot # removes a preceeding dot from the file name, if there is one
    unless self.is_dotted?
      return DotFileUtils::undot @basename
    else
      return @basename
    end
  end

  def undot!
    @basename = self.undot
  end

  def dot # adds a preceeding dot, if there isn't one
    unless self.is_dotted?
      return DotFileUtils::dot @basename
    else
      return @basename
    end
  end
  # def dot!
  #   @basename = self.dot
  # end


end
