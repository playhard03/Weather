import Foundation

struct WeatherData: Codable {
    var location: Location?
    var current : Current?
}
struct Current: Codable{
    var condition : Condition?
    var temp_c : Double?
    var wind_kph : Double?
    var pressure_mb : Double?
}
struct Condition: Codable{
    var icon : String?
    var text : String?
}
class Location: Codable{
    var name : String?
    var country : String?
}
