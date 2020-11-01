sdk := arm
cfg := Release
BUILDS_DIR := Builds

#.PHONY: all

all: cmake_build

cmake_build:
ifneq ($(sdk),$(filter $(sdk),native arm))
	@echo "ERROR: sdk must be native or arm"
	@exit 1
endif

ifneq ($(cfg),$(filter $(cfg),Release Debug))
	@echo "ERROR: cfg must be Release or Debug"
	@exit 1
endif
	@mkdir -p $(BUILDS_DIR)/$(cfg)
	rm -fr $(BUILDS_DIR)/$(cfg)/CMakeCache.txt $(BUILDS_DIR)/$(cfg)/CMakeFiles
	cd $(BUILDS_DIR)/$(cfg) && cmake -DCMAKE_BUILD_TYPE=$(cfg) -DSDK=$(sdk) -DCMAKE_TOOLCHAIN_FILE=../../tools-$(sdk).cmake ../.. 
	@$(MAKE) --silent --directory=$(BUILDS_DIR)/$(cfg)
	@$(MAKE)  --silent --directory=$(BUILDS_DIR)/$(cfg) install

clean:
	rm -rf $(BUILDS_DIR)
	rm -rf lib/*
	rm -rf bin/*
