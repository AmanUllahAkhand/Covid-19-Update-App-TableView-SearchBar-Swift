
import Foundation

struct Countries: Codable {

  var ID             : String?  = nil
  var Country        : String?  = nil
  var CountryCode    : String?  = nil
  var Slug           : String?  = nil
  var NewConfirmed   : Int?     = nil
  var TotalConfirmed : Int?     = nil
  var NewDeaths      : Int?     = nil
  var TotalDeaths    : Int?     = nil
  var NewRecovered   : Int?     = nil
  var TotalRecovered : Int?     = nil
  var Date           : String?  = nil
 // var Premium        : Premium? = Premium()

  enum CodingKeys: String, CodingKey {

    case ID             = "ID"
    case Country        = "Country"
    case CountryCode    = "CountryCode"
    case Slug           = "Slug"
    case NewConfirmed   = "NewConfirmed"
    case TotalConfirmed = "TotalConfirmed"
    case NewDeaths      = "NewDeaths"
    case TotalDeaths    = "TotalDeaths"
    case NewRecovered   = "NewRecovered"
    case TotalRecovered = "TotalRecovered"
    case Date           = "Date"
   // case Premium        = "Premium"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    ID             = try values.decodeIfPresent(String.self  , forKey: .ID             )
    Country        = try values.decodeIfPresent(String.self  , forKey: .Country        )
    CountryCode    = try values.decodeIfPresent(String.self  , forKey: .CountryCode    )
    Slug           = try values.decodeIfPresent(String.self  , forKey: .Slug           )
    NewConfirmed   = try values.decodeIfPresent(Int.self     , forKey: .NewConfirmed   )
    TotalConfirmed = try values.decodeIfPresent(Int.self     , forKey: .TotalConfirmed )
    NewDeaths      = try values.decodeIfPresent(Int.self     , forKey: .NewDeaths      )
    TotalDeaths    = try values.decodeIfPresent(Int.self     , forKey: .TotalDeaths    )
    NewRecovered   = try values.decodeIfPresent(Int.self     , forKey: .NewRecovered   )
    TotalRecovered = try values.decodeIfPresent(Int.self     , forKey: .TotalRecovered )
    Date           = try values.decodeIfPresent(String.self  , forKey: .Date           )
   // Premium        = try values.decodeIfPresent(Premium.self , forKey: .Premium        )
 
  }

  init() {

  }

}
