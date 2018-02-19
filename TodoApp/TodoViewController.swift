//
//  TodoViewController.swift
//  TodoApp
//
//  Created by SAKU on 2018/02/13.
//  Copyright © 2018年 SAKU. All rights reserved.
//

import UIKit

class TodoViewController: UIViewController/*,UITableViewDataSource */{
    
    
    @IBOutlet var todoTextField: UITextField!//todoを入れるTextField
    var todoSaveArray:[String] = []//todoを表示させる配列
    var userdefaults: UserDefaults = UserDefaults.standard//ユーザーデフォルトにアクセス
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if  userdefaults.object(forKey: "todoTitle") != nil{
             print(userdefaults.object(forKey: "todoTitle"))
            todoSaveArray = userdefaults.object(forKey:"todoTitle") as! [String]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveTodo(){
        
        
        
        todoSaveArray.append(todoTextField.text!)
        
       userdefaults.set(todoSaveArray, forKey: "todoTitle")//
        self.navigationController?.popViewController(animated: true)
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
