import AdminPanel
import FluentMySQL
import Vapor

func migrate(migrations: inout MigrationConfig) throws {
    // MARK: Preparations
    migrations.add(model: AdminPanelUser.self, database: .mysql)
    migrations.add(model: Event.self, database: .mysql)
    migrations.add(model: Day.self, database: .mysql)
    migrations.add(model: Room.self, database: .mysql)
    migrations.add(model: Talk.self, database: .mysql)
    migrations.add(model: ScheduleEntry.self, database: .mysql)
    migrations.add(model: Speaker.self, database: .mysql)
    migrations.add(model: TalkSpeaker.self, database: .mysql)

    // MARK: Migrations
     migrations.add(migration: ScheduleEntry.MakeRoomIDOptional.self, database: .mysql)
}
