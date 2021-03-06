import FluentMySQL
import MySQL
import Vapor

final class ScheduleEntry: Codable {
     enum EntryType: String, Codable, ReflectionDecodable {
        case talk
        case other

        static func reflectDecoded() throws -> (ScheduleEntry.EntryType, ScheduleEntry.EntryType) {
            return (.talk, .other)
        }
    }

    var id: Int?
    var dayID: Int
    var roomID: Int?
    var talkID: Int?

    var title: String?
    var startTime: Date
    var endTime: Date
    var entryType: EntryType
    var enabled: Bool

    var createdAt: Date?
    var updatedAt: Date?
    var deletedAt: Date?

    init(
        id: Int? = nil,
        dayID: Int,
        roomID: Int,
        talkID: Int?,
        title: String?,
        startTime: Date,
        endTime: Date,
        entryType: EntryType,
        enabled: Bool
    ) {
        self.id = id
        self.dayID = dayID
        self.roomID = roomID
        self.talkID = talkID
        self.title = title
        self.startTime = startTime
        self.endTime = endTime
        self.entryType = entryType
        self.enabled = enabled
    }
}

extension ScheduleEntry: MySQLModel {
    static let createdAtKey: TimestampKey? = \.createdAt
    static let updatedAtKey: TimestampKey? = \.updatedAt
    static let deletedAtKey: TimestampKey? = \.deletedAt
}

extension ScheduleEntry: Content {}
extension ScheduleEntry: Migration {
    static func prepare(on connection: MySQLConnection) -> Future<Void> {
        return MySQLDatabase.create(self, on: connection) { builder in
            try addProperties(to: builder, excluding: [
                ScheduleEntry.reflectProperty(forKey: \.entryType)
            ])

            builder.field(
                for: \.entryType,
                type: MySQLDataType.enum([
                    EntryType.talk.rawValue,
                    EntryType.other.rawValue
                ])
            )

            builder.reference(from: \.roomID, to: \Room.id)
            builder.reference(from: \.talkID, to: \Talk.id)
            builder.reference(from: \.dayID, to: \Day.id)
        }
    }
}
extension ScheduleEntry: Parameter {}

// MARK: Migrations

extension ScheduleEntry {
    struct MakeRoomIDOptional: Migration {
        typealias Database = MySQLDatabase

        static func prepare(on conn: MySQLConnection) -> EventLoopFuture<Void> {
            return conn.raw("ALTER TABLE \(ScheduleEntry.entity) MODIFY roomID BIGINT(20) NULL;").run()
        }

        static func revert(on conn: MySQLConnection) -> EventLoopFuture<Void> {
            return conn.raw("ALTER TABLE \(ScheduleEntry.entity) MODIFY roomID BIGINT(20);").run()
        }
    }
}
