//
//  ViewController.swift
//  GJ_AutolayoutExtension
//
//  Created by Clement_Gu on 16/8/17.
//  Copyright © 2016年 clement. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        
//        let test = UIButton()
//        test.backgroundColor = UIColor.grayColor()
//        test.setTitle("test", forState: .Normal)
//        view.addSubview(test)
//        let con = GJ_AutoLayoutExtension()
//        con.GJ_contenFillConstraint(test, superView: view)
        
        let view2 = UIView()
        view2.backgroundColor = UIColor.orangeColor()
        view.addSubview(view2)
        let view1 = UIView()
        view1.backgroundColor = UIColor.grayColor()
        view1.translatesAutoresizingMaskIntoConstraints = false
        view2.addSubview(view1)
        
        
//        let width = NSLayoutConstraint.init(item: view1, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 100)
//        let height = NSLayoutConstraint.init(item: view1, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 100)
//        let left = NSLayoutConstraint.init(item: view1, attribute: .Left, relatedBy: .Equal, toItem: view2, attribute: .Left, multiplier: 1, constant: 100)
//        let top = NSLayoutConstraint.init(item: view1, attribute: .Top, relatedBy: .Equal, toItem: view2, attribute: .Top, multiplier: 1, constant: 100)
        let constraint = GJ_AutoLayoutExtension()
        constraint.GJ_contentEqualConstraint(view2, superView: view)
        constraint.GJ_contentOffsetConstraint(view1, superView: view2, constant: <#T##(left: CGFloat, top: CGFloat, right: CGFloat, bottom: CGFloat)#>)
        constraint.GJ_contentOffsetConstraint(view1, superView: view2, constant: (100,150,-100,-230))
        
//        constraint.GJ_contentOffsetConstraint(view1, superView: view2, offsetArr: [100,100,-50,-200])
//        print(view2.translatesAutoresizingMaskIntoConstraints)
//        view2.addConstraints([width,height,left,top])
        
        print(view1.superview == view2)
        
        
        //定义一个元祖
//        var tuples = (first:Int,second:CGFloat,third:String).self
        //赋值
        let num:CGFloat = 2
      var  tuples = (1,num,"3")
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

