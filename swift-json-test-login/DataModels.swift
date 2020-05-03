public struct User: Codable {
    public var id: Int
    public var name: String?
    public var tel: String?
}

public struct DataPocket: Codable {
    public var total: Int
    public var datas: [User]
    public var result: Bool
}