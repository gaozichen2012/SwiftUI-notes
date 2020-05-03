//此playground介绍嵌套类型JSON的编解码和映射
import Foundation

struct Toy: Codable {
  var name: String
}

struct Employee: Codable {
  var name: String
  var id: Int
  var favoriteToy: Toy
    
  enum CodingKeys: String, CodingKey {
    case name, id, favoriteToy = "gift"
  }
}

let toy = Toy(name: "Teddy Bear")
let employee = Employee(name: "John Appleseed", id: 7, favoriteToy: toy)

let data = try! JSONEncoder().encode(employee)
let string = String(data: data, encoding: .utf8)!
let sameEmployee = try! JSONDecoder().decode(Employee.self, from: data)

print(string)
