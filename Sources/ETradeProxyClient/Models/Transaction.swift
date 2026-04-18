import Foundation

public struct Transaction: Identifiable, Sendable, Codable {
    public let id: String
    public let accountId: String
    public let date: Date
    public let postDate: Date?
    public let amount: Decimal
    // Named `txDescription` rather than `description` because SwiftData
    // `@Model` types reserve `description` (conflicts with CustomStringConvertible).
    public let txDescription: String
    public let brokerage: Brokerage

    public init(
        id: String,
        accountId: String,
        date: Date,
        postDate: Date? = nil,
        amount: Decimal,
        txDescription: String,
        brokerage: Brokerage
    ) {
        self.id = id
        self.accountId = accountId
        self.date = date
        self.postDate = postDate
        self.amount = amount
        self.txDescription = txDescription
        self.brokerage = brokerage
    }
    
    enum CodingKeys: String, CodingKey {
        case id, accountId, date, postDate, amount, txDescription, brokerage
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        do { id = try container.decode(String.self, forKey: .id) } catch {
            print("Decoding id failed: \(error)")
            throw error
        }
        do {
            accountId = try container.decode(String.self, forKey: .accountId)
        } catch {
            print("Decoding accountId failed: \(error)")
            throw error
        }
        do { date = try container.decode(Date.self, forKey: .date) } catch {
            print("Decoding date failed: \(error)")
            throw error
        }
        do {
            postDate = try container.decodeIfPresent(
                Date.self,
                forKey: .postDate
            )
        } catch {
            print("Decoding postDate failed: \(error)")
            throw error
        }
        do {
            amount = try container.decode(Decimal.self, forKey: .amount)
        } catch {
            print("Decoding amount failed: \(error)")
            throw error
        }
        do {
            txDescription =
                try container
                .decode(String.self, forKey: .txDescription)
        } catch {
            print("Decoding txDescription failed: \(error)")
            throw error
        }
        do {
            brokerage = try container.decode(Brokerage.self, forKey: .brokerage)
        } catch {
            print("Decoding brokerage failed: \(error)")
            throw error
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(accountId, forKey: .accountId)
        try container.encode(date, forKey: .date)
        try container.encodeIfPresent(postDate, forKey: .postDate)
        try container.encode(amount, forKey: .amount)
        try container.encode(txDescription, forKey: .txDescription)
        try container.encode(brokerage, forKey: .brokerage)
    }
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

    public init(
        transactionType: String,
        product: Product?,
        quantity: Decimal,
        price: Decimal,
        settlementCurrency: String,
        paymentCurrency: String,
        fee: Decimal,
        orderNo: String?,
        memo: String
    ) {
        self.transactionType = transactionType
        self.product = product
        self.quantity = quantity
        self.price = price
        self.settlementCurrency = settlementCurrency
        self.paymentCurrency = paymentCurrency
        self.fee = fee
        self.orderNo = orderNo
        self.memo = memo
    }

    enum CodingKeys: String, CodingKey {
        case transactionType, product, quantity, price, settlementCurrency,
            paymentCurrency, fee, orderNo, memo
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        do {
            self.transactionType =
                try container
                .decode(String.self, forKey: .transactionType)
            self.product =
                try container
                .decodeIfPresent(Product.self, forKey: .product)
            self.quantity = try container.decode(
                Decimal.self,
                forKey: .quantity
            )
            self.price = try container.decode(Decimal.self, forKey: .price)
            self.settlementCurrency =
                try container
                .decode(String.self, forKey: .settlementCurrency)
            self.paymentCurrency =
                try container
                .decode(String.self, forKey: .paymentCurrency)
            self.fee = try container.decode(Decimal.self, forKey: .fee)
            self.orderNo =
                try container
                .decodeIfPresent(String.self, forKey: .orderNo)
            self.memo = try container.decode(String.self, forKey: .memo)
        } catch {
            print("Unable to decode Brokerage \(error)")
            throw error
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(transactionType, forKey: .transactionType)
        try container.encodeIfPresent(product, forKey: .product)
        try container.encode(quantity, forKey: .quantity)
        try container.encode(price, forKey: .price)
        try container.encode(settlementCurrency, forKey: .settlementCurrency)
        try container.encode(paymentCurrency, forKey: .paymentCurrency)
        try container.encode(fee, forKey: .fee)
        try container.encodeIfPresent(orderNo, forKey: .orderNo)
        try container.encode(memo, forKey: .memo)
    }
}

public struct ListTransactionItem: Sendable, Codable {
    public let accountId: String
    public let storeId: Int64
    public let id: String
    public let type: String
}
