= irb_session

* http://github.com/bhenderson/irb_session.git

== DESCRIPTION:

Patch for irb so that you can use IRB.start from within your object and irb
will start with your object loaded as self.

== FEATURES/PROBLEMS:

* I'm not sure if this is the best way. It seems to interfere when you actually
  want to run ruby-debug in your project. By interfere I mean it just throws warnings.

* Does auto require irb for you.

== SYNOPSIS:

  class Klass
    def initialize
      @config = "my config"
    end

    def start_irb
      IRB.start_session(ap_path, binding)
    end
  end

  Klass.new.start_irb
  > @config
   => "my config"

== INSTALL:

* git clone http://github.com/bhenderson/irb_session.git

== DEVELOPERS:

After checking out the source, run:

  $ rake newb

This task will install any missing dependencies, run the tests/specs,
and generate the RDoc.

== LICENSE:

(The MIT License)

Copyright (c) 2010 bhenderson

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
