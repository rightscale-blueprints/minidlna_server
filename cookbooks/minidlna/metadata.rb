maintainer       "Michael Paul Thomas Conigliaro"
maintainer_email "mike [at] conigliaro [dot] org"
license          ""
description      "Installs/Configures minidlna"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

depends "monit"

recipe "minidlna", "Installs/configures MiniDLNA."