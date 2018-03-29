build:
	rm -rf *.gem
	gem build dlh.gemspec

install:
	gem install ./*.gem

irb:
	./bin/console

test:
	rake spec