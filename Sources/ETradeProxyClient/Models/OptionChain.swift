import Foundation

public struct OptionChains: Sendable, Codable {
    public let nearPrice: Decimal
    public let optionPairs: [OptionPair]
    public let quoteType: String
    public let selectedEd: SelectedEd
    public let timeStamp: Date
}

public struct OptionPair: Sendable, Codable {
    public let call: OptionLeg
    public let put: OptionLeg
}

public struct OptionLeg: Sendable, Codable {
    public let adjustedFlag: Bool
    public let ask: Decimal
    public let askSize: Int64
    public let bid: Decimal
    public let bidSize: Int64
    public let displaySymbol: String
    public let inTheMoney: String
    public let lastPrice: Decimal
    public let netChange: Decimal
    public let openInterest: Int64
    public let optionCategory: String
    public let optionGreeks: OptionGreeks
    public let optionRootSymbol: String
    public let optionType: String
    public let osiKey: String
    public let quoteDetail: String
    public let strikePrice: Decimal
    public let symbol: String
    public let timeStamp: Date
    public let volume: Int64
}

public struct SelectedEd: Sendable, Codable {
    public let day: Int64
    public let month: Int64
    public let year: Int64
}

public struct ExpirationDate: Sendable, Codable {
    public let day: Int64
    public let expiryType: String
    public let month: Int64
    public let year: Int64
}
