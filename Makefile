doc: lib/Supply/Timeout.pm6
	echo "[![Build Status](https://travis-ci.org/cono/p6-supply-timeout.svg?branch=master)](https://travis-ci.org/cono/p6-supply-timeout)" > README.md
	echo "" >> README.md
	perl6 --doc=Markdown lib/Supply/Timeout.pm6 >> README.md

test:
	prove --exec 'perl6 -Ilib' -r t
