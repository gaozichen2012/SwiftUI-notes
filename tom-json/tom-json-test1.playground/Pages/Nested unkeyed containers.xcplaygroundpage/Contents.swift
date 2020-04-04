//此playground介绍在对象中处理数组（数组属于无键值的容器）
import Foundation

struct Toy: Encodable {
  var name: String
  var label: String
  
  enum CodingKeys: CodingKey {
    case name, label
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(name, forKey: .name)
    var labelContainer = container.nestedUnkeyedContainer(forKey: .label)
    try labelContainer.encode(label.lowercased())
    try labelContainer.encode(label.uppercased())
    try labelContainer.encode(label)
  }
}

let toy = Toy(name: "Teddy Bear", label: "Teddy Bear")
let data = try JSONEncoder().encode(toy)
let string = String(data: data, encoding: .utf8)!

extension Toy: Decodable {
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    name = try container.decode(String.self, forKey: .name)
    var labelContainer = try container.nestedUnkeyedContainer(forKey: .label)
    var labelName = ""
    while !labelContainer.isAtEnd {
      labelName = try labelContainer.decode(String.self)
    }
    label = labelName
  }
}

let sameToy = try JSONDecoder().decode(Toy.self, from: data)
