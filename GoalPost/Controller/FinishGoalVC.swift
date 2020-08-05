//
//  FinishGoalVC.swift
//  GoalPost
//
//  Created by Roman Tuzhilkin on 8/4/20.
//  Copyright © 2020 Roman Tuzhilkin. All rights reserved.
//

import UIKit

class FinishGoalVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var goalBtn: UIButton!
    @IBOutlet weak var pointsTextField: UITextField!
    
    var goalDescription: String!
    var goalType: GoalType!
    
    func initData(description: String, type: GoalType) {
        self.goalDescription = description
        self.goalType = type
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goalBtn.bindToKeyboard()
        
        pointsTextField.delegate = self

    }

    @IBAction func createGoalPressed(_ sender: Any) {
        if pointsTextField.text != "" && pointsTextField.text != "0" {
            self.saveData { (complete) in
                if complete {
                    dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    @IBAction func backBtnFromFinishGoal(_ sender: Any) {
        dismissDetail()
    }
    
    func saveData(completion: (_ finished: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let goal = Goal(context: managedContext)
        
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalComplition = Int32(pointsTextField.text!)!
        goal.goalProgress = Int32(0)
        
        do{
            try managedContext.save()
            completion(true)
            print("SUCCESS")
        } catch {
            debugPrint("Could not save: \(error.localizedDescription)")
            completion(false)
        }
    }
}
