//
//  AddTaskViewController.swift
//  task app master demo
//
//  Created by Dilraj Devgun on 12/2/17.
//  Copyright © 2017 Dilraj Devgun. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var taskNameTextField: UITextField!
    var taskManager:TaskManager?
    @IBOutlet weak var doneButton: UIButton!
    var isInTopPosition = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.taskNameTextField.delegate = self;
        self.taskNameTextField.addTarget(self, action: #selector(textFieldDidChange), for: UIControlEvents.editingChanged)
        
        //make navigation bar clear
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
    }
    
    override func viewDidLayoutSubviews() {
        self.taskNameTextField.frame = CGRect(x: 10, y: (self.view.frame.height/2) - (95/2) - 100, width: self.view.frame.width - 20, height: 95)
        
        self.doneButton.frame = CGRect(x: 10, y: self.view.frame.height * 0.7, width: self.view.frame.width-20, height: 40)
        self.doneButton.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.taskNameTextField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressedDoneButton(_ sender: Any) {
        let text = self.taskNameTextField.text
        if text != nil && text != ""  {
            taskManager?.addTaskWithName(name: text!)
            self.navigationController?.popViewController(animated: true)
        } else {
            let ac = UIAlertController(title: "Error", message: "Task Field must be filled", preferredStyle: UIAlertControllerStyle.alert)
            ac.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
            self.present(ac, animated: true, completion: nil)
        }
    }
    
    @objc func textFieldDidChange() {
        if self.taskNameTextField.text == ""  {
            self.taskNameTextField.placeholder = "Task"
            self.moveInputFieldDown()
        }
        else {
            if !self.isInTopPosition {
                self.moveInputFieldUp()
            }
        }
    }
    
    //moves the input field down to the centre of the screen
    func moveInputFieldUp() {
        if !self.isInTopPosition {
            UIView.animate(withDuration: 0.3, animations: {() in
                self.taskNameTextField.frame = CGRect(x: 10, y: (self.view.frame.height/2) - (95/2) - 200, width: self.view.frame.width - 20, height: 95)
                
                self.doneButton.frame = CGRect(x: 10, y: self.taskNameTextField.frame.maxY + 70, width: self.view.frame.width-20, height: 40)
                self.doneButton.alpha = 1
            }, completion: {(completion:Bool) in
                self.isInTopPosition = true
            })
        }
    }
    
    //moves the input field up to its top position
    func moveInputFieldDown() {
        if self.isInTopPosition {
            UIView.animate(withDuration: 0.3, animations: {() in
                self.taskNameTextField.frame = CGRect(x: 10, y: (self.view.frame.height/2) - (95/2) - 100, width: self.view.frame.width - 20, height: 95)
                
                self.doneButton.frame = CGRect(x: 10, y: self.view.frame.height * 0.7, width: self.view.frame.width-20, height: 40)
                self.doneButton.alpha = 0
            }, completion: {(completion:Bool) in
                self.isInTopPosition = false
            })
        }
    }

}
