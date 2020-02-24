//
//  ToDoCell.swift
//  My Day
//
//  Created by Roman Rakhlin on 19.12.2019.
//  Copyright © 2019 Roman Rakhlin. All rights reserved.
//

import UIKit

@objc protocol ToDoCellDelegate : class {
    func checkmarkTapped(sender: ToDoCell)
}

class ToDoCell: UITableViewCell {

    var delegate: ToDoCellDelegate?
    
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var titleLabel : UILabel!
  
    @IBAction func completeButtonTapped(_ sender: Any) {
        delegate?.checkmarkTapped(sender: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
