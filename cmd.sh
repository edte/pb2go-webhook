#!/bin/bash

func judge() {
    if command -v buf >/dev/null 2>&1; then 
    else 
        init() 
    fi
}

function init() {
    go install github.com/rookie-ninja/rk/cmd/rk@latest
    rk install buf
    rk install protobuf
    rk install protoc-gen-go
}

judge()

buf generate

cp /tmp/api/* .

git add *

git commit -m "feat(*): update"

git push
