import Foundation

public struct Quote: Sendable, Codable {
    public let ahFlag: String
    public let dateTime: Date
    public let product: Product
    public let quoteStatus: String
    public let all: QuoteAllDetail?
    public let hasMiniOptions: Bool?
    public let option: QuoteOptionDetail?
}

public struct QuoteAllDetail: Sendable, Codable {
    public let adjustedFlag: Bool
    public let ask: Decimal
    public let askSize: Int64
    public let askTime: String
    public let averageVolume: Decimal
    public let beta: Decimal
    public let bid: Decimal
    public let bidExchange: String
    public let bidSize: Int64
    public let bidTime: String
    public let cashDeliverable: Decimal
    public let changeClose: Decimal
    public let changeClosePercentage: Decimal
    public let companyName: String
    public let contractSize: Decimal
    public let daysToExpiration: Int64
    public let declaredDividend: Decimal
    public let dirLast: String
    public let dividend: Decimal
    public let dividendPayableDate: Date
    public let eps: Decimal
    public let estEarnings: Decimal
    public let exDividendDate: Date
    public let expirationDate: Date
    public let high: Decimal
    public let high52: Decimal
    public let intrinsicValue: Decimal
    public let lastTrade: Decimal
    public let low: Decimal
    public let low52: Decimal
    public let marketCap: Decimal
    public let nextEarningDate: String
    public let open: Decimal
    public let openInterest: Int64
    public let optionMultiplier: Decimal
    public let optionStyle: String
    public let optionUnderlier: String
    public let pe: Decimal
    public let previousClose: Decimal
    public let previousDayVolume: Int64
    public let primaryExchange: String
    public let sharesOutstanding: Decimal
    public let symbolDescription: String
    public let timeOfLastTrade: Date
    public let timePremium: Decimal
    public let totalVolume: Decimal
    public let upc: Int64
    public let week52HiDate: Date
    public let week52LowDate: Date
    public let `yield`: Decimal
    public let optionPreviousAskPrice: Decimal?
    public let optionPreviousBidPrice: Decimal?
    public let optionUnderlierExchange: String?
    public let osiKey: String?
}

public struct QuoteOptionDetail: Sendable, Codable {
    public let ask: Decimal
    public let askSize: Int64
    public let bid: Decimal
    public let bidSize: Int64
    public let companyName: String
    public let contractSize: Decimal
    public let daysToExpiration: Int64
    public let intrinsicValue: Decimal
    public let lastTrade: Decimal
    public let openInterest: Int64
    public let optionMultiplier: Decimal
    public let optionPreviousAskPrice: Decimal
    public let optionPreviousBidPrice: Decimal
    public let osiKey: String
    public let symbolDescription: String
    public let timePremium: Decimal
    public let optionGreeks: OptionGreeks?
}

public struct OptionGreeks: Sendable, Codable {
    public let currentValue: Bool
    public let delta: Decimal
    public let gamma: Decimal
    public let iv: Decimal
    public let rho: Decimal
    public let theta: Decimal
    public let vega: Decimal
}
