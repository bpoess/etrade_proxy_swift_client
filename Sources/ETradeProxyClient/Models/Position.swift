import Foundation

public struct Position: Sendable {
    public let adjPrevClose: Decimal
    public let commissions: Decimal
    public let costPerShare: Decimal
    public let dateAcquired: Date
    public let daysGain: Decimal
    public let daysGainPct: Decimal
    public let lotDetailUrl: String
    public let marketValue: Decimal
    public let otherFees: Decimal
    public let pctOfPortfolio: Decimal
    public let id: String
    public let indicator: String
    public let type: String
    public let pricePaid: Decimal
    public let product: Product
    public let quantity: Decimal
    public let quoteDetailUrl: String
    public let symbolDescription: String
    public let todayCommissions: Decimal
    public let todayFees: Decimal
    public let todayPricePaid: Decimal
    public let todayQuantity: Decimal
    public let totalCost: Decimal
    public let totalGain: Decimal
    public let totalGainPct: Decimal
    public let complete: PositionCompleteView?
    public let osiKey: String?
    public let quick: PositionQuickView?
}

public struct Product: Sendable {
    public let symbol: String
    public let securityType: String?
    public let securitySubType: String?
    public let callPut: String?
    public let expiryYear: Int32?
    public let expiryMonth: Int32?
    public let expiryDay: Int32?
    public let strikePrice: Decimal?
    public let expiryType: String?
    public let productId: ProductId?
}

public struct ProductId: Sendable {
    public let symbol: String
    public let typeCode: String
}

public struct PositionCompleteView: Sendable {
    public let adjLastTrade: Decimal
    public let adjPrevClose: Decimal
    public let adjPrice: Decimal
    public let annualDividend: Decimal
    public let ask: Decimal
    public let askSize: Int64
    public let baseSymbolAndPrice: String
    public let beta: Decimal
    public let bid: Decimal
    public let bidAskSpread: Decimal
    public let bidSize: Int64
    public let change: Decimal
    public let changePct: Decimal
    public let currency: String
    public let cusip: String
    public let daysRange: String
    public let deliverablesStr: String
    public let delta: Decimal
    public let delta52WkHigh: Decimal
    public let delta52WkLow: Decimal
    public let divYield: Decimal
    public let dividend: Decimal
    public let eps: Decimal
    public let exchange: String
    public let gamma: Decimal
    public let intrinsicValue: Decimal
    public let ivPct: Decimal
    public let lastTrade: Decimal
    public let lastTradeTime: Date
    public let marginable: Bool
    public let marketCap: Decimal
    public let open: Decimal
    public let openInterest: Decimal
    public let optionMultiplier: Decimal
    public let optionsAdjustedFlag: Bool
    public let peRatio: Decimal
    public let premium: Decimal
    public let prevClose: Decimal
    public let price: Decimal
    public let priceAdjustedFlag: Bool
    public let quoteStatus: String
    public let rho: Decimal
    public let sv10DaysAvg: Decimal
    public let sv1MonAvg: Decimal
    public let sv20DaysAvg: Decimal
    public let sv2MonAvg: Decimal
    public let sv3MonAvg: Decimal
    public let sv4MonAvg: Decimal
    public let sv6MonAvg: Decimal
    public let symbolDescription: String
    public let tenDayVolume: Int64
    public let theta: Decimal
    public let vega: Decimal
    public let volume: Decimal
    public let week52High: Decimal
    public let week52Low: Decimal
    public let week52Range: String
    public let daysToExpiration: Int64?
    public let divPayDate: Date?
    public let estEarnings: Decimal?
    public let exDividendDate: Date?
    public let perform12Month: Decimal?
    public let perform1Month: Decimal?
    public let perform3Month: Decimal?
    public let perform6Month: Decimal?
    public let prevDayVolume: Decimal?
}

public struct PositionQuickView: Sendable {
    public let change: Decimal
    public let changePct: Decimal
    public let lastTrade: Decimal
    public let lastTradeTime: Date
    public let quoteStatus: String
    public let volume: Decimal
}
