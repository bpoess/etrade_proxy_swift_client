import Foundation

public struct Account: Sendable, Codable {
    public let id: String
    public let idKey: String
    public let name: String
    public let type: String
    public let institutionType: String
    public let status: String
    public let closedDate: Date?
    public let mode: String
    public let desc: String?
    public let instNo: Int32?
    public let shareWorksAccount: Bool
    public let shareWorksSource: String?
    public let fcManagedMssbClosedAccount: Bool
}
