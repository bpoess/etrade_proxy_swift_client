import Foundation

public struct AccountBalance: Sendable {
    public let description: String
    public let id: String
    public let mode: String
    public let type: String
    public let cash: BalanceCash
    public let computed: BalanceComputed
    public let dayTraderStatus: String
    public let optionLevel: String
    public let quoteMode: Int64
}

public struct BalanceCash: Sendable {
    public let fundsForOpenOrdersCash: Decimal
    public let moneyMktBalance: Decimal
}

public struct BalanceComputed: Sendable {
    public let accountBalance: Decimal
    public let cashAvailableForInvestment: Decimal
    public let cashAvailableForWithdrawal: Decimal
    public let cashBalance: Decimal
    public let cashBuyingPower: Decimal
    public let dtCashBuyingPower: Decimal
    public let dtMarginBuyingPower: Decimal
    public let marginBuyingPower: Decimal
    public let netCash: Decimal
    public let openCalls: BalanceOpenCalls
    public let realTimeValues: BalanceRealTimeValues
    public let settledCashForInvestment: Decimal
    public let shortAdjustBalance: Decimal
    public let totalAvailableForWithdrawal: Decimal
    public let unSettledCashForInvestment: Decimal
    public let fundsWithheldFromPurchasePower: Decimal?
    public let fundsWithheldFromWithdrawal: Decimal?
    public let marginBalance: Decimal?
    public let regtEquity: Decimal?
    public let regtEquityPercent: Decimal?
}

public struct BalanceOpenCalls: Sendable {
    public let cashCall: Decimal
    public let fedCall: Decimal
    public let houseCall: Decimal
    public let minEquityCall: Decimal
}

public struct BalanceRealTimeValues: Sendable {
    public let netMv: Decimal
    public let netMvLong: Decimal
    public let netMvShort: Decimal
    public let totalAccountValue: Decimal
}
