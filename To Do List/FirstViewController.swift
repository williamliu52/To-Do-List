//
//  FirstViewController.swift
//  To Do List
//
//  Created by William Liu on 2016-02-19.
//  Copyright © 2016 William Liu. All rights reserved.
//

import UIKit

var toDoList = [String]()

var doneList = [String]()

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var toDoTable: UITableView!
    
    @IBAction func addBtn(sender: AnyObject) {
        toDoList.append("")
        
        for value in toDoList {
            print(value)
        }
        
        toDoTable.reloadData()
    }
    
    @IBAction func doneBtn(sender: AnyObject) {
        doneList.append(toDoList[(self.toDoTable.indexPathForSelectedRow?.row)!])
        toDoList.removeAtIndex((self.toDoTable.indexPathForSelectedRow?.row)!)
        NSUserDefaults.standardUserDefaults().setObject(doneList, forKey: "doneList")
        toDoTable.reloadData()
        
        print(doneList)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toDoList.count
    }
    
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! TextInputTableViewCell
        
        cell.textLabel?.text = toDoList[indexPath.row]
        
        return cell
    }

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            toDoList.removeAtIndex(indexPath.row)
            toDoTable.reloadData()
        }
    }
    override func viewDidAppear(animated: Bool) {
        
        toDoTable.reloadData()
        
       
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    /*func closeKeyboard(textField: UITextField!) -> Bool {
        
        
    }*/
}

