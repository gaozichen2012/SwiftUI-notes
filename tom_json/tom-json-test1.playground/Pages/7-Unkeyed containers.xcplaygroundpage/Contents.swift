//此playground介绍处理数组（数组属于无键值的容器）
import Foundation

struct Toy: Codable {
  var name: String
}

let toy = Toy(name: "Teddy Bear")

struct Label: Encodable {
  var toy: Toy
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.unkeyedContainer()
    try container.encode(toy.name.lowercased())//字符串小写编码
    try container.encode(toy.name.uppercased())//字符串大写编码
    try container.encode(toy.name)//字符串默认编码
  }
}

let label = Label(toy: toy)
let labelData = try JSONEncoder().encode(label)
let labelString = String(data: labelData, encoding: .utf8)!

extension Label: Decodable {
  init(from decoder: Decoder) throws {
    var container = try decoder.unkeyedContainer()
    var name = ""
    while !container.isAtEnd {
      name = try container.decode(String.self)
    }
    toy = Toy(name: name)
  }
}

let sameLabel = try JSONDecoder().decode(Label.self, from: labelData)
