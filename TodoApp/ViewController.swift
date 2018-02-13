//
//  ViewController.swift
//  TodoApp
//
//  Created by SAKU on 2018/02/13.
//  Copyright © 2018年 SAKU. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
    
    var saveTodoTitle: UserDefaults = UserDefaults.standard//ユーザーデフォルトにアクセス
    @IBOutlet var table: UITableView!//todoを表示させるためのTableView
    
    var todoArray = [String]()//todoを表示させる配列
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        table.dataSource = self
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
    
    

}

