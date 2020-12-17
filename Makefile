GOGO_PROTOBUF := `go list -f "{{.Dir}}" -m github.com/gogo/protobuf`

.PHONY: all go rust binlog c++

all: go rust binlog c++

dependence:
	go mod download

go: dependence
	GOGO_PROTOBUF=${GOGO_PROTOBUF} ./generate-go.sh

rust: dependence
	GOGO_PROTOBUF=${GOGO_PROTOBUF} cargo build

binlog: dependence
	GOGO_PROTOBUF=${GOGO_PROTOBUF} ./generate-binlog.sh

c++: dependence
	GOGO_PROTOBUF=${GOGO_PROTOBUF} ./generate-cpp.sh
