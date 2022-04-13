//
//  ProjectCell.swift
//  ProjectShareiOS
//
//  Created by Nicolas Lara on 4/12/22.
//

import UIKit

class ProjectCell: UITableViewCell {

    @IBOutlet weak var projectName: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var about: UILabel!
    @IBOutlet weak var tech_stack: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
