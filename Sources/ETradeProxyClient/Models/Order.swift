import Foundation

public struct ListOrderItem: Sendable {
    public let id: String
}

public struct OrderDetails: Sendable {
    public let events: [OrderEvent]
    public let orderDetail: [OrderDetail]
    public let id: String
    public let type: String?
}

public struct OrderEvent: Sendable {
    public let dateTime: Date
    public let instruments: [OrderInstrument]
    public let name: String
}

public struct OrderInstrument: Sendable {
    public let estimatedCommission: Decimal
    public let estimatedFees: Decimal
    public let filledQuantity: Decimal
    public let orderAction: String
    public let orderedQuantity: Decimal
    public let product: Product
    public let quantityType: String
    public let symbolDescription: String
    public let averageExecutionPrice: Decimal?
}

public struct OrderDetail: Sendable {
    public let allOrNone: Bool
    public let gcd: Int64
    public let instruments: [OrderInstrument]
    public let limitPrice: Decimal
    public let marketSession: String
    public let netAsk: Decimal
    public let netBid: Decimal
    public let netPrice: Decimal
    public let orderTerm: String
    public let orderValue: Decimal
    public let placedTime: Date
    public let priceType: String
    public let ratio: String
    public let status: String
    public let stopPrice: Decimal
    public let executedTime: Date?
    public let replacedByOrderId: String?
    public let replacesOrderId: String?
}
