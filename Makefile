MIX = mix

ERLANG_PATH = $(shell erl -eval 'io:format("~s", [lists:concat([code:root_dir(), "/erts-", erlang:system_info(version), "/include"])])' -s init stop -noshell)
CFLAGS += -I"$(ERLANG_PATH)"
CFLAGS += -I c_src/secp256k1 -I c_src/secp256k1/src -I c_src/secp256k1/include

ifeq ($(wildcard deps/libsecp256k1),)
	LIB_PATH = ../libsecp256k1
else
	LIB_PATH = deps/libsecp256k1
endif

CFLAGS += -I$(LIB_PATH)/src

ifneq ($(OS),Windows_NT)
	CFLAGS += -fPIC

	ifeq ($(shell uname),Darwin)
		LDFLAGS += -dynamiclib -undefined dynamic_lookup
	endif
endif

LDFLAGS += c_src/secp256k1/.libs/libsecp256k1.a -lgmp

.PHONY: clean

all: priv/libsecp256k1_nif.so

priv/libsecp256k1_nif.so: c_src/libsecp256k1_nif.c
	c_src/build_deps.sh
	$(CC) $(CFLAGS) -shared -o $@ c_src/libsecp256k1_nif.c $(LDFLAGS)

clean:
	$(MIX) clean
	c_src/build_deps.sh clean
	$(MAKE) -C $(LIB_PATH) clean
	$(RM) priv/libsecp256k1_nif.so
