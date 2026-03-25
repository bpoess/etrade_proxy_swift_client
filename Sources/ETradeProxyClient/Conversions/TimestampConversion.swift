import Foundation
import SwiftProtobuf

extension Date {
    init(proto: Google_Protobuf_Timestamp) {
        self = proto.date
    }
}
