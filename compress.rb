require 'zlib'

File.open('build/resume', 'w') do |file|
  file.write Zlib::Deflate.deflate(File.read('resume.pdf'))
end

File.open('build/classes', 'w') do |file|
  file.write Zlib::Deflate.deflate(File.read('classes.rb'))
end
