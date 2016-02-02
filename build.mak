MAKE=make
RM=-rm -rf

# dirs:=$(shell find . -maxdepth 1 -type d)
# dirs:=$(basename $(patsubst ./%,%,$(dirs)))
# dirs:=$(filter-out $(exclude_dirs),$(dirs))
SUBDIRS:=$(dirs)
HOME?=~


# Phony Target
.PHONY:all copyt fake subdirs
all:$(DESTDIR) $(SUBT) subdirs


# subdir make
subdirs:$(SUBDIRS)
	for dir in $(SUBDIRS); \
		do $(MAKE) -C $$dir||exit 1; \
	done

# copy rule
ifdef DESTDIR
$(DESTDIR):
	mkdir $(DESTDIR)
endif

copyt:
ifdef SRCFILES
	cp $(SRCFILES) $(DESTDIR)/
endif


# clean
clean:
	for dir in $(SUBDIRS);\
		do $(MAKE) -C $$dir clean||exit 1;\
	done


# for debug
fake:
	@echo $(SRCFILES)
