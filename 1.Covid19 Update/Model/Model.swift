
import Foundation

struct Model: Codable {

  var ID        : String?      = nil
  var Message   : String?      = nil
  var global    : Global?      = Global()
  var countries : [Countries]? = []
  var Date      : String?      = nil

  enum CodingKeys: String, CodingKey {

    case ID        = "ID"
    case Message   = "Message"
    case global    = "Global"
    case countries = "Countries"
    case Date      = "Date"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    ID        = try values.decodeIfPresent(String.self      , forKey: .ID        )
    Message   = try values.decodeIfPresent(String.self      , forKey: .Message   )
    global    = try values.decodeIfPresent(Global.self      , forKey: .global    )
    countries = try values.decodeIfPresent([Countries].self , forKey: .countries )
    Date      = try values.decodeIfPresent(String.self      , forKey: .Date      )
 
  }

  init() {

  }

}
