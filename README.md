findme
======
findme is a very simple command line tool for getting your Mac's location.

Requirements
------------
* Mac OS X 10.6+

Tested on OS X 10.9 and 10.10 with Xcode 5.

Build
-----
```bash
$ git clone https://github.com/litesystems/findme.git
$ cd findme/
$ xcodebuild
```

Compiled binary file is located at `build/Release/findme`.  
You can copy binary into '/usr/local/bin/'.

Usage
-----
```bash
$ findme
35.0,135.0,100.0
```

Format: `<latitude>,<longitude>,<altitude>`

License
-------
The MIT License

See [LICENSE](LICENSE).
