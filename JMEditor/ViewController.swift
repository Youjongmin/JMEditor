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
    var v_footer : UIView!
    var tblArray = [String]()
    var v_footerB : NSLayoutConstraint!
    var btn_color :UIButton!
    var btn_bgcolor :UIButton!
    var v_colorselect : UIView?
    var v_colorselectB : NSLayoutConstraint!

    var beforeTagnum :Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tbl_frame = UITableView()
        tbl_frame.dataSource = self
        tbl_frame.delegate = self
        tbl_frame.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tbl_frame)
        
//        tbl_frame.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier:"UITableviewCell")
        tbl_frame.registerClass(TextViewTableViewCell.classForCoder(), forCellReuseIdentifier:"TextViewTableViewCell")
        
        
        v_footer = UIView()
        v_footer.backgroundColor = UIColor.lightGrayColor()
        v_footer.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(v_footer)
        
        
        btn_color = UIButton(type: .System)
        btn_color.translatesAutoresizingMaskIntoConstraints = false
        btn_color.addTarget(self, action: #selector(ViewController.colorbuttonAction(_:)), forControlEvents: .TouchUpInside)
        btn_color.setTitle("color", forState: .Normal)
        btn_color.tag = 100
        v_footer.addSubview(btn_color)
        
        btn_bgcolor = UIButton(type: .System)
        btn_bgcolor.translatesAutoresizingMaskIntoConstraints = false
        btn_bgcolor.addTarget(self, action: #selector(ViewController.colorbuttonAction(_:)), forControlEvents: .TouchUpInside)
        btn_bgcolor.setTitle("bgcolor", forState: .Normal)
        btn_bgcolor.tag = 200
        v_footer.addSubview(btn_bgcolor)
        
        
        tblArray.append("textview")
        
        self.setAutolayout()
        self.setNotification()
    }
    
    func setAutolayout(){
        
        v_footerB = NSLayoutConstraint(item: v_footer, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0)
        self.view.addConstraint(v_footerB)
        let v_footerL = NSLayoutConstraint(item: v_footer, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0)
        self.view.addConstraint(v_footerL)
        let v_footerR = NSLayoutConstraint(item: v_footer, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1.0, constant: 0)
        self.view.addConstraint(v_footerR)
        let v_footerH = NSLayoutConstraint(item: v_footer, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 40)
        v_footer.addConstraint(v_footerH)
        
        let btn_colorCY = NSLayoutConstraint(item: btn_color, attribute: .CenterY, relatedBy: .Equal, toItem: v_footer, attribute: .CenterY, multiplier: 1.0, constant: 0)
        v_footer.addConstraint(btn_colorCY)
        let btn_colorL = NSLayoutConstraint(item: btn_color, attribute: .Left, relatedBy: .Equal, toItem: v_footer, attribute: .Right, multiplier: 0.04, constant: 0)
        v_footer.addConstraint(btn_colorL)
        
        let btn_bgcolorCY = NSLayoutConstraint(item: btn_bgcolor, attribute: .CenterY, relatedBy: .Equal, toItem: v_footer, attribute: .CenterY, multiplier: 1.0, constant: 0)
        v_footer.addConstraint(btn_bgcolorCY)
        let btn_bgcolorL = NSLayoutConstraint(item: btn_bgcolor, attribute: .Left, relatedBy: .Equal, toItem: btn_color, attribute: .Right, multiplier: 1.0, constant: 10)
        v_footer.addConstraint(btn_bgcolorL)
        
        
        let tbl_frameT = NSLayoutConstraint(item: tbl_frame, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1.0, constant: 20)
        self.view.addConstraint(tbl_frameT)
        let tbl_frameL = NSLayoutConstraint(item: tbl_frame, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0)
        self.view.addConstraint(tbl_frameL)
        let tbl_frameR = NSLayoutConstraint(item: tbl_frame, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1.0, constant: 0)
        self.view.addConstraint(tbl_frameR)
        let tbl_frameB = NSLayoutConstraint(item: tbl_frame, attribute: .Bottom, relatedBy: .Equal, toItem: v_footer, attribute: .Top, multiplier: 1.0, constant: 0)
        self.view.addConstraint(tbl_frameB)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Action
    func colorbuttonAction(sender : AnyObject){
       
        guard let tagnum = sender.tag else { return }
        
        if v_colorselect == nil {
            
        v_colorselect = UIView()
        v_colorselect!.translatesAutoresizingMaskIntoConstraints = false
            if tagnum == 100 {
                v_colorselect!.backgroundColor = UIColor.yellowColor()
            }else{
                v_colorselect!.backgroundColor = UIColor.blueColor()
            }
         beforeTagnum = tagnum
       
        self.view.insertSubview(v_colorselect!, belowSubview: v_footer)
        
        v_colorselectB = NSLayoutConstraint(item: v_colorselect!, attribute: .Bottom, relatedBy: .Equal, toItem: v_footer, attribute: .Bottom, multiplier: 1.0, constant: 0)
        self.view.addConstraint(v_colorselectB)
        let v_colorselectL = NSLayoutConstraint(item: v_colorselect!, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0)
        self.view.addConstraint(v_colorselectL)
        let v_colorselectR = NSLayoutConstraint(item: v_colorselect!, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1.0, constant: 0)
        self.view.addConstraint(v_colorselectR)
        let v_colorselectH = NSLayoutConstraint(item: v_colorselect!, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 40)
        v_colorselect!.addConstraint(v_colorselectH)
        
        self.view.layoutSubviews()
       
        
        UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 3, initialSpringVelocity: 6, options: .CurveEaseInOut, animations: { [weak self] in
            
            self!.v_colorselectB.constant = -40
            self!.view.layoutSubviews()
       
            }, completion: nil)
      
        }else{
            
             self.view.layoutSubviews()
         
        
          if beforeTagnum == tagnum {
            
            UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 3, initialSpringVelocity: 6 , options: .CurveEaseInOut, animations: { [weak self] in
                
                self!.v_colorselectB.constant = 0
                
                self!.view.layoutSubviews()
                
                }, completion: { [weak self] finish in
                    
                    if finish {
                        
                        self!.v_colorselect?.removeFromSuperview()
                        self!.v_colorselect = nil
                    }
                    
            })
            
            }else{
                
                
                if tagnum == 100 {
                    v_colorselect!.backgroundColor = UIColor.yellowColor()
                }else{
                    v_colorselect!.backgroundColor = UIColor.blueColor()
                }
                
                beforeTagnum = tagnum
            }
            
            
        }
        
        
    }
    

    // MARK: - setNotification
    func setNotification(){

        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.keyboardhideNotification(_:)), name: UIKeyboardWillHideNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.keyboardshowNotification(_:)), name: UIKeyboardWillShowNotification, object: nil)
        
    }
    
    func removeNotification(){
        
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)

    }

    
    // MARK: - keyboardNotification
    
    func keyboardshowNotification(notification: NSNotification){
        
        if  let userInfo = notification.userInfo {
            
            let endFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.CGRectValue()
            let duration: NSTimeInterval = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
            let animationCurvRawNSN = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber
            let animationCurveRaw = animationCurvRawNSN?.unsignedLongValue ?? UIViewAnimationOptions.CurveEaseInOut.rawValue
            let animationCurve:UIViewAnimationOptions = UIViewAnimationOptions(rawValue: animationCurveRaw)
            
            v_footerB.constant = -((endFrame?.size.height)!) ?? 0.0
            
            
            UIView.animateWithDuration(duration, delay: NSTimeInterval(0), options: animationCurve, animations: {
                self.view.layoutIfNeeded()
                }, completion: nil)
            
            
            
            
        }
        
        
    }
    func keyboardhideNotification(notification: NSNotification){
        
        if  let userInfo = notification.userInfo {
          
            let duration: NSTimeInterval = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
            let animationCurvRawNSN = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber
            let animationCurveRaw = animationCurvRawNSN?.unsignedLongValue ?? UIViewAnimationOptions.CurveEaseInOut.rawValue
            let animationCurve:UIViewAnimationOptions = UIViewAnimationOptions(rawValue: animationCurveRaw)
            
            v_footerB.constant =  0.0

            
            UIView.animateWithDuration(duration, delay: NSTimeInterval(0), options: animationCurve, animations: {
                self.view.layoutIfNeeded()
                }, completion: nil)
      
        }
        
        
    }

}


extension ViewController : UITableViewDelegate,UITableViewDataSource {
    
    // MARK: - tableviewcell
    
    func defaulttableView(tableview: UITableView , indexpath: NSIndexPath)-> UITableViewCell{
        
        let cell = tableview.dequeueReusableCellWithIdentifier("UITableviewCell", forIndexPath: indexpath)
        
        
        
        return cell
    }
    
    func textviewtableView(tableview: UITableView , indexpath: NSIndexPath)-> UITableViewCell{
        
        let cell = tableview.dequeueReusableCellWithIdentifier("TextViewTableViewCell", forIndexPath: indexpath) as! TextViewTableViewCell
        
//        cell.textView.delegate = self
     
        
        
        
        return cell
    }
    
    // MARK: - UItableview delegate && datasource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tblArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : UITableViewCell
        
        if tblArray[indexPath.row] == "textview" {
          
            cell = self.textviewtableView(tableView, indexpath: indexPath)
        
        }else{
        
            cell = self.defaulttableView(tableView, indexpath: indexPath)
        
        }
        
        
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
         if tblArray[indexPath.row] == "textview" {
            return 200
         }else{
            return 50
        }
        
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }

    
}