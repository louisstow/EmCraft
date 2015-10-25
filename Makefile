
SRC := $(wildcard src/*.c)
SRC += deps/lodepng/lodepng.c \
	deps/noise/noise.c \
	deps/sqlite/sqlite3.c \
	deps/tinycthread/tinycthread.c \
	#deps/glew/src/glew.c \

INCS := -I./deps/lodepng \
		-I./deps/noise \
		-I./deps/sqlite \
		-I./deps/tinycthread \
		#-I./deps/glew/include \

#-s USE_PTHREADS=1
SFLAGS := -s FULL_ES2=1 -s USE_GLFW=3 -s TOTAL_MEMORY=120000000 -s PRECISE_F32=1

all: $(SRC)
	emcc -O0 $(SFLAGS) --shell-file shell.html --preload-file shaders --preload-file textures $(INCS) $(SRC) -o ./build/game.html
