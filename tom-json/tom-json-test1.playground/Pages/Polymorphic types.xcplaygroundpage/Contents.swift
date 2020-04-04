//此playground介绍处理多态数组
import Foundation

struct Toy: Codable {
  var name: String
}
let toy = Toy(name: "Teddy Bear")
let encoder = JSONEncoder()
let decoder = JSONDecoder()

enum AnyEmployee: Encodable {
  case defaultEmployee(String, Int)
  case customEmployee(String, Int, Date, Toy)
  case noEmployee
  
  enum CodingKeys: CodingKey {
    case name, id, birthday, toy
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    
    switch self {
      case .defaultEmployee(let name, let id):
        try container.encode(name, forKey: .name)
        try container.encode(id, forKey: .id)
      case .customEmployee(let name, let id, let birthday, let toy):
        try container.encode(name, forKey: .name)
        try container.encode(id, forKey: .id)
        try container.encode(birthday, forKey: .birthday)
        try container.encode(toy, forKey: .toy)
      case .noEmployee:
        let context = EncodingError.Context(codingPath: encoder.codingPath, debugDescription: "Invalid employee!")
        throw EncodingError.invalidValue(self, context)
    }
  }
}

let employees = [AnyEmployee.defaultEmployee("John Appleseed", 7), AnyEmployee.customEmployee("John Appleseed", 7, Date(), toy)]
let employeesData = try encoder.encode(employees)
let employeesString = String(data: employeesData, encoding: .utf8)!

extension AnyEmployee: Decodable {
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    let containerKeys = Set(container.allKeys)
    let defaultKeys = Set<CodingKeys>([.name, .id])
    let customKeys = Set<CodingKeys>([.name, .id, .birthday, .toy])
    
    guard containerKeys == defaultKeys || containerKeys == customKeys else {
      let context = DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Not enough keys!")
      throw DecodingError.dataCorrupted(context)
    }
    
    switch containerKeys {
      case defaultKeys:
        let name = try container.decode(String.self, forKey: .name)
        let id = try container.decode(Int.self, forKey: .id)
        self = .defaultEmployee(name, id)
      case customKeys:
        let name = try container.decode(String.self, forKey: .name)
        let id = try container.decode(Int.self, forKey: .id)
        let birthday = try container.decode(Date.self, forKey: .birthday)
        let toy = try container.decode(Toy.self, forKey: .toy)
        self = .customEmployee(name, id, birthday, toy)
      default:
        self = .noEmployee
    }
  }
}

let sameEmployees = try decoder.decode([AnyEmployee].self, from: employeesData)
