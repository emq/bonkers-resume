_When I was looking for a new job after taking few months off (needed to recharge my batteries) I created something called bonkers resume_ (patent pending). I had that idea in my head for months, but never had time to implement it. Until I did._

_I have send that resume in few places, unfortunately no one appreciated its form (as I did, obviously). Thus I'm sharing it on the github, maybe someone will find it somewhat amusing._

_It was ported from very messy repo, hopefully no typos were introduced._

### Story behind it

Wouldn't be it cool to have like a self-extracting resume written in Ruby? Not until recently I had time to really research the subject, and as it turns out - it's very easy doable thanks to magical `__DATA__` constant that Ruby provides ([see related stackoverflow question](https://stackoverflow.com/questions/2156629/can-i-access-the-data-from-a-required-script-in-ruby)). I don't think it's very well known - but for the task - it does the job pretty damn perfectly.

### First revision

Display some promp, grab the pdf file embeded in ruby file after `__END__` keyword, write it to disk via `File.write`, done.

### Few revisions later

Compress the pdf file, compress the ruby code responsible for extracting and decompressing the pdf file, decompress and load the compressed first piece of the code, `module_eval` and let it run, on top of that embed custom meme in jpg format and make sure it's size is divisible by `1337` by padding some zero bytes to it - so curious minds can easily spot it by looking at the `seek` on the data stream, done.

### Running

There is very unsophisticated makefile included that basically glues every part together simply using `cat` command. GhostScript is required for stripping pdf part - you can comment that out if you want.

    make
    build/resume.rb
