import Foundation

public struct Transaction: Sendable, Codable {
    public let id: String
    public let accountId: String
    public let date: Date
    public let postDate: Date?
    public let amount: Decimal
    public let description: String
    public let brokerage: Brokerage
}

public struct Brokerage: Sendable, Codable {
    public let transactionType: String
    public let product: Product?
    public let quantity: Decimal
    public let price: Decimal
    public let settlementCurrency: String
    public let paymentCurrency: String
    public let fee: Decimal
    public let orderNo: String?
    public let memo: String
}

public struct ListTransactionItem: Sendable, Codable {
    public let accountId: String
    public let storeId: Int64
    public let id: String
    public let type: String
}
