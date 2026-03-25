import Foundation
import GRPCCore
import GRPCNIOTransportHTTP2
import GRPCProtobuf

public final class ETradeClient: Sendable {
    private let grpcClient: GRPCClient<HTTP2ClientTransport.Posix>
    private let connectionTask: Task<Void, any Error>

    public init(host: String, port: Int) throws {
        let transport = try HTTP2ClientTransport.Posix(
            target: .dns(host: host, port: port),
            transportSecurity: .plaintext
        )
        let client = GRPCClient(transport: transport)
        self.grpcClient = client
        self.connectionTask = Task { try await client.runConnections() }
    }

    public func close() {
        grpcClient.beginGracefulShutdown()
    }

    private var proxyService: Etrade_ProxyService.Client<HTTP2ClientTransport.Posix> {
        Etrade_ProxyService.Client<HTTP2ClientTransport.Posix>(wrapping: grpcClient)
    }

    // MARK: - Authentication

    public func getAuthenticationStatus() async throws -> Bool {
        do {
            let response = try await proxyService.getAuthenticationStatus(Etrade_GetAuthenticationStatusRequest())
            return response.isAuthenticated
        } catch let error as RPCError {
            throw ETradeError(rpcError: error)
        }
    }

    public func getAuthorizationUrl() async throws -> String {
        do {
            let response = try await proxyService.getAuthorizationUrl(Etrade_GetAuthorizationUrlRequest())
            return response.url
        } catch let error as RPCError {
            throw ETradeError(rpcError: error)
        }
    }

    public func completeAuthorization(verificationCode: String) async throws {
        do {
            var request = Etrade_CompleteAuthorizationRequest()
            request.verificationCode = verificationCode
            _ = try await proxyService.completeAuthorization(request)
        } catch let error as RPCError {
            throw ETradeError(rpcError: error)
        }
    }

    // MARK: - Accounts

    public func listAccounts() async throws -> [Account] {
        do {
            let response = try await proxyService.listAccounts(Etrade_ListAccountsRequest())
            return try response.accounts.map { try Account(proto: $0) }
        } catch let error as RPCError {
            throw ETradeError(rpcError: error)
        }
    }

    // MARK: - Positions

    public func listPositions(accountIdKey: String, view: String? = nil) async throws -> [Position] {
        do {
            var request = Etrade_ListPositionsRequest()
            request.accountIDKey = accountIdKey
            if let view { request.view = view }
            return try await proxyService.listPositions(request) { response in
                try await response.messages.reduce(into: []) { result, proto in
                    try result.append(Position(proto: proto))
                }
            }
        } catch let error as RPCError {
            throw ETradeError(rpcError: error)
        }
    }

    // MARK: - Quotes

    public func listQuotes(symbols: [String], detailFlag: String? = nil) async throws -> [Quote] {
        do {
            var request = Etrade_ListQuotesRequest()
            request.symbols = symbols
            if let detailFlag { request.detailFlag = detailFlag }
            return try await proxyService.listQuotes(request) { response in
                try await response.messages.reduce(into: []) { result, proto in
                    try result.append(Quote(proto: proto))
                }
            }
        } catch let error as RPCError {
            throw ETradeError(rpcError: error)
        }
    }

    // MARK: - Orders

    public func listOrders(
        accountIdKey: String,
        startDate: String,
        endDate: String,
        status: String? = nil
    ) async throws -> [Order] {
        do {
            var request = Etrade_ListOrdersRequest()
            request.accountIDKey = accountIdKey
            request.startDate = startDate
            request.endDate = endDate
            if let status { request.status = status }
            return try await proxyService.listOrders(request) { response in
                try await response.messages.reduce(into: []) { result, proto in
                    try result.append(Order(proto: proto))
                }
            }
        } catch let error as RPCError {
            throw ETradeError(rpcError: error)
        }
    }

    public func getOrderDetails(detailsUrl: String) async throws -> [Order] {
        do {
            var request = Etrade_GetOrderDetailsRequest()
            request.detailsURL = detailsUrl
            let response = try await proxyService.getOrderDetails(request)
            return try response.orders.map { try Order(proto: $0) }
        } catch let error as RPCError {
            throw ETradeError(rpcError: error)
        }
    }

    // MARK: - Transactions

    public func listTransactions(
        accountIdKey: String,
        startDate: String,
        endDate: String
    ) async throws -> [Transaction] {
        do {
            var request = Etrade_ListTransactionsRequest()
            request.accountIDKey = accountIdKey
            request.startDate = startDate
            request.endDate = endDate
            return try await proxyService.listTransactions(request) { response in
                try await response.messages.reduce(into: []) { result, proto in
                    try result.append(Transaction(proto: proto))
                }
            }
        } catch let error as RPCError {
            throw ETradeError(rpcError: error)
        }
    }

    public func getTransactionDetails(
        accountIdKey: String,
        transactionId: String
    ) async throws -> Transaction {
        do {
            var request = Etrade_GetTransactionDetailsRequest()
            request.accountIDKey = accountIdKey
            request.transactionID = transactionId
            let response = try await proxyService.getTransactionDetails(request)
            return try Transaction(proto: response.transaction)
        } catch let error as RPCError {
            throw ETradeError(rpcError: error)
        }
    }

    // MARK: - Options

    public func getOptionChains(
        symbol: String,
        expiryYear: Int32? = nil,
        expiryMonth: Int32? = nil,
        expiryDay: Int32? = nil,
        strikePriceNear: Int32? = nil,
        noOfStrikes: Int32? = nil,
        includeWeekly: Bool? = nil,
        skipAdjusted: Bool? = nil,
        optionCategory: String? = nil,
        chainType: String? = nil,
        priceType: String? = nil
    ) async throws -> OptionChains {
        do {
            var request = Etrade_GetOptionChainsRequest()
            request.symbol = symbol
            if let expiryYear { request.expiryYear = expiryYear }
            if let expiryMonth { request.expiryMonth = expiryMonth }
            if let expiryDay { request.expiryDay = expiryDay }
            if let strikePriceNear { request.strikePriceNear = strikePriceNear }
            if let noOfStrikes { request.noOfStrikes = noOfStrikes }
            if let includeWeekly { request.includeWeekly = includeWeekly }
            if let skipAdjusted { request.skipAdjusted = skipAdjusted }
            if let optionCategory { request.optionCategory = optionCategory }
            if let chainType { request.chainType = chainType }
            if let priceType { request.priceType = priceType }
            let response = try await proxyService.getOptionChains(request)
            return try OptionChains(proto: response)
        } catch let error as RPCError {
            throw ETradeError(rpcError: error)
        }
    }

    public func getOptionExpireDates(
        symbol: String,
        expiryType: String? = nil
    ) async throws -> [ExpirationDate] {
        do {
            var request = Etrade_GetOptionExpireDatesRequest()
            request.symbol = symbol
            if let expiryType { request.expiryType = expiryType }
            let response = try await proxyService.getOptionExpireDates(request)
            return response.dates.map { ExpirationDate(proto: $0) }
        } catch let error as RPCError {
            throw ETradeError(rpcError: error)
        }
    }
}
