//
//  ViewController.swift
//  JMEditor
//
//  Created by 에버스터디 on 2016. 8. 2..
//  Copyright © 2016년 eric. All rights reserved.
//

import UIKit

struct changeAinfo {
    var attribureName : String
    var attribureValue : AnyObject
}

class ViewController: UIViewController {

    var tbl_frame : UITableView!
    var v_footer : UIView!
    var tblArray = [String]()
    var v_footerB : NSLayoutConstraint!
    
    var btn_color :UIButton!
    var btn_bgcolor :UIButton!
    var btn_bold :UIButton!
    var btn_align :UIButton!
    var btn_fline :UIButton!
    
    var v_colorselect : UIView?
    var v_colorselectB : NSLayoutConstraint!

    var beforeTagnum :Int = 0
    var colorArray = ["red","blue","yellow"]
    var collectionview : UICollectionView!
    
    var tv_selectd = UITextView()
    
    
    var changeattribute = changeAinfo?()
    
    
    
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
        
        
        btn_bold = UIButton(type: .System)
        btn_bold.translatesAutoresizingMaskIntoConstraints = false
        btn_bold.addTarget(self, action: #selector(ViewController.boldBtnAciton(_:)), forControlEvents: .TouchUpInside)
        btn_bold.setTitle("bold", forState: .Normal)
        v_footer.addSubview(btn_bold)
        
        
        btn_align = UIButton(type: .System)
        btn_align.translatesAutoresizingMaskIntoConstraints = false
        btn_align.addTarget(self, action: #selector(ViewController.alignBtnAciton(_:)), forControlEvents: .TouchUpInside)
        btn_align.setTitle("Align", forState: .Normal)
        v_footer.addSubview(btn_align)
        
        btn_fline = UIButton(type: .System)
        btn_fline.translatesAutoresizingMaskIntoConstraints = false
        btn_fline.addTarget(self, action: #selector(ViewController.flineBtnAciton(_:)), forControlEvents: .TouchUpInside)
        btn_fline.setTitle("fline", forState: .Normal)
        v_footer.addSubview(btn_fline)
        
        tblArray.append("textview")
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
        
        let btn_boldCY = NSLayoutConstraint(item: btn_bold, attribute: .CenterY, relatedBy: .Equal, toItem: v_footer, attribute: .CenterY, multiplier: 1.0, constant: 0)
        v_footer.addConstraint(btn_boldCY)
        let btn_boldL = NSLayoutConstraint(item: btn_bold, attribute: .Left, relatedBy: .Equal, toItem: btn_bgcolor, attribute: .Right, multiplier: 1.0, constant: 10)
        v_footer.addConstraint(btn_boldL)
        
        let btn_alignCY = NSLayoutConstraint(item: btn_align, attribute: .CenterY, relatedBy: .Equal, toItem: v_footer, attribute: .CenterY, multiplier: 1.0, constant: 0)
        v_footer.addConstraint(btn_alignCY)
        let btn_alignL = NSLayoutConstraint(item: btn_align, attribute: .Left, relatedBy: .Equal, toItem: btn_bold, attribute: .Right, multiplier: 1.0, constant: 10)
        v_footer.addConstraint(btn_alignL)
        
        let btn_flineCY = NSLayoutConstraint(item: btn_fline, attribute: .CenterY, relatedBy: .Equal, toItem: v_footer, attribute: .CenterY, multiplier: 1.0, constant: 0)
        v_footer.addConstraint(btn_flineCY)
        let btn_flineL = NSLayoutConstraint(item: btn_fline, attribute: .Left, relatedBy: .Equal, toItem: btn_align, attribute: .Right, multiplier: 1.0, constant: 10)
        v_footer.addConstraint(btn_flineL)
        
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
    
    func flineBtnAciton(sender : AnyObject){
        
        if btn_fline.selected == true {
            btn_fline.selected = false
            self.tv_selectd.typingAttributes[NSUnderlineStyleAttributeName] = 0.0
        }else{
            btn_fline.selected = true
            
            self.tv_selectd.typingAttributes[NSUnderlineStyleAttributeName] = 1.0
        }
       
    }
    
    func alignBtnAciton(sender : AnyObject){
     
         self.tv_selectd.textAlignment = .Center
    }
    
    func boldBtnAciton(sender : AnyObject){
        
        if btn_bold.selected == true {
           btn_bold.selected = false
            guard let size = self.tv_selectd.font?.pointSize else { return }
            self.tv_selectd.typingAttributes[NSFontAttributeName] = UIFont.systemFontOfSize(size)
        }else{
           btn_bold.selected = true
            guard let size = self.tv_selectd.font?.pointSize else { return }
           self.tv_selectd.typingAttributes[NSFontAttributeName] = UIFont.boldSystemFontOfSize(size)
        }
        
    }
    
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
        
            let collectionFlowlayout = UICollectionViewFlowLayout()
            collectionFlowlayout.scrollDirection = UICollectionViewScrollDirection.Horizontal
            
            collectionview = UICollectionView(frame: CGRectZero, collectionViewLayout:collectionFlowlayout )
            collectionview.delegate = self
            collectionview.dataSource = self
            collectionview.tag = tagnum + 1
            collectionview.translatesAutoresizingMaskIntoConstraints = false
            collectionview.backgroundColor = UIColor.clearColor()
            v_colorselect?.addSubview(collectionview)
            
            collectionview.registerClass(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "tag")
            
            let collecitonL = NSLayoutConstraint(item: collectionview, attribute: .Left, relatedBy: .Equal, toItem: v_colorselect, attribute: .Left, multiplier: 1.0, constant: 0)
            v_colorselect?.addConstraint(collecitonL)
            let collecitonT = NSLayoutConstraint(item: collectionview, attribute: .Top, relatedBy: .Equal, toItem: v_colorselect, attribute: .Top, multiplier: 1.0, constant: 0)
            v_colorselect?.addConstraint(collecitonT)
            let collecitonB = NSLayoutConstraint(item: collectionview, attribute: .Bottom, relatedBy: .Equal, toItem: v_colorselect, attribute: .Bottom, multiplier: 1.0, constant: 0)
            v_colorselect?.addConstraint(collecitonB)
            let collecitonR = NSLayoutConstraint(item: collectionview, attribute: .Right, relatedBy: .Equal, toItem: v_colorselect, attribute: .Right, multiplier: 1.0, constant: 0)
            v_colorselect?.addConstraint(collecitonR)
            
            
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
                collectionview.tag = tagnum + 1
                
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
        
        cell.delegate = self
     
        cell.tapBlock = { [weak self] in
            
            self?.tv_selectd = cell.textView
          
        }
        
        
        
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

extension ViewController : UICollectionViewDataSource,UICollectionViewDelegate {
 
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        cell = collectionview.dequeueReusableCellWithReuseIdentifier("tag", forIndexPath: indexPath)
        cell.backgroundColor = UIColor.redColor()
    
        
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if collectionview.tag == 101 {

            self.tv_selectd.typingAttributes[NSForegroundColorAttributeName] = UIColor.redColor()
            
            let changeatt = changeAinfo(attribureName: NSForegroundColorAttributeName, attribureValue: UIColor.redColor())
            changeattribute = changeatt
           
        }else{
             self.tv_selectd.typingAttributes[NSBackgroundColorAttributeName] = UIColor.blueColor()
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
          return 0.0
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 5.0
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(30, 30)
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 5, 0, 0)
    }

}

extension ViewController : Tableviewtextdelegate {
    func TableviewtextView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        
        
        
        return true
    }
    func TabletextViewDidChange(textView: UITextView) {
      

    }
}