//
//  ViewController.swift
//  JMEditor
//
//  Created by 에버스터디 on 2016. 8. 2..
//  Copyright © 2016년 eric. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tbl_frame : UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tbl_frame = UITableView()
        tbl_frame.dataSource = self
        tbl_frame.delegate = self
        tbl_frame.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tbl_frame)
        
        tbl_frame.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier:"UITableviewCell")
        
        self.setAutolayout()
    }
    
    func setAutolayout(){
        
        let tbl_frameT = NSLayoutConstraint(item: tbl_frame, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1.0, constant: 20)
        self.view.addConstraint(tbl_frameT)
        let tbl_frameL = NSLayoutConstraint(item: tbl_frame, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0)
        self.view.addConstraint(tbl_frameL)
        let tbl_frameR = NSLayoutConstraint(item: tbl_frame, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1.0, constant: 0)
        self.view.addConstraint(tbl_frameR)
        let tbl_frameB = NSLayoutConstraint(item: tbl_frame, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0)
        self.view.addConstraint(tbl_frameB)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController : UITableViewDelegate,UITableViewDataSource {
    
    // MARK: - tableviewcell
    
    func defaulttableView(tableview: UITableView , indexpath: NSIndexPath)-> UITableViewCell{
        
        let cell = tableview.dequeueReusableCellWithIdentifier("UITableviewCell", forIndexPath: indexpath)
        
        
        
        return cell
    }
    
    // MARK: - UItableview delegate && datasource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : UITableViewCell
        
        
        cell = self.defaulttableView(tableView, indexpath: indexPath)
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }

    
}