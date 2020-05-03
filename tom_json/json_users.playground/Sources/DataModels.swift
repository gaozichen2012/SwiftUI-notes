struct User: Decodable, Identifiable {
    public var id: String
    public var name: String
    public var psd: String
    public var tel: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case psd = "password"
        case tel = "phone"
    }
}
