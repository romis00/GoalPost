//
//  GoalCellTableViewCell.swift
//  GoalPost
//
//  Created by Roman Tuzhilkin on 7/28/20.
//  Copyright © 2020 Roman Tuzhilkin. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    @IBOutlet weak var goalDescriptionLabel: UILabel!
    @IBOutlet weak var goalTypeLabel: UILabel!
    @IBOutlet weak var goalProgressLabel: UILabel!
    @IBOutlet weak var completionView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCEll(goal: Goal) {
        let goalType: String = goal.goalType! + ": " + String(goal.goalComplition)
        self.goalDescriptionLabel.text = goal.goalDescription
        self.goalTypeLabel.text = goalType
        self.goalProgressLabel.text = String(goal.goalProgress)
        
        if goal.goalProgress == goal.goalComplition {
            self.completionView.isHidden = false
        } else {
            self.completionView.isHidden = true
        }
    }

}
