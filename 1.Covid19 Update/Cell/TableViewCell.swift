//
//  TableViewCell.swift
//  1.Covid19 Update
//
//  Created by USER on 19/07/2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var countryNameLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
