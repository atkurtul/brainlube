

all:
	./compile_tests.sh

clean:
	rm ./tests/*.ll
	rm -rf ./bin