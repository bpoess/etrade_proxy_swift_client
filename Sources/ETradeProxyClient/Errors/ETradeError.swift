import GRPCCore

public enum ETradeError: Error, Sendable {
    case rpcFailed(code: Code, message: String)
    case invalidDecimalValue(String)
    case clientClosed

    public enum Code: Sendable {
        case unauthenticated
        case permissionDenied
        case notFound
        case invalidArgument
        case unavailable
        case deadlineExceeded
        case resourceExhausted
        case `internal`
        case unknown
    }
}

extension ETradeError {
    init(rpcError: RPCError) {
        let code: Code = switch rpcError.code {
        case .unauthenticated: .unauthenticated
        case .permissionDenied: .permissionDenied
        case .notFound: .notFound
        case .invalidArgument: .invalidArgument
        case .unavailable: .unavailable
        case .deadlineExceeded: .deadlineExceeded
        case .resourceExhausted: .resourceExhausted
        case .internalError: .internal
        default: .unknown
        }
        self = .rpcFailed(code: code, message: rpcError.message)
    }

    init(from error: any Error) {
        if let rpcError = error as? RPCError {
            self = ETradeError(rpcError: rpcError)
        } else {
            self = .rpcFailed(code: .unknown, message: error.localizedDescription)
        }
    }
}
