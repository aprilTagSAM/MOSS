SRCS = $(shell ls *.c)
OBJS = $(SRCS:%.c=%.o)
TARGET = $(BIN_PATH)/MOSS-localization

CFLAGS := $(CFLAGS_STD) $(CFLAGS_COMMON) $(CFLAGS_VX) $(CFLAGS_LCMTYPES) $(CFLAGS_GRAPH) $(CFLAGS_SIM) $(CFLAGS_APRILTAG) $(CFLAGS_GRAPH) $(CFLAGS_SCANMATCH)
LDFLAGS := $(LDFLAGS_STD) $(LDFLAGS_COMMON) $(LDFLAGS_VX) $(LDFLAGS_LCMTYPES) $(LDFLAGS_GRAPH) $(LDLAGS_SIM) $(LDFLAGS_APRILTAG)  $(LDFLAGS_GRAPH)  $(LDFLAGS_SCANMATCH)
DEPS := $(DEPS_STD) $(DEPS_COMMON) $(DEPS_VX) $(DEPS_LCMTYPES) $(DEPS_GRAPH) $(DEPS_SIM) $(DEPS_APRILTAG) $(DEPS_GRAPH) $(DEPS_SCANMATCH)

include $(BUILD_COMMON)

all: $(TARGET)
	@/bin/true

$(TARGET): $(OBJS) $(DEPS)
	@$(LD) -o $@ $^ $(LDFLAGS)

clean:
	@rm -rf *.o $(OBJS) $(TARGET)
