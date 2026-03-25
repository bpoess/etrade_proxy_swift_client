# ETradeProxyClient

Swift 6 client library for the [E*Trade proxy server](https://github.com/bpoess/options_analytics) gRPC interface. Wraps the generated proto types in idiomatic Swift with `Foundation.Decimal` for financial values, `Date` for timestamps, and a typed `ETradeError` enum.

## Adding the dependency

In your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/bpoess/etrade_proxy_swift_client.git", branch: "main"),
]
```

Then add the product to your target:

```swift
.target(
    name: "YourTarget",
    dependencies: [
        .product(name: "ETradeProxyClient", package: "etrade_proxy_swift_client"),
    ]
)
```

## Usage

```swift
import ETradeProxyClient

let client = try ETradeClient(host: "localhost", port: 50051)

// Check authentication
let isAuthenticated = try await client.getAuthenticationStatus()

// List accounts
let accounts = try await client.listAccounts()

// Get positions
let positions = try await client.listPositions(accountIdKey: accounts[0].accountIdKey)

// Get quotes
let quotes = try await client.listQuotes(symbols: ["AAPL", "MSFT"])

// Get option chains
let chains = try await client.getOptionChains(symbol: "AAPL", noOfStrikes: 10)

// Shut down
client.close()
```

## Regenerating proto code

After modifying `proto/etrade/proxy_service.proto`:

```bash
./scripts/generate-proto.sh
```

The script builds the protoc plugins on first run (cached in `.cache/`).
