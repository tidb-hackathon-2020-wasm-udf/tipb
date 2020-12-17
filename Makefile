export GOGO_PROTOBUF := ${GOPATH}/pkg/mod/$(shell go mod graph | grep github.com/gogo/protobuf | sed -e 's/github.com\/pingcap\/tipb //g')

.PHONY: all go rust binlog c++

all: go rust binlog c++

go:
	./generate-go.sh

rust:
	cargo build

binlog:
	./generate-binlog.sh

c++:
	./generate-cpp.sh
