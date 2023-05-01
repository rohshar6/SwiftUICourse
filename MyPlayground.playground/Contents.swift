import UIKit

var a: String = ""
var b: String?
var c: String! = "b"

// Correct Approach
enum OptionalText<T>: ExpressibleByNilLiteral {
    case none
    case some(T)
    
    init(nilLiteral: ()) {
        self = .none
    }
    
    init(_ some: T) {
        self = .some(some)
    }
}


struct KeyValue {
    var value: Int
    var key: String
}

struct Map {
    var values = [KeyValue]()
    
    func filter(_ condition: (KeyValue) -> (Bool)) -> [KeyValue] {
        var results: [KeyValue] = []
        for value in values {
            if (condition(value)) {
                results.append(value)
            }
        }
        return results
    }
}

// Filter approach
func filter<T>(_ collection: [T], _ isIncluded: (T) -> Bool) -> [T] {
    var results: [T] = []
    for val in results {
        if isIncluded(val) {
            results.append(val)
        }
    }
    return results
}

var currentMapValues = [KeyValue]()
currentMapValues.append(KeyValue(value: 2, key: "2"))
currentMapValues.append(KeyValue(value: 3, key: "3"))
currentMapValues.append(KeyValue(value: 1, key: "1"))
currentMapValues.append(KeyValue(value: 4, key: "4"))

var filterMap = Map()
filterMap.values = currentMapValues

let result = filterMap.filter { value in
    value.value > 3
}
print(result)




//struct JSON: Codable {
//  var value: Any?
//
//  public init(from decoder: Decoder) throws {
//    self.value = 0
//  }
//
//  public func encode(to encoder: Encoder) throws {
//  }
//}
//
//
//class ProductModel: Codable {
//    var id: Json
//
//
//    init(id: Json) {
//        self.id = id
//    }
//}
//
//let json = """
//[
//    {
//        "id": "1",
//    },
//    {
//        "id": 2,
//    }
//]
//"""
//
//let data = Data(json.utf8)
//let decoder = JSONDecoder()
//
//do {
//    let decoded = try JSONSerialization.jsonObject(with: data) as? [String : Any]
//} catch {
//    print("Failed to decode JSON")
//}
