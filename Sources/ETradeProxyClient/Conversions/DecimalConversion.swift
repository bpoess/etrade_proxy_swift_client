import Foundation

extension Decimal {
    init(proto: Google_Type_Decimal) throws {
        guard let decimal = Decimal(string: proto.value) else {
            throw ETradeError.invalidDecimalValue(proto.value)
        }
        self = decimal
    }
}

extension Google_Type_Decimal {
    init(_ decimal: Decimal) {
        self.init()
        self.value = "\(decimal)"
    }
}
