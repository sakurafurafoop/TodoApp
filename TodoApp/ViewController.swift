//
//  ViewController.swift
//  TodoApp
//
//  Created by SAKU on 2018/02/13.
//  Copyright © 2018年 SAKU. All rights reserved.
//

import UIKit

class ViewController: /*UIViewController,*/TodoViewController, UITableViewDataSource ,UITableViewDelegate{
    
    //saveTodoTitle: UserDefaults = UserDefaults.standard//ユーザーデフォルトにアクセス
    @IBOutlet var table: UITableView!//todoを表示させるためのTableView
    var todoArray:[String] = []//todoを表示させる配列
    //var numberList = todoArray[IndexPath.row]
   
    
    //var saveTodoTitle: UserDefaults = UserDefaults.standard//ユーザーデフォルトにアクセス
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        todoArray = userdefaults.object(forKey: "todoTitle") as! [String]//todoArrayにuserdefaultsに入っている配列を代入する
        //todoTextField.text = saveTodoTitle.object(forKey:"todoTitle") as? String
        table.reloadData()
        //もしuserdefaultsが空っぽである場合
        if  userdefaults.object(forKey: "todoTitle") != nil{
            //todoArray = saveTodoTitle.object(forKey: "todoTitle") as! [String]
            
        }
        table.delegate = self
        table.dataSource = self
        self.view.addSubview(table)
    }
    override func viewWillAppear(_ animated: Bool) {
        todoArray = userdefaults.object(forKey: "todoTitle") as! [String]
        table.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //TableViewのセルの数を決める
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoArray.count//配列の要素の数がセルの数になる
    }
    
    //セルに配列の内容を表示させるメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = todoArray[indexPath.row]
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        /* let TodoViewController = self.storyboard!.instantiateViewController(withIdentifier: "select")
         performSegue(withIdentifier: "TodoViewController", sender: nil)*/
        /*let storyboard: UIStoryboard = self.storyboard!
         let nextView = storyboard.instantiateViewController(withIdentifier: "select") as!
         TodoViewController
         self.present(nextView, animated: true, completion: nil)*/
        
        // tableView.deselectRow(at: indexPath, animated: true)
        
        
        print("sa")
        
        self.performSegue(withIdentifier: "toTodoViewController", sender: nil)
    }
    //削除する
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todoArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        userdefaults.set(todoArray, forKey: "todoTitle")//
        
    }
   
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTodoViewController" {
          //  let todoViewController:TodoViewController = segue.destination as! TodoViewController
         //   todoViewController.numeberList = sender as! [String:String]
        }
    }
    

}

