import Foundation

@MainActor
final public class Mail : ObservableObject {

    private var mailID: String

    private var refreshInterval: Int

    @Published public var userMessages: MessagesList?
    
    /// Stores the last fetch. Will be overwritten with each fetchUserThreads invocation
    @Published public var userThreads: ThreadList?
    @Published public var userLabels: LabelList?
    @Published public var userDrafts: DraftList?
    
    public init(authToken: String, mailID: String, refreshInterval: Int = -1) {
        Gmail.setAuth(bearerToken: authToken)
        self.mailID = mailID
        self.refreshInterval = refreshInterval
    }
    
    @discardableResult
    @MainActor
    public func draftCompose(draft: Draft, type: API.resourceContentType) async throws -> Draft {
        let data = try await Gmail.UsersDrafts.create(userID: "me", type: type, draft: draft.dictionary ?? ["message":["raw":""]])
        let draft = try JSONDecoder().decode(Draft.self, from: data)
        return draft
    }

    @discardableResult
    @MainActor
    public func fetchUserThreads(maxResults: Int? = nil, pageToken: String? = nil, query: String? = nil, labelIDs: String? = nil, includeSpamTrash: Bool = false) async throws -> ([MailThread]?, String?) {
        let userThreads = try await Gmail.UsersThreads.list(userID: "me", maxResults: maxResults, pageToken: pageToken, query: query, labelIDs: labelIDs, includeSpamTrash: includeSpamTrash)
        self.userThreads = userThreads
        return (userThreads.threads, userThreads.nextPageToken)
    }

    @discardableResult
    @MainActor
    public func fetchUserLabels() async throws -> [GmailLabel]? {
        let labels = try await Gmail.UsersLabels.list(userID: "me")
        self.userLabels = labels
        return labels.labels
    }

    @discardableResult
    @MainActor
    public func fetchUserDrafts() async throws -> [Draft]? {
        let drafts = try await Gmail.UsersDrafts.list(userID: "me")
        self.userDrafts = drafts
        return drafts.drafts
    }

    public func fetchUserMessages() async throws -> [MessageListInstance]? {
        let messages = try await Gmail.UsersMessages.list(userID: "me")
        self.userMessages = messages
        return messages.messages
    }

}
