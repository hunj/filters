all: build
build:
	ruby -c ./lib/*.rb
	ruby -c ./filters/*.rb
test:
	rspec
doc:
	rdoc
clean:
	rm -r doc