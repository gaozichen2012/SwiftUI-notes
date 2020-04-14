import Foundation

public struct JSONConverter {
    public static func decode<T: Decodable>(_ data: Data) throws -> [T]? {
        do {
            let decoded = try JSONDecoder().decode([T].self, from: data)
            return decoded
        } catch {
            throw error
        }
    }
    
    public static func encode<T: Encodable>(_ value: T) throws -> Data? {
        do {
            let data = try JSONEncoder().encode(value)
            return data
        } catch {
            throw error
        }
    }
}
