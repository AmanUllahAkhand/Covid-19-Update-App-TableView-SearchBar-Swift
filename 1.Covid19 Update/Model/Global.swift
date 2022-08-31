
import Foundation

struct Global: Codable {

  var NewConfirmed   : Int?    = nil
  var TotalConfirmed : Int?    = nil
  var NewDeaths      : Int?    = nil
  var TotalDeaths    : Int?    = nil
  var NewRecovered   : Int?    = nil
  var TotalRecovered : Int?    = nil
  var Date           : String? = nil

  enum CodingKeys: String, CodingKey {

    case NewConfirmed   = "NewConfirmed"
    case TotalConfirmed = "TotalConfirmed"
    case NewDeaths      = "NewDeaths"
    case TotalDeaths    = "TotalDeaths"
    case NewRecovered   = "NewRecovered"
    case TotalRecovered = "TotalRecovered"
    case Date           = "Date"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    NewConfirmed   = try values.decodeIfPresent(Int.self    , forKey: .NewConfirmed   )
    TotalConfirmed = try values.decodeIfPresent(Int.self    , forKey: .TotalConfirmed )
    NewDeaths      = try values.decodeIfPresent(Int.self    , forKey: .NewDeaths      )
    TotalDeaths    = try values.decodeIfPresent(Int.self    , forKey: .TotalDeaths    )
    NewRecovered   = try values.decodeIfPresent(Int.self    , forKey: .NewRecovered   )
    TotalRecovered = try values.decodeIfPresent(Int.self    , forKey: .TotalRecovered )
    Date           = try values.decodeIfPresent(String.self , forKey: .Date           )
 
  }

  init() {

  }

}