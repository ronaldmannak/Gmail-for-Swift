//
//  GmailWrapper.swift
//  Smail
//
//  Created by Praneet S on 12/04/21.
//

import Foundation
import OpenCombineShim

final public class Gmail {

    private static var bearerToken: String = ""
    private static var defaultHeadersWithAuth = ["Authorization" : "Bearer \(Gmail.bearerToken)"]

    public static func setAuth(bearerToken: String) {
        Gmail.bearerToken = bearerToken
    }

    public class Users {
        
        // MARK: - Async
        
        public static func getProfile(userID: String) async throws -> Data {
            return try await API.executeRequest(APIRequest: API.user.getProfile(userID: userID).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: Data.self)
        }

        public static func stop(userID: String) async throws -> Data {
            return try await API.executeRequest(APIRequest: API.user.stop(userID: userID).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: Data.self)
        }

        public static func watch(userID: String, requestBody: [String : Any]) async throws -> Data {
            return try await API.executeRequest(APIRequest: API.user.watch(userID: userID).request, headers: defaultHeadersWithAuth, requestBody: requestBody, decodingType: Data.self)
        }
        
        // MARK: - Combine

        public static func getProfile(userID: String) -> AnyPublisher<Data, Error> {
            return API.executeRequest(APIRequest: API.user.getProfile(userID: userID).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: Data.self)
        }

        public static func stop(userID: String) -> AnyPublisher<Data, Error> {
            return API.executeRequest(APIRequest: API.user.stop(userID: userID).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: Data.self)
        }

        public static func watch(userID: String, requestBody: [String : Any]) -> AnyPublisher<Data, Error> {
            return API.executeRequest(APIRequest: API.user.watch(userID: userID).request, headers: defaultHeadersWithAuth, requestBody: requestBody, decodingType: Data.self)
        }

    }

    public class UsersDrafts {
        
        // MARK: - Async

        public static func create(userID: String, type: API.resourceContentType, draft: [String : Any]) async throws -> Data {
            return try await API.executeRequest(APIRequest: API.usersDrafts.create(userId: userID, type: type).request, headers: defaultHeadersWithAuth, requestBody: draft, decodingType: Data.self)
        }

        public static func delete(userID: String, id: String) async throws -> Data {
            return try await API.executeRequest(APIRequest: API.usersDrafts.delete(userId: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: Data.self)
        }

        public static func get(userID: String, id: String) async throws -> Data {
            return try await API.executeRequest(APIRequest: API.usersDrafts.get(userId: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: Data.self)
        }

        public static func list(userID: String) async throws -> DraftList {
            return try await API.executeRequest(APIRequest: API.usersDrafts.list(userId: userID).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: DraftList.self)
        }

        public static func send(userID: String, headers: [String : String], draft: [String : Any], type: API.resourceContentType) async throws -> Data {
            var headersWithAuth = headers
            headersWithAuth["Authorization"] = "Bearer \(Gmail.bearerToken)"
            return try await API.executeRequest(APIRequest: API.usersDrafts.send(userId: userID, type: type).request, headers: headersWithAuth, requestBody: draft, decodingType: Data.self)
        }

        public static func update(userID: String, draft: [String : Any], id: String, type: API.resourceContentType) async throws -> Data {
            return try await API.executeRequest(APIRequest: API.usersDrafts.update(userId: userID, id: id, type: type).request, headers: defaultHeadersWithAuth, requestBody: draft, decodingType: Data.self)
        }
        
        // MARK: - Combine

        public static func create(userID: String, type: API.resourceContentType, draft: [String : Any]) -> AnyPublisher<Data, Error> {
            return API.executeRequest(APIRequest: API.usersDrafts.create(userId: userID, type: type).request, headers: defaultHeadersWithAuth, requestBody: draft, decodingType: Data.self)
        }

        public static func delete(userID: String, id: String) -> AnyPublisher<Data, Error> {
            return API.executeRequest(APIRequest: API.usersDrafts.delete(userId: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: Data.self)
        }

        public static func get(userID: String, id: String) -> AnyPublisher<Data, Error> {
            return API.executeRequest(APIRequest: API.usersDrafts.get(userId: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: Data.self)
        }

        public static func list(userID: String) -> AnyPublisher<DraftList, Error> {
            return API.executeRequest(APIRequest: API.usersDrafts.list(userId: userID).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: DraftList.self)
        }

        public static func send(userID: String, headers: [String : String], draft: [String : Any], type: API.resourceContentType) -> AnyPublisher<Data, Error> {
            var headersWithAuth = headers
            headersWithAuth["Authorization"] = "Bearer \(Gmail.bearerToken)"
            return API.executeRequest(APIRequest: API.usersDrafts.send(userId: userID, type: type).request, headers: headersWithAuth, requestBody: draft, decodingType: Data.self)
        }

        public static func update(userID: String, draft: [String : Any], id: String, type: API.resourceContentType) -> AnyPublisher<Data, Error> {
            return API.executeRequest(APIRequest: API.usersDrafts.update(userId: userID, id: id, type: type).request, headers: defaultHeadersWithAuth, requestBody: draft, decodingType: Data.self)
        }

    }

    public class UsersHistory {

        // MARK: - Async
        
        public static func list(userID: String, startHistoryId: String) async throws -> Data {
            return try await API.executeRequest(APIRequest: API.usersHistory.list(userID: userID, startHistoryId: startHistoryId).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: Data.self)
        }
            
        // MARK: - Combine
        
        public static func list(userID: String, startHistoryId: String) -> AnyPublisher<Data, Error> {
            return API.executeRequest(APIRequest: API.usersHistory.list(userID: userID, startHistoryId: startHistoryId).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: Data.self)
        }

    }

    public class UsersLabels {

        // MARK: - Async
        
        public static func create(userID: String, requestBody: Label) async throws -> Label {
            return try await API.executeRequest(APIRequest: API.usersLabels.create(userId: userID).request, headers: defaultHeadersWithAuth, requestBody: requestBody.dictionary, decodingType: Label.self)
        }

        public static func delete(userID: String, id: String) async throws -> Data {
            return try await API.executeRequest(APIRequest: API.usersLabels.delete(userId: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: Data.self)
        }

        public static func get(userID: String, id: String) async throws -> Label {
            return try await API.executeRequest(APIRequest: API.usersLabels.get(userId: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: Label.self)
        }

        public static func list(userID: String) async throws -> LabelList {
            return try await API.executeRequest(APIRequest: API.usersLabels.list(userId: userID).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: LabelList.self)
        }

        public static func patch(userID: String, id: String, requestBody: Label) async throws -> Label {
            return try await API.executeRequest(APIRequest: API.usersLabels.patch(userId: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: requestBody.dictionary, decodingType: Label.self)
        }

        public static func update(userID: String, id: String, requestBody: Label) async throws -> Label {
            return try await API.executeRequest(APIRequest: API.usersLabels.update(userId: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: requestBody.dictionary, decodingType: Label.self)
        }
        
        // MARK: - Combine
        
        public static func create(userID: String, requestBody: Label) -> AnyPublisher<Label, Error> {
            return API.executeRequest(APIRequest: API.usersLabels.create(userId: userID).request, headers: defaultHeadersWithAuth, requestBody: requestBody.dictionary, decodingType: Label.self)
        }

        public static func delete(userID: String, id: String) -> AnyPublisher<Data, Error> {
            return API.executeRequest(APIRequest: API.usersLabels.delete(userId: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: Data.self)
        }

        public static func get(userID: String, id: String) -> AnyPublisher<Label, Error> {
            return API.executeRequest(APIRequest: API.usersLabels.get(userId: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: Label.self)
        }

        public static func list(userID: String) -> AnyPublisher<LabelList, Error> {
            return API.executeRequest(APIRequest: API.usersLabels.list(userId: userID).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: LabelList.self)
        }

        public static func patch(userID: String, id: String, requestBody: Label) -> AnyPublisher<Label, Error> {
            return API.executeRequest(APIRequest: API.usersLabels.patch(userId: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: requestBody.dictionary, decodingType: Label.self)
        }

        public static func update(userID: String, id: String, requestBody: Label) -> AnyPublisher<Label, Error> {
            return API.executeRequest(APIRequest: API.usersLabels.update(userId: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: requestBody.dictionary, decodingType: Label.self)
        }

    }

    public class UsersMessages {

        // MARK: - Async
        
        public static func batchDelete(userID: String, ids: [String]) async throws -> Data {
            return try await API.executeRequest(APIRequest: API.usersMessages.batchDelete(userID: userID).request, headers: defaultHeadersWithAuth, requestBody: ["ids":ids], decodingType: Data.self)
        }

        public static func batchModify(userID: String, requestBody: UserMessagesBatchModifyBody) async throws -> Data {
            return try await API.executeRequest(APIRequest: API.usersMessages.batchModify(userID: userID).request, headers: defaultHeadersWithAuth, requestBody: requestBody.dictionary, decodingType: Data.self)
        }

        public static func delete(userID: String, id: String) async throws -> Data {
            return try await API.executeRequest(APIRequest: API.usersMessages.delete(userID: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: Data.self)
        }

        public static func importMessage(userID: String, type: API.resourceContentType, message: Message) async throws -> Message {
            return try await API.executeRequest(APIRequest: API.usersMessages.importMessages(userID: userID, importType: type).request, headers: defaultHeadersWithAuth, requestBody: message.dictionary, decodingType: Message.self)
        }

        public static func insert(userID: String, type: API.resourceContentType, message: Message) async throws -> Message {
            return try await API.executeRequest(APIRequest: API.usersMessages.insert(userID: userID, importType: type).request, headers: defaultHeadersWithAuth, requestBody: message.dictionary, decodingType: Message.self)
        }

        public static func modify(userID: String, id: String, modifiedMessageBody: ModifiedMessageBody) async throws -> Message {
            return try await API.executeRequest(APIRequest: API.usersMessages.modify(userID: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: modifiedMessageBody.dictionary, decodingType: Message.self)
        }

        public static func send(userID: String, type: API.resourceContentType, message: Message) async throws -> Message {
            return try await API.executeRequest(APIRequest: API.usersMessages.send(userID: userID, importType: type).request, headers: defaultHeadersWithAuth, requestBody: message.dictionary, decodingType: Message.self)
        }

        public static func trash(userID: String, id: String) async throws -> Message {
            return try await API.executeRequest(APIRequest: API.usersMessages.trash(userID: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: Message.self)
        }

        public static func untrash(userID: String, id: String) async throws -> Message {
            return try await API.executeRequest(APIRequest: API.usersMessages.untrash(userID: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: Message.self)
        }

        public static func list(userID: String) async throws -> MessagesList {
            return try await API.executeRequest(APIRequest: API.usersMessages.list(userID: userID).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: MessagesList.self)
        }

        public static func get(userID: String, id: String) async throws -> Message {
            return try await API.executeRequest(APIRequest: API.usersMessages.get(userID: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: Message.self)
        }
        
        // MARK: - Combine
        
        public static func batchDelete(userID: String, ids: [String]) -> AnyPublisher<Data, Error> {
            return (API.executeRequest(APIRequest: API.usersMessages.batchDelete(userID: userID).request, headers: defaultHeadersWithAuth, requestBody: ["ids":ids], decodingType: Data.self))
        }

        public static func batchModify(userID: String, requestBody: UserMessagesBatchModifyBody) -> AnyPublisher<Data, Error> {
            return (API.executeRequest(APIRequest: API.usersMessages.batchModify(userID: userID).request, headers: defaultHeadersWithAuth, requestBody: requestBody.dictionary, decodingType: Data.self))
        }

        public static func delete(userID: String, id: String) -> AnyPublisher<Data, Error> {
            return (API.executeRequest(APIRequest: API.usersMessages.delete(userID: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: Data.self))
        }

        public static func importMessage(userID: String, type: API.resourceContentType, message: Message) -> AnyPublisher<Message, Error> {
            return API.executeRequest(APIRequest: API.usersMessages.importMessages(userID: userID, importType: type).request, headers: defaultHeadersWithAuth, requestBody: message.dictionary, decodingType: Message.self)
        }

        public static func insert(userID: String, type: API.resourceContentType, message: Message) -> AnyPublisher<Message, Error> {
            return API.executeRequest(APIRequest: API.usersMessages.insert(userID: userID, importType: type).request, headers: defaultHeadersWithAuth, requestBody: message.dictionary, decodingType: Message.self)
        }

        public static func modify(userID: String, id: String, modifiedMessageBody: ModifiedMessageBody) -> AnyPublisher<Message, Error> {
            return API.executeRequest(APIRequest: API.usersMessages.modify(userID: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: modifiedMessageBody.dictionary, decodingType: Message.self)
        }

        public static func send(userID: String, type: API.resourceContentType, message: Message) -> AnyPublisher<Message, Error> {
            return API.executeRequest(APIRequest: API.usersMessages.send(userID: userID, importType: type).request, headers: defaultHeadersWithAuth, requestBody: message.dictionary, decodingType: Message.self)
        }

        public static func trash(userID: String, id: String) -> AnyPublisher<Message, Error> {
            return API.executeRequest(APIRequest: API.usersMessages.trash(userID: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: Message.self)
        }

        public static func untrash(userID: String, id: String) -> AnyPublisher<Message, Error> {
            return API.executeRequest(APIRequest: API.usersMessages.untrash(userID: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: Message.self)
        }

        public static func list(userID: String) -> AnyPublisher<MessagesList, Error> {
            return API.executeRequest(APIRequest: API.usersMessages.list(userID: userID).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: MessagesList.self)
        }

        public static func get(userID: String, id: String) -> AnyPublisher<Message, Error> {
            return API.executeRequest(APIRequest: API.usersMessages.get(userID: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: Message.self)
        }

    }

    public class UsersThreads {

        // MARK: - Async
        
        public static func get(userID: String, id: String) async throws -> MailThread {
            return try await API.executeRequest(APIRequest: API.usersThreads.get(userID: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: MailThread.self)
        }
        
        public static func list(userID: String, maxResults: Int?, pageToken: String?, query: String?, labelIDs: String?, includeSpamTrash: Bool = false) async throws -> ThreadList {
            return try await API.executeRequest(APIRequest: API.usersThreads.list(userID: userID, maxResults: maxResults, pageToken: pageToken, query: query, labelIDs: labelIDs, includeSpamTrash: includeSpamTrash).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: ThreadList.self)
        }
        
        public static func trash(userID: String, id: String) async throws -> MailThread {
            return try await API.executeRequest(APIRequest: API.usersThreads.trash(userID: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: MailThread.self)
        }

        public static func untrash(userID: String, id: String) async throws -> MailThread {
            return try await API.executeRequest(APIRequest: API.usersThreads.untrash(userID: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: MailThread.self)
        }

        public static func delete(userID: String, id: String) async throws-> Data {
            return try await API.executeRequest(APIRequest: API.usersThreads.delete(userID: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: Data.self)
        }

        public static func modify(userID: String, id: String, requestBody: ThreadModifyBody) async throws -> MailThread {
            return try await API.executeRequest(APIRequest: API.usersThreads.untrash(userID: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: requestBody.dictionary, decodingType: MailThread.self)
        }

        // MARK: - Combine
        
        public static func get(userID: String, id: String) -> AnyPublisher<MailThread, Error> {
            return API.executeRequest(APIRequest: API.usersThreads.get(userID: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: MailThread.self)
        }

        public static func list(userID: String, maxResults: Int?, pageToken: String?, query: String?, labelIDs: String?, includeSpamTrash: Bool = false) -> AnyPublisher<ThreadList, Error> {
            return API.executeRequest(APIRequest: API.usersThreads.list(userID: userID, maxResults: maxResults, pageToken: pageToken, query: query, labelIDs: labelIDs, includeSpamTrash: includeSpamTrash).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: ThreadList.self)
        }

        public static func trash(userID: String, id: String) -> AnyPublisher<MailThread, Error> {
            return API.executeRequest(APIRequest: API.usersThreads.trash(userID: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: MailThread.self)
        }

        public static func untrash(userID: String, id: String) -> AnyPublisher<MailThread, Error> {
            return API.executeRequest(APIRequest: API.usersThreads.untrash(userID: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: MailThread.self)
        }

        public static func delete(userID: String, id: String) -> AnyPublisher<Data, Error> {
            return API.executeRequest(APIRequest: API.usersThreads.delete(userID: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: Data.self)
        }

        public static func modify(userID: String, id: String, requestBody: ThreadModifyBody) -> AnyPublisher<MailThread, Error> {
            return API.executeRequest(APIRequest: API.usersThreads.untrash(userID: userID, id: id).request, headers: defaultHeadersWithAuth, requestBody: requestBody.dictionary, decodingType: MailThread.self)
        }

    }

    public class UsersSettings {
        
        // MARK: Async
        
        public static func getAutoForwarding(userID: String, id: String) async throws -> AutoForwarding {
            return try await API.executeRequest(APIRequest: API.usersSettings.getAutoForwarding(userID: userID).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: AutoForwarding.self)
        }

        public static func getImap(userID: String) async throws -> ImapSettings {
            return try await API.executeRequest(APIRequest: API.usersSettings.getImap(userID: userID).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: ImapSettings.self)
        }

        public static func getLanguage(userID: String) async throws -> LanguageSettings {
            return try await API.executeRequest(APIRequest: API.usersSettings.getLanguage(userID: userID).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: LanguageSettings.self)
        }

        public static func getPop(userID: String) async throws -> PopSettings {
            return try await API.executeRequest(APIRequest: API.usersSettings.getPop(userID: userID).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: PopSettings.self)
        }
        
        // MARK: Combine

        public static func getAutoForwarding(userID: String, id: String) -> AnyPublisher<AutoForwarding, Error> {
            return API.executeRequest(APIRequest: API.usersSettings.getAutoForwarding(userID: userID).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: AutoForwarding.self)
        }

        public static func getImap(userID: String) -> AnyPublisher<ImapSettings, Error> {
            return API.executeRequest(APIRequest: API.usersSettings.getImap(userID: userID).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: ImapSettings.self)
        }

        public static func getLanguage(userID: String) -> AnyPublisher<LanguageSettings, Error> {
            return API.executeRequest(APIRequest: API.usersSettings.getLanguage(userID: userID).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: LanguageSettings.self)
        }

        public static func getPop(userID: String) -> AnyPublisher<PopSettings, Error> {
            return API.executeRequest(APIRequest: API.usersSettings.getPop(userID: userID).request, headers: defaultHeadersWithAuth, requestBody: nil, decodingType: PopSettings.self)
        }

    }
}