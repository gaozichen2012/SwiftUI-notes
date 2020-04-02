public struct User: Codable {
    public var id: Int
    public var name: String?
    public var username: String?
    public var email: String?
    public var phone: String?
    public var website: String?
    public var address: Address?
    public var company: Company?
}

public struct Address: Codable {
    public var street: String?
    public var suite: String?
    public var city: String?
    public var zipcode: String?
    public var coordinates: Coordinates?
    
    enum CodingKeys: String, CodingKey {
        case coordinates = "geo"
        
        case street
        case suite
        case city
        case zipcode
    }
}

public struct Coordinates: Codable {
    public var latitude: String?
    public var longitude: String?
    
    enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lng"
    }
}

public struct Company: Codable {
    public var name: String?
    public var catchPhrase: String?
}
