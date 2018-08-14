.DEFAULT_GOAL := resume

clean:
	rm -rf build

resume:
	make clean
	mkdir -p build
	# I generated real pdf with latex then compressed it further
	# leaving this for reference
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dNOPAUSE -dQUIET -dBATCH -sOutputFile=build/resume.pdf resume.pdf
	ruby compress.rb
	dd if=/dev/zero bs=1 count=629 >> build/blank
	cat resume.rb meme.jpg build/blank build/classes build/resume > build/resume.rb
	chmod +x build/resume.rb
