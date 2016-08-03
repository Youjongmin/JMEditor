//
//  TextViewTableViewCell.swift
//  JMEditor
//
//  Created by 에버스터디 on 2016. 8. 3..
//  Copyright © 2016년 eric. All rights reserved.
//

import UIKit

class TextViewTableViewCell: UITableViewCell {

    var textView : UITextView!
    var lb_pacehold : UILabel!

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        
        self.setConfig()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func setConfig(){
        textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.systemFontOfSize(14)
        textView.userInteractionEnabled = true
        textView.autocapitalizationType = .None
        textView.autocorrectionType = .No
        textView.contentMode = .Top
        textView.bounces = false
        textView.editable = true
        textView.tag = 10603321
        //        textView.backgroundColor = UIColor.yellowColor()
        //        textView.contentInset = UIEdgeInsetsMake(0, 8, 0, 0)
        self.contentView.addSubview(textView)
        
        
        let tv_msgT = NSLayoutConstraint(item: textView, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1.0, constant: 0.0)
        self.addConstraint(tv_msgT)
        
        let tv_msgL = NSLayoutConstraint(item: textView, attribute: .Left, relatedBy: .Equal, toItem: self, attribute: .Right, multiplier: 0.02, constant: 0.0)
        self.addConstraint(tv_msgL)
        
        let tv_msgW = NSLayoutConstraint(item: textView, attribute: .Width, relatedBy: .Equal, toItem: self, attribute: .Width, multiplier: 0.96, constant: 0.0)
        self.addConstraint(tv_msgW)
        
        let tv_msgB = NSLayoutConstraint(item: textView, attribute: .Bottom, relatedBy: .Equal, toItem: self, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        self.addConstraint(tv_msgB)
        
//        lb_pacehold = UILabel()
//        lb_pacehold.translatesAutoresizingMaskIntoConstraints = false
//        lb_pacehold.font = UIFont.systemFontOfSize(14)
//        lb_pacehold.text = "내용을 입력하세요."
//        lb_pacehold.textColor = UIColor(red: 169/255, green: 169/255, blue: 169/255, alpha: 1.0)
//        lb_pacehold.tag = 1060331
//        self.addSubview(lb_pacehold)
//        
//        
//        let lb_paceholdCY = NSLayoutConstraint(item: lb_pacehold, attribute: .Top, relatedBy: .Equal, toItem: textView, attribute: .Top, multiplier: 1.0, constant: 8.0)
//        self.addConstraint(lb_paceholdCY)
//        
//        let lb_paceholdL = NSLayoutConstraint(item: lb_pacehold, attribute: .Left, relatedBy: .Equal, toItem: textView, attribute: .Right, multiplier: 0.02, constant: 0.0)
//        self.addConstraint(lb_paceholdL)
        
    }

}
