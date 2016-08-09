=begin
THIS FILE IS DEPRECATED IN FAVOR OF EVERYTHING BEING CONTAINED IN THE dotfile.rb CLASS FILE
DO NOT USE THIS MODULE. DO NOT EXPECT UPDATES. DO NOT EXPECT FUNCTIONALITY
THIS FILE WILL BE REMOVED IN FUTURE VERSIONS
COPYRIGHT JACOB KILLELEA <jkillelea@protonmail.ch>
MIT LICENSE
=end

module DotFileUtils

  def self.basename(filepath)
    basename = File.basename filepath
  end

  def self.fullfilepath(filename)
    File.absolute_path filename
  end

  def self.is_dotted?(basename) # true if file begins with a '.'
    if basename[0] == '.'
      true
    else
      false
    end
  end

  def self.undot(basename) # removes a preceeding dot from the file name, if there is one
    if is_dotted? basename
      return basename[1...basename.length]
    else
      return basename
    end
  end

  def self.dot(basename) # adds a preceeding dot, if there isn't one
    if is_dotted? basename
      return basename
    else
      return ".#{basename}"
    end
  end

end
