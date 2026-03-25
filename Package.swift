// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "ETradeProxyClient",
    platforms: [.macOS(.v15)],
    products: [
        .library(name: "ETradeProxyClient", targets: ["ETradeProxyClient"]),
    ],
    dependencies: [
        .package(url: "https://github.com/grpc/grpc-swift-2.git", from: "2.3.0"),
        .package(url: "https://github.com/grpc/grpc-swift-nio-transport.git", from: "2.6.0"),
        .package(url: "https://github.com/grpc/grpc-swift-protobuf.git", from: "2.2.1"),
        .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.31.0"),
    ],
    targets: [
        .target(
            name: "ETradeProxyClient",
            dependencies: [
                .product(name: "GRPCCore", package: "grpc-swift-2"),
                .product(name: "GRPCNIOTransportHTTP2", package: "grpc-swift-nio-transport"),
                .product(name: "GRPCProtobuf", package: "grpc-swift-protobuf"),
                .product(name: "SwiftProtobuf", package: "swift-protobuf"),
            ]
        ),
    ]
)
