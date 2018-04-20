import Vapor
import FluentSQLite

final class Acronym: Codable {
    var id: Int?
    var short: String
    var long: String

    init(short: String, long: String) {
        self.short = short
        self.long = long
    }
}

extension Acronym: Model {
    // Fluentに使用するDBを伝える
    typealias Database = SQLiteDatabase
    // IDの型を指定
    typealias ID = Int
    // IDとして扱うプロパティを指定
    public static var idKey: IDKey = \Acronym.id
}
// ↓のようなヘルパープロトコルがあるので、通常はこっちを使う
// id型がint, uuid, stringの場合に対応しているので、それ以外のときは↑のようなかんじで
extension Acronym: SQLiteModel {}

// migration
extension Acronym: Migration { }

// Codable wrapper
extension Acronym: Content { }

