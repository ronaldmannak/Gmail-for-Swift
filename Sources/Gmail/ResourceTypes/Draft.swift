//
//  Draft.swift
//  gmail-client
//
//  Created by Praneet S on 09/04/21.
//

import Foundation

public struct Draft : Codable, Identifiable {
    public let id: String
    public let message: Message?
    public init(id: String, message: Message) {
        self.id = id
        self.message = message
    }
}

extension Draft: Equatable {
    public static func == (lhs: Draft, rhs: Draft) -> Bool {
        return lhs.id == rhs.id
    }
}

public struct DraftList : Codable {
    public let drafts: [Draft]?
    public let nextPageToken: String?
    public let resultSizeEstimate: Int?
  }
