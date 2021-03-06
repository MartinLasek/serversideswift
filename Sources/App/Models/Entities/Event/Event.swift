import FluentMySQL
import Vapor

final class Event: Codable {
    var id: Int?

    var slug: String
    var title: String
    var order: Int
    var primary: Bool
    var enabled: Bool

    var createdAt: Date?
    var updatedAt: Date?
    var deletedAt: Date?

    init(
        id: Int? = nil,
        slug: String,
        title: String,
        order: Int,
        primary: Bool,
        enabled: Bool
    ) {
        self.id = id
        self.slug = slug
        self.title = title
        self.order = order
        self.primary = primary
        self.enabled = enabled
    }
}

extension Event: MySQLModel {
    static let createdAtKey: TimestampKey? = \.createdAt
    static let updatedAtKey: TimestampKey? = \.updatedAt
    static let deletedAtKey: TimestampKey? = \.deletedAt
}

extension Event: Content {}
extension Event: Migration {
    static func prepare(on connection: MySQLConnection) -> Future<Void> {
        return MySQLDatabase.create(self, on: connection) { builder in
            try addProperties(to: builder)
        }
    }
}
extension Event: Parameter {}

extension Event {
    var days: Children<Event, Day> {
        return children(\.eventID)
    }
}
