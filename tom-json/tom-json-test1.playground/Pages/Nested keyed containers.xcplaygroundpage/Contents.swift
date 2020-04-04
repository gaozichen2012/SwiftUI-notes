//此playground介绍如何兼容编解码复杂化的数据
//我们预先定义了一个模型Employee，Employee是一个嵌套结构。如果传入一个二级嵌套结构的JSON数据给Employee，该如何兼容接收
import Foundation

struct Toy: Codable {
  var name: String
}

struct Employee: Encodable {
  var name: String
  var id: Int
  var favoriteToy: Toy
    
  enum CodingKeys: CodingKey {
    case name, id, gift
  }
    
  enum GiftKeys: CodingKey {
    case toy
  }
    
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(name, forKey: .name)
    try container.encode(id, forKey: .id)
    var giftContainer = container.nestedContainer(keyedBy: GiftKeys.self, forKey: .gift)
    try giftContainer.encode(favoriteToy, forKey: .toy)
  }
}

let toy = Toy(name: "Teddy Bear")
let employee = Employee(name: "John Appleseed", id: 7, favoriteToy: toy)

let nestedData = try JSONEncoder().encode(employee)
let nestedString = String(data: nestedData, encoding: .utf8)!

extension Employee: Decodable {
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    name = try container.decode(String.self, forKey: .name)
    id = try container.decode(Int.self, forKey: .id)
    let giftContainer =  try container.nestedContainer(keyedBy: GiftKeys.self, forKey: .gift)
    favoriteToy = try giftContainer.decode(Toy.self, forKey: .toy)
  }
}

let sameEmployee = try JSONDecoder().decode(Employee.self, from: nestedData)
