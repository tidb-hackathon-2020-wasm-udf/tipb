export GOGO_PROTOBUF := ${GOPATH}/pkg/mod/$(shell go mod graph | grep github.com/gogo/protobuf | sed -e 's/github.com\/pingcap\/tipb //g')

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
