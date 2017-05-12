//
//  SecondViewController.swift
//  p05-langert
//
//  Created by Erik Langert on 3/24/17.
//  Copyright © 2017 Erik Langert. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var txtTask: UITextField!
    @IBOutlet var txtDesc: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
    
    @IBAction func btnAddTask_Click(sender: UIButton) {
        taskMgr.addTask(name: txtTask.text!, description: txtDesc.text!)
        self.view.endEditing(true)
        txtTask.text = ""
        txtDesc.text = ""
        txtTask.backgroundColor = UIColor(red: random(),
                                    green: random(),
                                    blue: random(),
                                    alpha: 0.3)
        txtDesc.backgroundColor = UIColor(red: random(),
                                          green: random(),
                                          blue: random(),
                                          alpha: 0.3)

        
        self.tabBarController?.selectedIndex = 0
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

