all: go rust binlog c++

export GOGO_PROTOBUF := ${GOPATH}/pkg/mod/$(shell go mod graph | grep github.com/gogo/protobuf | sed -e 's/github.com\/pingcap\/tipb //g')

go:
	./generate-go.sh

rust:
	cargo build

binlog:
	./generate-binlog.sh

c++:
	./generate-cpp.sh
