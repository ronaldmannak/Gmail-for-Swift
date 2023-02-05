//
//  Error.swift
//  
//
//  Created by Ronald Mannak on 2/5/23.
//

import Foundation

public enum GmailError: Error {
    case internalError
    case gmailError(GmailErrorMessage)
}

extension GmailError: LocalizedError {
    
    public var localizedDescription: String {
        switch self {
        case .internalError:
            return "Internal error"
        case .gmailError(let msg):
            return "\(msg.code):  \(msg.message)"
        }
    }
    
    public var errorDescription: String? { return localizedDescription }
}

// MARK: - Gmail Error wrapper

struct GmailErrorWrapper: Error, Codable {
    /// The error object itself.
    let error: GmailErrorMessage
}

public struct GmailErrorMessage: Error, Codable {
    /// The message associated with the error.
    public let message: String

    /// HTTP status code associated with the error
    public let code: Int

    /// E.g. PERMISSION_DENIED
    public let status: String
}
