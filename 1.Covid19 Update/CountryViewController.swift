//
//  CountryViewController.swift
//  1.Covid19 Update
//
//  Created by USER on 19/07/2022.
//

import UIKit

class CountryViewController: UIViewController,UISearchBarDelegate {

    @IBOutlet weak var searceBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    private let CovidUpdate = Covid19Update()
    
    var myData : [Countries]? = []
    var myDataTemp : [Countries]? = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
  //searcebar.......
       searceBar.delegate = self
    myDataTemp = myData
   
        setupContainer()
        loadMyData()
    }
   
    func setupContainer(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.reloadData()
        self.tableView.separatorColor = UIColor.red
    }
    
    func loadMyData() {
        CovidUpdate.getCovidUpdate{ [self] success in
            print(success)
            self.myData = success.countries
            self.myDataTemp = self.myData
            self.tableView.reloadData()

        }
    }

}


extension  CountryViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myDataTemp?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
    
        
        if let md = myDataTemp?[indexPath.row] {
            cell.countryNameLbl.text = " \(md.Country ?? "")"

        }
       
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let StoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let CountryWiseViewController = StoryBoard.instantiateViewController(identifier: "CountryWiseViewController") as! CountryWiseViewController
        if let md = myDataTemp?[indexPath.row] {
            CountryWiseViewController.CountryWiseUpdate = md
        }
        
        self.navigationController?.pushViewController(CountryWiseViewController, animated: true)
    }
    
    
    // SearchBar.......
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText == "" {
            myDataTemp = myData
            tableView.reloadData()
        } else {
            myDataTemp?.removeAll()
            if let countryData = myData {
                for country in countryData {
                    if let name = country.Country {
                        if name.lowercased().contains(searchText.lowercased()) {
                            myDataTemp?.append(country)
                        }
                    }
                    
                }
            }
            self.tableView.reloadData()
        }

   }

}


