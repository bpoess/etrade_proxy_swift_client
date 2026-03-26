import Foundation

public struct Account: Sendable {
    public let accountId: String
    public let accountIdKey: String
    public let accountName: String
    public let accountType: String
    public let institutionType: String
    public let accountStatus: String
    public let closedDate: Date?
    public let accountMode: String
    public let accountDesc: String?
    public let instNo: Int32?
    public let shareWorksAccount: Bool
    public let shareWorksSource: String?
    public let fcManagedMssbClosedAccount: Bool
}
