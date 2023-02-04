//
//  Labels.swift
//  gmail-client
//
//  Created by Praneet S on 09/04/21.
//

import Foundation

public struct Color : Codable {
    public let textColor: String?
    public let backgroundColor: String?
}

public struct Label : Codable, Identifiable {
      public let id: String
      public let name: String?
      public let messageListVisibility: MessageListVisibility?
      public let labelListVisibility: LabelListVisibility?
      public let type: Type_?
      public let messagesTotal: Int?
      public let messagesUnread: Int?
      public let threadsTotal: Int?
      public let threadsUnread: Int?
      public let color: Color?
    
    public enum MessageListVisibility : String, Codable {
        case show
        case hide
    }
    
    public enum LabelListVisibility : String, Codable {
        case labelShow
        case labelShowIfUnread
        case labelHide
    }
    
    public enum Type_ : String, Codable {
        case system
        case user
    }
}

extension Label: Equatable {
    public static func == (lhs: Label, rhs: Label) -> Bool {
        return lhs.id == rhs.id
    }
}

public struct LabelList : Codable {
    public let labels: [Label]?
}

