//此playground介绍如何通过子类方式编解码{{a},{b},{c}}格式的JSON

import Foundation

struct Toy: Codable {
  var name: String
}

class BasicEmployee: Codable {
  var name: String
  var id: Int
  
  init(name: String, id: Int) {
    self.name = name
    self.id = id
  }
}

class GiftEmployee: BasicEmployee {
  var birthday: Date
  var toy: Toy
  
  enum CodingKeys: CodingKey {
    case employee, birthday, toy
  }

  init(name: String, id: Int, birthday: Date, toy: Toy) {
    self.birthday = birthday
    self.toy = toy
    super.init(name: name, id: id)
  }

  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    birthday = try container.decode(Date.self, forKey: .birthday)
    toy = try container.decode(Toy.self, forKey: .toy)
    let baseDecoder = try container.superDecoder(forKey: .employee)
    try super.init(from: baseDecoder)
  }

  override func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(birthday, forKey: .birthday)
    try container.encode(toy, forKey: .toy)
    let baseEncoder = container.superEncoder(forKey: .employee)
    try super.encode(to: baseEncoder)
  }
}

let toy = Toy(name: "Teddy Bear")
let giftEmployee = GiftEmployee(name: "John Appleseed", id: 7, birthday: Date(), toy: toy)

let giftData = try JSONEncoder().encode(giftEmployee)
let giftString = String(data: giftData, encoding: .utf8)!
let sameGiftEmployee = try JSONDecoder().decode(GiftEmployee.self, from: giftData)
