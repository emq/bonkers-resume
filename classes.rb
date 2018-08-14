class File
  DEFAULT_FILENAME = "rafal_wojsznis.pdf"

  def initialize(prompt)
    @filename = prompt.empty? ? DEFAULT_FILENAME : prompt
  end

  def exists?
    ::File.exists?(filename)
  end

  def write
    ::File.write(filename, Zlib::Inflate.inflate(DATA.read))
  end

  private

  attr_reader :filename
end

class Banner
  USER_FALLBACK = "there"

  class << self
    def prompt
      <<~PROMPT
      \nHello #{username} 👋

      I hope you are having a great day so far.

      Please enter a filename for the resume or leave blank for default (#{File::DEFAULT_FILENAME}) and hit Enter:

      ✍️\s\s
      PROMPT
    end

    private

    def username
      login = Etc.getlogin
      info  = Etc.getpwnam(login)
      info.gecos.split(/,/).first
    rescue TypeError
      # getpwnam is kinda broken under Docker
      USER_FALLBACK
    end
  end
end
