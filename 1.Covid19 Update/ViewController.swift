//
//  ViewController.swift
//  1.Covid19 Update
//
//  Created by USER on 19/07/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var newConfirmed: UILabel!
    @IBOutlet weak var newDeaths: UILabel!
    @IBOutlet weak var newRecovered: UILabel!
    @IBOutlet weak var totalConfirmed: UILabel!
    @IBOutlet weak var totalDeaths: UILabel!
    @IBOutlet weak var totalRecovered: UILabel!
    @IBOutlet weak var countryWiseBtn: UIButton!
    
    
    private let CovidUpdate = Covid19Update()
    
    private var myData : Global? = Global()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadMyData()
        
        //
    
//        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Pandemic")!)
//        
      //  self.imageView.backgroundColor = UIColor(patternImage: UIImage(named: "Covid19")!)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        
    }
    
    //Country Wise Btn Action
    
    @IBAction func countryWiseBtnAction(_ sender: Any) {
       let StoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let CountryViewController = StoryBoard.instantiateViewController(identifier: "CountryViewController") as! CountryViewController
        self.navigationController?.pushViewController(CountryViewController, animated: true)
        
    }
    
    
    func loadMyData() {
        CovidUpdate.getCovidUpdate{ [self] success in
            print(success)
          
            if let md = success.global {
                if let mData = md.TotalConfirmed {
                    self.totalConfirmed.text = "\(mData)"
                    totalConfirmed.textColor = .yellow
                }
                guard let mDeaths = md.TotalDeaths else { return }
                guard let mNewRecovery = md.NewRecovered else { return }
                guard let mTotalRecovery = md.TotalRecovered else { return }
                
                guard let mNewDeaths = md.NewDeaths else { return }
                guard let mNewConfirmed = md.NewConfirmed else { return }
                guard let mDate = md.Date else { return }
                
                self.totalDeaths.text = "\(mDeaths)"
                totalDeaths.textColor = .red
                self.newConfirmed.text = "\(mNewConfirmed)"
                newConfirmed.textColor = .yellow
                self.newDeaths.text = "\(mNewDeaths)"
                newDeaths.textColor = .red
                self.newRecovered.text = "\(mNewRecovery)"
                newRecovered.textColor = .green
                self.totalRecovered.text = "\(mTotalRecovery)"
                totalRecovered.textColor = .green
                
          
                
               // self.dateLbl.text = "Date: \("\(mDate)")"
                
                let inputFormatter = DateFormatter()
                inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
                let showDate = inputFormatter.date(from: "\(mDate)")
                inputFormatter.dateFormat = "MMM d, yyyy hh:mm a"
                let resultString = inputFormatter.string(from: showDate!)
                self.dateLbl.text = "\(resultString)"
                dateLbl.textColor = .brown
                
               
            }
            
        }
        
    }

}
