//
//  MoneyManage.swift
//  Modeling
//
//  Created by MameNitro on 2017/02/21.
//  Copyright © 2017年 RyukyuUniversity. All rights reserved.
//

import UIKit

var result: Int = 0

class MoneyManage: UIViewController {

    @IBOutlet weak var MoneyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (UserDefaults.init().object(forKey: "MM")) != nil {
        
            result = UserDefaults.init().object(forKey: "MM") as! Int
            
            MoneyLabel.text = String(result)
            
        }
        
        MoneyLabel.textAlignment = .center
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var NumberField: UITextField!
    
    
    @IBAction func ADD(_ sender: Any) {
        NumberField.text = NumberField.text?.applyingTransform(.fullwidthToHalfwidth, reverse: false)
        if isOnlyNumber(NumberField.text!) {
            result += Int(NumberField.text!)!
            UserDefaults.init().set(result, forKey: "MM")
            MoneyLabel.text = String(result) + "円"
        } else{
            NumberField.text = ""
        }
    }
    
    @IBAction func SUB(_ sender: Any) {
        NumberField.text = NumberField.text?.applyingTransform(.fullwidthToHalfwidth, reverse: false)
        if isOnlyNumber(NumberField.text!) {
            result -= Int(NumberField.text!)!
            UserDefaults.init().set(result, forKey: "MM")
            MoneyLabel.text = String(result) + "円"
        } else{
            NumberField.text = ""
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        result = 0
        UserDefaults.init().set(result, forKey: "MM")
        
        MoneyLabel.text = String(result)
    }
    
    //入力された文字列が数字か判定
    func isOnlyNumber(_ str:String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES '\\\\d+'")
        return predicate.evaluate(with: str)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
