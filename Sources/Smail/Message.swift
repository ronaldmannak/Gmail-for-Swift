//
//  Message.swift
//  gmail-client
//
//  Created by Praneet S on 09/04/21.
//

import Foundation

public struct Header : Codable {
    public let name: String?
    public let value: String?
}

public struct MessagePartBody : Codable {
    public let attachmentId: String?
    public let size: Int?
    public let data: String?
}

public struct MessagePart : Codable {
    public let partId: String?
    public let mimeType: String?
    public let filename: String?
    public let headers: [Header]?
    public let body: MessagePartBody?
    public let parts: [MessagePart]?
}

public struct Message : Codable {
    public let id: String?
    public let threadId: String?
    public let labelIds: [String]?
    public let snippet: String?
    public let historyId: String?
    public let internalDate: String?
    public let payload: MessagePart?
    public let sizeEstimate: Int?
    public let raw: String?
}

public struct MessagesList : Codable {
  public let messages: [MessageListInstance]?
  public let nextPageToken: String?
  public let resultSizeEstimate: Int?
}

public struct MessageListInstance : Codable {
    public let id: String?
    public let threadId: String?
}

public struct UserMessagesBatchModifyBody : Codable {
      public let ids: [String]?
      public let addLabelIds: [String]?
      public let removeLabelIds: [String]?
}

public struct ModifiedMessageBody : Codable {
      public let addLabelIds: [String]?
      public let removeLabelIds: [String]?
}
