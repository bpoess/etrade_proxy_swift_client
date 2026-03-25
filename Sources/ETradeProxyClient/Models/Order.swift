import Foundation

public struct Order: Sendable {
    public let orderId: String
    public let orderType: String?
    public let executedTime: Date
    public let status: String
    public let events: [OrderEvent]
    public let detailsUrl: String
}

public struct OrderEvent: Sendable {
    public let name: String
    public let dateTime: Date
    public let instruments: [Instrument]
}

public struct Instrument: Sendable {
    public let product: Product
    public let orderAction: String
    public let orderedQuantity: Decimal
    public let quantityType: String
    public let averageExecutionPrice: Decimal?
    public let estimatedCommission: Decimal
    public let estimatedFees: Decimal
    public let filledQuantity: Decimal
    public let symbolDescription: String
}
