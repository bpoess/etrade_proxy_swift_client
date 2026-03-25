#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CACHE_DIR="$SCRIPT_DIR/.cache"
PROTOC="$SCRIPT_DIR/tools/protoc/bin/protoc"
GEN_DIR="$SCRIPT_DIR/Sources/ETradeProxyClient/Generated"

SWIFT_PROTOBUF_DIR="$CACHE_DIR/swift-protobuf"
GRPC_PROTOBUF_DIR="$CACHE_DIR/grpc-swift-protobuf"
SWIFT_PLUGIN="$SWIFT_PROTOBUF_DIR/.build/arm64-apple-macosx/release/protoc-gen-swift"
GRPC_PLUGIN="$GRPC_PROTOBUF_DIR/.build/arm64-apple-macosx/release/protoc-gen-grpc-swift-2"

# --- Build protoc-gen-swift if missing ---

if [ ! -x "$SWIFT_PLUGIN" ]; then
    echo "Building protoc-gen-swift..."
    if [ ! -d "$SWIFT_PROTOBUF_DIR" ]; then
        git clone https://github.com/apple/swift-protobuf.git "$SWIFT_PROTOBUF_DIR"
    fi
    cd "$SWIFT_PROTOBUF_DIR"
    git submodule update --init --recursive
    swift build -c release \
        --package-path "$SWIFT_PROTOBUF_DIR" \
        --scratch-path "$SWIFT_PROTOBUF_DIR/.build" \
        --product protoc-gen-swift
    cd "$SCRIPT_DIR"
    echo "Built protoc-gen-swift."
fi

# --- Build protoc-gen-grpc-swift-2 if missing ---

if [ ! -x "$GRPC_PLUGIN" ]; then
    echo "Building protoc-gen-grpc-swift-2..."
    if [ ! -d "$GRPC_PROTOBUF_DIR" ]; then
        git clone https://github.com/grpc/grpc-swift-protobuf.git "$GRPC_PROTOBUF_DIR"
    fi
    swift build -c release \
        --package-path "$GRPC_PROTOBUF_DIR" \
        --scratch-path "$GRPC_PROTOBUF_DIR/.build" \
        --product protoc-gen-grpc-swift-2
    echo "Built protoc-gen-grpc-swift-2."
fi

# --- Clean existing generated files ---

rm -f "$GEN_DIR"/*.swift
rm -rf "$GEN_DIR"/etrade "$GEN_DIR"/google

# --- Generate ---

echo "Running protoc..."
"$PROTOC" \
    --proto_path="$SCRIPT_DIR/proto" \
    --proto_path="$SCRIPT_DIR/tools/protoc/include" \
    --plugin=protoc-gen-swift="$SWIFT_PLUGIN" \
    --swift_out="$GEN_DIR" \
    --swift_opt=Visibility=Internal \
    --plugin=protoc-gen-grpc-swift-2="$GRPC_PLUGIN" \
    --grpc-swift-2_out="$GEN_DIR" \
    --grpc-swift-2_opt=Visibility=Internal \
    "$SCRIPT_DIR/proto/etrade/proxy_service.proto" \
    "$SCRIPT_DIR/proto/google/type/decimal.proto"

# --- Flatten generated subdirectories ---

find "$GEN_DIR" -mindepth 2 -name "*.swift" -exec mv {} "$GEN_DIR/" \;
find "$GEN_DIR" -mindepth 1 -type d -empty -delete

# --- Remove unnecessary generated file ---

rm -f "$GEN_DIR/decimal.grpc.swift"

# --- Summary ---

echo "Generated files:"
ls -1 "$GEN_DIR"/*.swift
