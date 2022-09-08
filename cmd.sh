#!/bin/bash


init() {
    echo "begin init"
    go install github.com/rookie-ninja/rk/cmd/rk@latest
    rk install buf
    rk install protobuf
    rk install protoc-gen-go
    echo "end init"
}

judge() {
    if command -v buf >/dev/null 2>&1; then 
        echo "cmd exist";
    else 
        init
    fi
}

echo "begin judge.."
judge
echo "end judge"

echo "enter $PB_SRC_DIR"
cd $PB_SRC_DIR

echo "begin build pb"

git pull

buf generate

echo "build pb succ"

echo "enter $PB_GO_DIR"

cd $PB_GO_DIR

echo "cp go to api project"

cp -r /tmp/api/* .

echo "begin push api project"

git add *

git commit -m "feat(*): update"

git push

echo "update succ"
