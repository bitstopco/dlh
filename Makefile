build:
	rm -rf *.gem
	gem build dlh.gemspec

install:
	gem install ./*.gem