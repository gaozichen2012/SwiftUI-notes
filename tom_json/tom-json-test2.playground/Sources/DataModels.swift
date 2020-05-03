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
   public var geo: Geo?
}
public struct Geo: Codable {
   public var lat: String?
   public var lng: String?
}
public struct Company: Codable {
   public var name: String?
   public var catchPhrase: String?
   public var bs: String?
}
