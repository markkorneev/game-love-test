NAME = game-love-test

all: $(NAME)

clean:
	rm -rf build/

$(NAME): clean
	mkdir build
	(cd src/love-bundle/ ; zip -9 -q -r ../../build/$(NAME).love .)
	cp src/love-game-run.sh build/start.sh

build-and-run: $(NAME)
	build/start.sh
