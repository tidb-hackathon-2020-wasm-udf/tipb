export GOGO_PROTOBUF := $(shell go list -f "{{.Dir}}" -m github.com/gogo/protobuf)

.PHONY: all go rust binlog c++

all: go rust binlog c++

dependence:
	go mod download

go: dependence
	./generate-go.sh

rust: dependence
	cargo build

binlog: dependence
	./generate-binlog.sh

c++: dependence
	./generate-cpp.sh
