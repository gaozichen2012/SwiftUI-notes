//此playground介绍如何兼容编解码简化的数据
//我们预先定义了一个模型Employee，Employee是一个嵌套结构。如果传入一个普通的无嵌套结构的JSON数据给Employee，该如何兼容接收
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
    
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(name, forKey: .name)
    try container.encode(id, forKey: .id)
    try container.encode(favoriteToy.name, forKey: .gift)
  }
}

extension Employee: Decodable {
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    name = try container.decode(String.self, forKey: .name)
    id = try container.decode(Int.self, forKey: .id)
    let gift = try container.decode(String.self, forKey: .gift)
    favoriteToy = Toy(name: gift)
  }
}

let toy = Toy(name: "Teddy Bear")
let employee = Employee(name: "John Appleseed", id: 7, favoriteToy: toy)

let data = try JSONEncoder().encode(employee)
let string = String(data: data, encoding: .utf8)!

let sameEmployee = try JSONDecoder().decode(Employee.self, from: data)
