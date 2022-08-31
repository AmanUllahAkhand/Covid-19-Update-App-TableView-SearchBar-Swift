//
//  CountryWiseViewController.swift
//  1.Covid19 Update
//
//  Created by USER on 19/07/2022.
//

import UIKit

class CountryWiseViewController: UIViewController {
    @IBOutlet weak var cDateLbl: UILabel!
    @IBOutlet weak var cCountryLbl: UILabel!
    @IBOutlet weak var cNewConfirmedLbl: UILabel!
    @IBOutlet weak var cNewDeathsLbl: UILabel!
    @IBOutlet weak var cNewRecoveredLbl: UILabel!
    @IBOutlet weak var cTotalConfirmedLbl: UILabel!
    @IBOutlet weak var cTotalDeathsLbl: UILabel!
    @IBOutlet weak var cTotalRecoveredLbl: UILabel!
    
    var CountryWiseUpdate : Countries?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cCountryLbl.text = CountryWiseUpdate?.Country
        cNewConfirmedLbl.text = "\(CountryWiseUpdate?.NewConfirmed ?? 00)"
        cNewConfirmedLbl.textColor = .yellow
        cNewDeathsLbl.text = "\(CountryWiseUpdate?.NewDeaths ?? 00)"
        cNewDeathsLbl.textColor = .red
        cNewRecoveredLbl.text = "\(CountryWiseUpdate?.NewRecovered ?? 00)"
        cNewRecoveredLbl.textColor = .green
        cTotalConfirmedLbl.text = "\(CountryWiseUpdate?.TotalConfirmed ?? 00)"
        cTotalConfirmedLbl.textColor = .yellow
        cTotalDeathsLbl.text = "\(CountryWiseUpdate?.TotalDeaths ?? 00)"
        cTotalDeathsLbl.textColor = .red
        cTotalRecoveredLbl.text = "\(CountryWiseUpdate?.TotalRecovered ?? 00)"
        cTotalRecoveredLbl.textColor = .green
        
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        let showDate = inputFormatter.date(from: "\(CountryWiseUpdate?.Date ?? "")")
        inputFormatter.dateFormat = "MMM d, yyyy"
        let resultString = inputFormatter.string(from: showDate!)
        self.cDateLbl.text = "\(resultString)"
        
    }
    

  
}
