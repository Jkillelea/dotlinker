module DotFileUtils

  def self.basename(filepath)
    basename = `basename #{filepath}`.chomp
  end

  def self.fullfilepath(filename)
    File.absolute_path filename
  end

  def self.is_dotted? # true if file begins with a '.'
    if basename[0] == '.'
      true
    else
      false
    end
  end

  def self.undot(basename) # removes a preceeding dot from the file name, if there is one
      return basename[1...basename.length]
  end

  def self.dot(basename) # adds a preceeding dot, if there isn't one
      return ".#{basename}"
  end

end
