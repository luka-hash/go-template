NAME := go-template

PREFIX ?= ~/.local
BINDIR ?= $(PREFIX)/bin

GO ?= go
GOFLAGS ?=

GOSRC = $(shell find . -type f -name '*.go')

RM ?= rm -f

.PHONY: default uninstall clean

default: run

$(NAME): $(GOSRC)
	$(GO) build $(GOFLAGS) -o $(NAME)
	
build: $(NAME)
	@true

run: $(GOSRC)
	$(GO) run $(GOFLAGS) $(GOSRC)

install: $(NAME)
	install -D -m755 $(NAME) $(DESTDIR)$(BINDIR)/$(NAME)

uninstall:
	$(RM) $(DESTDIR)$(BINDIR)/$(NAME)

clean:
	$(RM) $(NAME)

