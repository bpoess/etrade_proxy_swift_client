import Foundation
import SwiftProtobuf

// MARK: - Account

extension Account {
    init(proto: Etrade_Account) throws {
        self.init(
            id: proto.accountID,
            idKey: proto.accountIDKey,
            name: proto.accountName,
            type: proto.accountType,
            institutionType: proto.institutionType,
            status: proto.accountStatus,
            closedDate: proto.hasClosedDate ? Date(proto: proto.closedDate) : nil,
            mode: proto.accountMode,
            desc: proto.hasAccountDesc ? proto.accountDesc : nil,
            instNo: proto.hasInstNo ? proto.instNo : nil,
            shareWorksAccount: proto.shareWorksAccount,
            shareWorksSource: proto.hasShareWorksSource ? proto.shareWorksSource : nil,
            fcManagedMssbClosedAccount: proto.fcManagedMssbClosedAccount
        )
    }
}

// MARK: - Product

extension ProductId {
    init(proto: Etrade_ProductId) {
        self.init(
            symbol: proto.symbol,
            typeCode: proto.typeCode
        )
    }
}

extension Product {
    init(proto: Etrade_Product) throws {
        self.init(
            symbol: proto.symbol,
            securityType: proto.hasSecurityType ? proto.securityType : nil,
            securitySubType: proto.hasSecuritySubType ? proto.securitySubType : nil,
            callPut: proto.hasCallPut ? proto.callPut : nil,
            expiryYear: proto.hasExpiryYear ? proto.expiryYear : nil,
            expiryMonth: proto.hasExpiryMonth ? proto.expiryMonth : nil,
            expiryDay: proto.hasExpiryDay ? proto.expiryDay : nil,
            strikePrice: proto.hasStrikePrice ? try Decimal(proto: proto.strikePrice) : nil,
            expiryType: proto.hasExpiryType ? proto.expiryType : nil,
            productId: proto.hasProductID ? ProductId(proto: proto.productID) : nil
        )
    }
}

// MARK: - Position

extension PositionCompleteView {
    init(proto: Etrade_PositionCompleteView) throws {
        self.init(
            adjLastTrade: try Decimal(proto: proto.adjLastTrade),
            adjPrevClose: try Decimal(proto: proto.adjPrevClose),
            adjPrice: try Decimal(proto: proto.adjPrice),
            annualDividend: try Decimal(proto: proto.annualDividend),
            ask: try Decimal(proto: proto.ask),
            askSize: proto.askSize,
            baseSymbolAndPrice: proto.baseSymbolAndPrice,
            beta: try Decimal(proto: proto.beta),
            bid: try Decimal(proto: proto.bid),
            bidAskSpread: try Decimal(proto: proto.bidAskSpread),
            bidSize: proto.bidSize,
            change: try Decimal(proto: proto.change),
            changePct: try Decimal(proto: proto.changePct),
            currency: proto.currency,
            cusip: proto.cusip,
            daysRange: proto.daysRange,
            deliverablesStr: proto.deliverablesStr,
            delta: try Decimal(proto: proto.delta),
            delta52WkHigh: try Decimal(proto: proto.delta52WkHigh),
            delta52WkLow: try Decimal(proto: proto.delta52WkLow),
            divYield: try Decimal(proto: proto.divYield),
            dividend: try Decimal(proto: proto.dividend),
            eps: try Decimal(proto: proto.eps),
            exchange: proto.exchange,
            gamma: try Decimal(proto: proto.gamma),
            intrinsicValue: try Decimal(proto: proto.intrinsicValue),
            ivPct: try Decimal(proto: proto.ivPct),
            lastTrade: try Decimal(proto: proto.lastTrade),
            lastTradeTime: Date(proto: proto.lastTradeTime),
            marginable: proto.marginable,
            marketCap: try Decimal(proto: proto.marketCap),
            open: try Decimal(proto: proto.open),
            openInterest: try Decimal(proto: proto.openInterest),
            optionMultiplier: try Decimal(proto: proto.optionMultiplier),
            optionsAdjustedFlag: proto.optionsAdjustedFlag,
            peRatio: try Decimal(proto: proto.peRatio),
            premium: try Decimal(proto: proto.premium),
            prevClose: try Decimal(proto: proto.prevClose),
            price: try Decimal(proto: proto.price),
            priceAdjustedFlag: proto.priceAdjustedFlag,
            quoteStatus: proto.quoteStatus,
            rho: try Decimal(proto: proto.rho),
            sv10DaysAvg: try Decimal(proto: proto.sv10DaysAvg),
            sv1MonAvg: try Decimal(proto: proto.sv1MonAvg),
            sv20DaysAvg: try Decimal(proto: proto.sv20DaysAvg),
            sv2MonAvg: try Decimal(proto: proto.sv2MonAvg),
            sv3MonAvg: try Decimal(proto: proto.sv3MonAvg),
            sv4MonAvg: try Decimal(proto: proto.sv4MonAvg),
            sv6MonAvg: try Decimal(proto: proto.sv6MonAvg),
            symbolDescription: proto.symbolDescription,
            tenDayVolume: proto.tenDayVolume,
            theta: try Decimal(proto: proto.theta),
            vega: try Decimal(proto: proto.vega),
            volume: try Decimal(proto: proto.volume),
            week52High: try Decimal(proto: proto.week52High),
            week52Low: try Decimal(proto: proto.week52Low),
            week52Range: proto.week52Range,
            daysToExpiration: proto.hasDaysToExpiration ? proto.daysToExpiration : nil,
            divPayDate: proto.hasDivPayDate ? Date(proto: proto.divPayDate) : nil,
            estEarnings: proto.hasEstEarnings ? try Decimal(proto: proto.estEarnings) : nil,
            exDividendDate: proto.hasExDividendDate ? Date(proto: proto.exDividendDate) : nil,
            perform12Month: proto.hasPerform12Month ? try Decimal(proto: proto.perform12Month) : nil,
            perform1Month: proto.hasPerform1Month ? try Decimal(proto: proto.perform1Month) : nil,
            perform3Month: proto.hasPerform3Month ? try Decimal(proto: proto.perform3Month) : nil,
            perform6Month: proto.hasPerform6Month ? try Decimal(proto: proto.perform6Month) : nil,
            prevDayVolume: proto.hasPrevDayVolume ? try Decimal(proto: proto.prevDayVolume) : nil
        )
    }
}

extension PositionQuickView {
    init(proto: Etrade_PositionQuickView) throws {
        self.init(
            change: try Decimal(proto: proto.change),
            changePct: try Decimal(proto: proto.changePct),
            lastTrade: try Decimal(proto: proto.lastTrade),
            lastTradeTime: Date(proto: proto.lastTradeTime),
            quoteStatus: proto.quoteStatus,
            volume: try Decimal(proto: proto.volume)
        )
    }
}

extension Position {
    init(proto: Etrade_Position) throws {
        self.init(
            adjPrevClose: try Decimal(proto: proto.adjPrevClose),
            commissions: try Decimal(proto: proto.commissions),
            costPerShare: try Decimal(proto: proto.costPerShare),
            dateAcquired: Date(proto: proto.dateAcquired),
            daysGain: try Decimal(proto: proto.daysGain),
            daysGainPct: try Decimal(proto: proto.daysGainPct),
            lotDetailUrl: proto.lotDetailURL,
            marketValue: try Decimal(proto: proto.marketValue),
            otherFees: try Decimal(proto: proto.otherFees),
            pctOfPortfolio: try Decimal(proto: proto.pctOfPortfolio),
            id: proto.positionID,
            indicator: proto.positionIndicator,
            type: proto.positionType,
            pricePaid: try Decimal(proto: proto.pricePaid),
            product: try Product(proto: proto.product),
            quantity: try Decimal(proto: proto.quantity),
            quoteDetailUrl: proto.quoteDetailURL,
            symbolDescription: proto.symbolDescription,
            todayCommissions: try Decimal(proto: proto.todayCommissions),
            todayFees: try Decimal(proto: proto.todayFees),
            todayPricePaid: try Decimal(proto: proto.todayPricePaid),
            todayQuantity: try Decimal(proto: proto.todayQuantity),
            totalCost: try Decimal(proto: proto.totalCost),
            totalGain: try Decimal(proto: proto.totalGain),
            totalGainPct: try Decimal(proto: proto.totalGainPct),
            complete: proto.hasComplete ? try PositionCompleteView(proto: proto.complete) : nil,
            osiKey: proto.hasOsiKey ? proto.osiKey : nil,
            quick: proto.hasQuick ? try PositionQuickView(proto: proto.quick) : nil
        )
    }
}

// MARK: - Quote

extension OptionGreeks {
    init(proto: Etrade_OptionGreeks) throws {
        self.init(
            currentValue: proto.currentValue,
            delta: try Decimal(proto: proto.delta),
            gamma: try Decimal(proto: proto.gamma),
            iv: try Decimal(proto: proto.iv),
            rho: try Decimal(proto: proto.rho),
            theta: try Decimal(proto: proto.theta),
            vega: try Decimal(proto: proto.vega)
        )
    }
}

extension QuoteAllDetail {
    init(proto: Etrade_QuoteAllDetail) throws {
        self.init(
            adjustedFlag: proto.adjustedFlag,
            ask: try Decimal(proto: proto.ask),
            askSize: proto.askSize,
            askTime: proto.askTime,
            averageVolume: try Decimal(proto: proto.averageVolume),
            beta: try Decimal(proto: proto.beta),
            bid: try Decimal(proto: proto.bid),
            bidExchange: proto.bidExchange,
            bidSize: proto.bidSize,
            bidTime: proto.bidTime,
            cashDeliverable: try Decimal(proto: proto.cashDeliverable),
            changeClose: try Decimal(proto: proto.changeClose),
            changeClosePercentage: try Decimal(proto: proto.changeClosePercentage),
            companyName: proto.companyName,
            contractSize: try Decimal(proto: proto.contractSize),
            daysToExpiration: proto.daysToExpiration,
            declaredDividend: try Decimal(proto: proto.declaredDividend),
            dirLast: proto.dirLast,
            dividend: try Decimal(proto: proto.dividend),
            dividendPayableDate: Date(proto: proto.dividendPayableDate),
            eps: try Decimal(proto: proto.eps),
            estEarnings: try Decimal(proto: proto.estEarnings),
            exDividendDate: Date(proto: proto.exDividendDate),
            expirationDate: Date(proto: proto.expirationDate),
            high: try Decimal(proto: proto.high),
            high52: try Decimal(proto: proto.high52),
            intrinsicValue: try Decimal(proto: proto.intrinsicValue),
            lastTrade: try Decimal(proto: proto.lastTrade),
            low: try Decimal(proto: proto.low),
            low52: try Decimal(proto: proto.low52),
            marketCap: try Decimal(proto: proto.marketCap),
            nextEarningDate: proto.nextEarningDate,
            open: try Decimal(proto: proto.open),
            openInterest: proto.openInterest,
            optionMultiplier: try Decimal(proto: proto.optionMultiplier),
            optionStyle: proto.optionStyle,
            optionUnderlier: proto.optionUnderlier,
            pe: try Decimal(proto: proto.pe),
            previousClose: try Decimal(proto: proto.previousClose),
            previousDayVolume: proto.previousDayVolume,
            primaryExchange: proto.primaryExchange,
            sharesOutstanding: try Decimal(proto: proto.sharesOutstanding),
            symbolDescription: proto.symbolDescription,
            timeOfLastTrade: Date(proto: proto.timeOfLastTrade),
            timePremium: try Decimal(proto: proto.timePremium),
            totalVolume: try Decimal(proto: proto.totalVolume),
            upc: proto.upc,
            week52HiDate: Date(proto: proto.week52HiDate),
            week52LowDate: Date(proto: proto.week52LowDate),
            yield: try Decimal(proto: proto.yield),
            optionPreviousAskPrice: proto.hasOptionPreviousAskPrice ? try Decimal(proto: proto.optionPreviousAskPrice) : nil,
            optionPreviousBidPrice: proto.hasOptionPreviousBidPrice ? try Decimal(proto: proto.optionPreviousBidPrice) : nil,
            optionUnderlierExchange: proto.hasOptionUnderlierExchange ? proto.optionUnderlierExchange : nil,
            osiKey: proto.hasOsiKey ? proto.osiKey : nil
        )
    }
}

extension QuoteOptionDetail {
    init(proto: Etrade_QuoteOptionDetail) throws {
        self.init(
            ask: try Decimal(proto: proto.ask),
            askSize: proto.askSize,
            bid: try Decimal(proto: proto.bid),
            bidSize: proto.bidSize,
            companyName: proto.companyName,
            contractSize: try Decimal(proto: proto.contractSize),
            daysToExpiration: proto.daysToExpiration,
            intrinsicValue: try Decimal(proto: proto.intrinsicValue),
            lastTrade: try Decimal(proto: proto.lastTrade),
            openInterest: proto.openInterest,
            optionMultiplier: try Decimal(proto: proto.optionMultiplier),
            optionPreviousAskPrice: try Decimal(proto: proto.optionPreviousAskPrice),
            optionPreviousBidPrice: try Decimal(proto: proto.optionPreviousBidPrice),
            osiKey: proto.osiKey,
            symbolDescription: proto.symbolDescription,
            timePremium: try Decimal(proto: proto.timePremium),
            optionGreeks: proto.hasOptionGreeks ? try OptionGreeks(proto: proto.optionGreeks) : nil
        )
    }
}

extension Quote {
    init(proto: Etrade_Quote) throws {
        self.init(
            ahFlag: proto.ahFlag,
            dateTime: Date(proto: proto.dateTime),
            product: try Product(proto: proto.product),
            quoteStatus: proto.quoteStatus,
            all: proto.hasAll ? try QuoteAllDetail(proto: proto.all) : nil,
            hasMiniOptions: proto.hasHasMiniOptions_p ? proto.hasMiniOptions_p : nil,
            option: proto.hasOption ? try QuoteOptionDetail(proto: proto.option) : nil
        )
    }
}

// MARK: - Order

extension Instrument {
    init(proto: Etrade_Instrument) throws {
        self.init(
            product: try Product(proto: proto.product),
            orderAction: proto.orderAction,
            orderedQuantity: try Decimal(proto: proto.orderedQuantity),
            quantityType: proto.quantityType,
            averageExecutionPrice: proto.hasAverageExecutionPrice ? try Decimal(proto: proto.averageExecutionPrice) : nil,
            estimatedCommission: try Decimal(proto: proto.estimatedCommission),
            estimatedFees: try Decimal(proto: proto.estimatedFees),
            filledQuantity: try Decimal(proto: proto.filledQuantity),
            symbolDescription: proto.symbolDescription
        )
    }
}

extension OrderEvent {
    init(proto: Etrade_OrderEvent) throws {
        self.init(
            name: proto.name,
            dateTime: Date(proto: proto.dateTime),
            instruments: try proto.instruments.map { try Instrument(proto: $0) }
        )
    }
}

extension Order {
    init(proto: Etrade_Order) throws {
        self.init(
            orderId: proto.orderID,
            orderType: proto.hasOrderType ? proto.orderType : nil,
            executedTime: Date(proto: proto.executedTime),
            status: proto.status,
            events: try proto.events.map { try OrderEvent(proto: $0) },
            detailsUrl: proto.detailsURL
        )
    }
}

// MARK: - Transaction

extension Brokerage {
    init(proto: Etrade_Brokerage) throws {
        self.init(
            transactionType: proto.transactionType,
            product: proto.hasProduct ? try Product(proto: proto.product) : nil,
            quantity: try Decimal(proto: proto.quantity),
            price: try Decimal(proto: proto.price),
            settlementCurrency: proto.settlementCurrency,
            paymentCurrency: proto.paymentCurrency,
            fee: try Decimal(proto: proto.fee),
            orderNo: proto.hasOrderNo ? proto.orderNo : nil
        )
    }
}

extension Transaction {
    init(proto: Etrade_Transaction) throws {
        self.init(
            id: proto.transactionID,
            accountId: proto.accountID,
            date: Date(proto: proto.transactionDate),
            postDate: proto.hasPostDate ? Date(proto: proto.postDate) : nil,
            amount: try Decimal(proto: proto.amount),
            description: proto.description_p,
            brokerage: try Brokerage(proto: proto.brokerage)
        )
    }
}

// MARK: - Option Chain

extension OptionLeg {
    init(proto: Etrade_Call) throws {
        self.init(
            adjustedFlag: proto.adjustedFlag,
            ask: try Decimal(proto: proto.ask),
            askSize: proto.askSize,
            bid: try Decimal(proto: proto.bid),
            bidSize: proto.bidSize,
            displaySymbol: proto.displaySymbol,
            inTheMoney: proto.inTheMoney,
            lastPrice: try Decimal(proto: proto.lastPrice),
            netChange: try Decimal(proto: proto.netChange),
            openInterest: proto.openInterest,
            optionCategory: proto.optionCategory,
            optionGreeks: try OptionGreeks(proto: proto.optionGreeks),
            optionRootSymbol: proto.optionRootSymbol,
            optionType: proto.optionType,
            osiKey: proto.osiKey,
            quoteDetail: proto.quoteDetail,
            strikePrice: try Decimal(proto: proto.strikePrice),
            symbol: proto.symbol,
            timeStamp: Date(proto: proto.timeStamp),
            volume: proto.volume
        )
    }

    init(proto: Etrade_Put) throws {
        self.init(
            adjustedFlag: proto.adjustedFlag,
            ask: try Decimal(proto: proto.ask),
            askSize: proto.askSize,
            bid: try Decimal(proto: proto.bid),
            bidSize: proto.bidSize,
            displaySymbol: proto.displaySymbol,
            inTheMoney: proto.inTheMoney,
            lastPrice: try Decimal(proto: proto.lastPrice),
            netChange: try Decimal(proto: proto.netChange),
            openInterest: proto.openInterest,
            optionCategory: proto.optionCategory,
            optionGreeks: try OptionGreeks(proto: proto.optionGreeks),
            optionRootSymbol: proto.optionRootSymbol,
            optionType: proto.optionType,
            osiKey: proto.osiKey,
            quoteDetail: proto.quoteDetail,
            strikePrice: try Decimal(proto: proto.strikePrice),
            symbol: proto.symbol,
            timeStamp: Date(proto: proto.timeStamp),
            volume: proto.volume
        )
    }
}

extension OptionPair {
    init(proto: Etrade_OptionPair) throws {
        self.init(
            call: try OptionLeg(proto: proto.call),
            put: try OptionLeg(proto: proto.put)
        )
    }
}

extension SelectedEd {
    init(proto: Etrade_SelectedEd) {
        self.init(
            day: proto.day,
            month: proto.month,
            year: proto.year
        )
    }
}

extension ExpirationDate {
    init(proto: Etrade_ExpirationDate) {
        self.init(
            day: proto.day,
            expiryType: proto.expiryType,
            month: proto.month,
            year: proto.year
        )
    }
}

extension OptionChains {
    init(proto: Etrade_GetOptionChainsResponse) throws {
        self.init(
            nearPrice: try Decimal(proto: proto.nearPrice),
            optionPairs: try proto.optionPair.map { try OptionPair(proto: $0) },
            quoteType: proto.quoteType,
            selectedEd: SelectedEd(proto: proto.selectedEd),
            timeStamp: Date(proto: proto.timeStamp)
        )
    }
}
