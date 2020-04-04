//此playground介绍如何处理JSON中的日期
//没有针对日期的JSON标准，一般采用`JSONEncoder().dateEncodingStrategy`和`JSONDecoder().dateDecodingStrategy`来修改编解码JSON数据的日期

import Foundation

struct Toy: Codable {
  var name: String
}

struct Employee: Codable {
  var name: String
  var id: Int
  var birthday: Date
  var toy: Toy
}

let toy = Toy(name: "Teddy Bear")
let employee = Employee(name: "John Appleseed", id: 7, birthday: Date(), toy: toy)

extension DateFormatter {
  static let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd-MM-yyyy"
    return formatter
  }()
}

JSONEncoder().dateEncodingStrategy = .formatted(.dateFormatter)
JSONDecoder().dateDecodingStrategy = .formatted(.dateFormatter)

let dateData = try JSONEncoder().encode(employee)
let dateString = String(data: dateData, encoding: .utf8)!
let sameEmployee = try JSONDecoder().decode(Employee.self, from: dateData)

