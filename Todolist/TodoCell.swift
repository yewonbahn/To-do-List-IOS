//
//  TodoCell.swift
//  Todolist
//
//  Created by 반예원 on 2021/08/31.
//

import UIKit

class TodoCell: UITableViewCell {

    @IBOutlet weak var priorityView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var topTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
