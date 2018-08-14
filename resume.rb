#!/usr/bin/env ruby
# Ruby >= 2.3 required
require 'etc'
require 'zlib'

module Resume
  BYTES = 490
end

DATA.seek(1337 * 32, IO::SEEK_CUR)
Resume.module_eval(
  Zlib::Inflate.inflate(DATA.read(Resume::BYTES)).force_encoding('utf-8')
)

printf Resume::Banner.prompt.chomp
resume = Resume::File.new($stdin.gets.strip)

if resume.exists?
  puts 'It seems that such already exists!'
else
  resume.write
  puts 'Resume decompressed successfully! 😺'
end

__END__
