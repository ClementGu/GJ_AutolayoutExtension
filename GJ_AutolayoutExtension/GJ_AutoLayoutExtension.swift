
//
//  GJ_AutoLayoutExtension.swift
//  GJ_AutolayoutExtension
//
//  Created by Clement_Gu on 16/8/17.
//  Copyright © 2016年 clement. All rights reserved.
//


//1.子view的约束在父view上添加都可以生效的
//2.这个约束类创建一次可以一直用的
import UIKit

class GJ_AutoLayoutExtension: NSObject {
    /**
     封装执行约束操作的判断及执行
     
     - parameter constraint: 约束数组
     - parameter addView:    添加约束的view
     */
    private func constraintActive(constraint:[NSLayoutConstraint],addView:UIView)
    {
    
        //判断版本
        if #available(iOS 8.0, *) {
            NSLayoutConstraint.activateConstraints(constraint)
        } else {
            // Fallback on earlier versions
            addView.addConstraints(constraint)
        }

    }
    //设置view的宽 高  或 宽高
    enum setSize {
        case width
        case height
        case both
    }
    
    /**
     设置view的宽高
     
     - parameter targetView:  目标视图
     - parameter setSizeType: 设置的属性
     - parameter constant:    数值这边用的是元祖
     */
    func GJ_SetHeightWithConstraint(targetView:UIView,setSizeType:setSize,constant:(width:CGFloat,height:CGFloat))
    {
        switch setSizeType {
        case .width:
            let width = NSLayoutConstraint.init(item: targetView, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: constant.width)
            constraintActive([width], addView: targetView)
        case .height:
            let height = NSLayoutConstraint.init(item: targetView, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: constant.height)
            constraintActive([height], addView: targetView)
        case .both:
             let width = NSLayoutConstraint.init(item: targetView, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: constant.width)
             let height = NSLayoutConstraint.init(item: targetView, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: constant.height)
            constraintActive([width,height], addView: targetView)
        default:
            break
        }
        
        
        
    }
    
    /**
     添加子视图填充到父视图的约束
     
     - parameter subView:   子视图
     - parameter superView: 父视图
     */
    func GJ_contentEqualConstraint(subView:UIView,superView:UIView)
    {
        //取消子视图的autoresizing
        subView.translatesAutoresizingMaskIntoConstraints = false
        let left = NSLayoutConstraint.init(item: subView, attribute: .Leading, relatedBy: .Equal, toItem: superView, attribute: .Leading, multiplier: 1, constant: 0)
        let top = NSLayoutConstraint.init(item: subView, attribute: .Top, relatedBy: .Equal, toItem: superView, attribute: .Top, multiplier: 1, constant: 0)
        let right = NSLayoutConstraint.init(item: subView, attribute: .Trailing, relatedBy: .Equal, toItem: superView, attribute: .Trailing, multiplier: 1, constant: 0)
        let bottom = NSLayoutConstraint.init(item: subView, attribute: .Bottom, relatedBy: .Equal, toItem: superView, attribute: .Bottom, multiplier: 1, constant: 0)
        
        constraintActive([left,top,right,bottom], addView: superView)
//        //判断版本
//        if #available(iOS 8.0, *) {
//            NSLayoutConstraint.activateConstraints([left,top,right,bottom])
//        } else {
//            // Fallback on earlier versions
//            superView.addConstraints([left,top,right,bottom])
//        }
        
    }
    
    /**
     添加子视图相对父视图相对位置约束
     
     - parameter subView:   子视图
     - parameter superView: 父视图
     - parameter offsetArr: 相对父视图左上右下的偏移量
     */
    func GJ_contentOffsetConstraint(subView:UIView,superView:UIView,constant:(left:CGFloat,top:CGFloat,right:CGFloat,bottom:CGFloat))
    {
        //取消子视图的autoresizing
        subView.translatesAutoresizingMaskIntoConstraints = false
        let left = NSLayoutConstraint.init(item: subView, attribute: .Leading, relatedBy: .Equal, toItem: superView, attribute: .Leading, multiplier: 1, constant: constant.left)
        let top = NSLayoutConstraint.init(item: subView, attribute: .Top, relatedBy: .Equal, toItem: superView, attribute: .Top, multiplier: 1, constant: constant.top)
        let right = NSLayoutConstraint.init(item: subView, attribute: .Trailing, relatedBy: .Equal, toItem: superView, attribute: .Trailing, multiplier: 1, constant: constant.right)
        let bottom = NSLayoutConstraint.init(item: subView, attribute: .Bottom, relatedBy: .Equal, toItem: superView, attribute: .Bottom, multiplier: 1, constant: constant.bottom)
        
        constraintActive([left,top,right,bottom], addView: superView)
//        //判断版本
//        if #available(iOS 8.0, *) {
//            NSLayoutConstraint.activateConstraints([left,top,right,bottom])
//        } else {
//            // Fallback on earlier versions
//            superView.addConstraints([left,top,right,bottom])
//        }
        
    }

    /**
     子视图相对于父视图的中心点的位置
     
     - parameter subView:   子视图
     - parameter superView: 父视图
     - parameter offsetArr: 中心点 x y 的偏移量
     */
    func GJ_contentCenterPonitConstraint(subView:UIView,superView:UIView,constant:(CenterX:CGFloat,CenterY:CGFloat))
    {
        //取消子视图的autoresizing
        subView.translatesAutoresizingMaskIntoConstraints = false
        let centerX = NSLayoutConstraint.init(item: subView, attribute: .CenterX, relatedBy: .Equal, toItem: superView, attribute: .CenterX, multiplier: 1, constant: constant.CenterX)
        let centerY = NSLayoutConstraint.init(item: subView, attribute: .CenterY, relatedBy: .Equal, toItem: superView, attribute: .CenterY, multiplier: 1, constant: constant.CenterY)
        
        constraintActive([centerX,centerY], addView: superView)
//        //判断版本
//        if #available(iOS 8.0, *) {
//            NSLayoutConstraint.activateConstraints([centerX,centerY])
//        } else {
//            // Fallback on earlier versions
//            superView.addConstraints([centerX,centerY])
//        }
    
    }
    /**
     定义视图的尺寸等于参照视图
     
     - parameter baseView:   参照视图
     - parameter followView: 定义视图
     */
    func GJ_contentEqualWidthHeightConstraint(followView:UIView,baseView:UIView)
    {
        //取消约束视图的autoresizing
//        baseView.translatesAutoresizingMaskIntoConstraints = false
        followView.translatesAutoresizingMaskIntoConstraints = false

        let width = NSLayoutConstraint.init(item: followView, attribute: .Width, relatedBy: .Equal, toItem: baseView, attribute: .Width, multiplier: 1, constant: 0)
    
        let height = NSLayoutConstraint.init(item: followView, attribute: .Height, relatedBy: .Equal, toItem: baseView, attribute: .Height, multiplier: 1, constant: 0)
        
        constraintActive([width,height], addView: followView)
//        //判断版本
//        if #available(iOS 8.0, *) {
//            NSLayoutConstraint.activateConstraints([width,height])
//        } else {
//            // Fallback on earlier versions
//            followView.addConstraints([width,height])
//        }
//    
    
    }
    
    /**
     创建方向类型的枚举
     
     - left:   左
     - right:  右
     - top:    上
     - bottom: 下
     */
    enum  GJ_alignType {
        case left
        case right
        case top
        case bottom
    }
    
    
    /**
     根据baseView的位置来进行左右上下对齐用枚举来判断对齐的方向
     
     - parameter baseView:       参照视图
     - parameter followView:     定位视图
     - parameter alignType:      对齐的边
     - parameter distanceToBase: 距离对齐视图的距离 左右对齐距离为上下 上下对齐距离为左右
     
     //这边没有设定其其他两个约束 是考虑到其他两个约束可能是宽高  或者 与父视图的距离
     */
    func GJ_contentAlignmentConstraint(followView:UIView,baseView:UIView,alignType:GJ_alignType,distanceToBase:CGFloat)
    {
        //判断对齐方式
        switch alignType {
        case .left:
            let alignLeft = NSLayoutConstraint.init(item: followView, attribute: .Leading, relatedBy: .Equal, toItem: baseView, attribute: .Leading, multiplier: 1, constant: 0)
            let top = NSLayoutConstraint.init(item: followView, attribute: .Top, relatedBy: .Equal, toItem: baseView, attribute: .Bottom, multiplier: 1, constant: distanceToBase)
            
            constraintActive([alignLeft,top], addView: followView)
            
        case .top:
            let alignTop = NSLayoutConstraint.init(item: followView, attribute: .Top, relatedBy: .Equal, toItem: baseView, attribute: .Top, multiplier: 1, constant: 0)
            let left = NSLayoutConstraint.init(item: followView, attribute: .Leading, relatedBy: .Equal, toItem: baseView, attribute: .Trailing, multiplier: 1, constant: distanceToBase)
            
            constraintActive([alignTop,left], addView: followView)
            
        case .right:
            let alignRight = NSLayoutConstraint.init(item: followView, attribute: .Trailing, relatedBy: .Equal, toItem: baseView, attribute: .Trailing, multiplier: 1, constant: 0)
            let top = NSLayoutConstraint.init(item: followView, attribute: .Top, relatedBy: .Equal, toItem: baseView, attribute: .Bottom, multiplier: 1, constant: distanceToBase)
            
            constraintActive([alignRight,top], addView: followView)
            
        case .bottom:
            let alignBottom = NSLayoutConstraint.init(item: followView, attribute: .Bottom, relatedBy: .Equal, toItem: baseView, attribute: .Bottom, multiplier: 1, constant: 0)
            let left = NSLayoutConstraint.init(item: followView, attribute: .Leading, relatedBy: .Equal, toItem: baseView, attribute: .Trailing, multiplier: 1, constant: distanceToBase)
            
            constraintActive([alignBottom,left], addView: followView)
            
        default: break
            
        }
        
        
    }
    /**
     这边是对对齐后的与其他参照view的距离的约束
     
     - parameter followView:  约束视图
     - parameter baseView:    参照视图
     - parameter alignType:   对齐方式
     - parameter constantArr: 按顺时针的距离 左对齐上对齐 是右下 右对齐是坐下 下对齐是上右
     //默认参照view是在原view的左右的 当然一般左右的情况用的比较多
     
     */
    func GJ_contentAlignmentAssistConstraint(followView:UIView,baseView:UIView,alignType:GJ_alignType,constant:(first:CGFloat,second:CGFloat))
    {
        //判断baseview是并列view还是父view还是子view
        if baseView.superview != followView
        {
            var isSuperView:Bool = Bool(followView.superview == baseView)
            
            
            
            switch alignType {
            case .left:
                
                if isSuperView == true
                {
                    let right = NSLayoutConstraint.init(item: followView, attribute: .Trailing, relatedBy: .Equal, toItem: baseView, attribute: .Trailing, multiplier: 1, constant: constant.first)
                    let bottom = NSLayoutConstraint.init(item: followView, attribute: .Bottom, relatedBy: .Equal, toItem: baseView, attribute: .Bottom, multiplier: 1, constant: constant.second)
                    //如果是父视图约束加在父视图上
                     constraintActive([right,bottom], addView: baseView)
                    
                }
                else
                {
                    let right = NSLayoutConstraint.init(item: followView, attribute: .Trailing, relatedBy: .Equal, toItem: baseView, attribute: .Leading, multiplier: 1, constant: constant.first)
                     let bottom = NSLayoutConstraint.init(item: followView, attribute: .Bottom, relatedBy: .Equal, toItem: baseView, attribute: .Bottom, multiplier: 1, constant: constant.second)
                    //如果不是父视图约束加载自己身上
                     constraintActive([right,bottom], addView: followView)
                    
                }
               
                
               
                
            case .top:
                
                if isSuperView == true
                {
                    let right = NSLayoutConstraint.init(item: followView, attribute: .Trailing, relatedBy: .Equal, toItem: baseView, attribute: .Trailing, multiplier: 1, constant: constant.first)
                    let bottom = NSLayoutConstraint.init(item: followView, attribute: .Bottom, relatedBy: .Equal, toItem: baseView, attribute: .Bottom, multiplier: 1, constant: constant.second)
                    //如果是父视图约束加在父视图上
                    constraintActive([right,bottom], addView: baseView)
                    
                }
                else
                {
                    let right = NSLayoutConstraint.init(item: followView, attribute: .Trailing, relatedBy: .Equal, toItem: baseView, attribute: .Leading, multiplier: 1, constant: constant.first)
                    let bottom = NSLayoutConstraint.init(item: followView, attribute: .Bottom, relatedBy: .Equal, toItem: baseView, attribute: .Bottom, multiplier: 1, constant: constant.second)
                    //如果不是父视图约束加载自己身上
                    constraintActive([right,bottom], addView: followView)
                    
                }

                
                
            case .right:
                
                if isSuperView == true
                {
                    let left = NSLayoutConstraint.init(item: followView, attribute: .Leading, relatedBy: .Equal, toItem: baseView, attribute: .Leading, multiplier: 1, constant: constant.first)
                    let bottom = NSLayoutConstraint.init(item: followView, attribute: .Bottom, relatedBy: .Equal, toItem: baseView, attribute: .Bottom, multiplier: 1, constant: constant.second)
                    //如果是父视图约束加在父视图上
                    constraintActive([left,bottom], addView: baseView)
                    
                }
                else
                {
                    let left = NSLayoutConstraint.init(item: followView, attribute: .Leading, relatedBy: .Equal, toItem: baseView, attribute: .Trailing, multiplier: 1, constant: constant.first)
                    let bottom = NSLayoutConstraint.init(item: followView, attribute: .Bottom, relatedBy: .Equal, toItem: baseView, attribute: .Bottom, multiplier: 1, constant: constant.second)
                    //如果不是父视图约束加载自己身上
                    constraintActive([left,bottom], addView: followView)
                    
                }

                
            case .bottom:
                if isSuperView == true
                {
                   
                    let top = NSLayoutConstraint.init(item: followView, attribute: .Top, relatedBy: .Equal, toItem: baseView, attribute: .Top, multiplier: 1, constant: constant.first)
                     let right = NSLayoutConstraint.init(item: followView, attribute: .Trailing, relatedBy: .Equal, toItem: baseView, attribute: .Trailing, multiplier: 1, constant: constant.second)
                    //如果是父视图约束加在父视图上
                    constraintActive([top,right], addView: baseView)
                    
                }
                else
                {
                    
                    let top = NSLayoutConstraint.init(item: followView, attribute: .Top, relatedBy: .Equal, toItem: baseView, attribute: .Top, multiplier: 1, constant: constant.first)
                    let right = NSLayoutConstraint.init(item: followView, attribute: .Trailing, relatedBy: .Equal, toItem: baseView, attribute: .Leading, multiplier: 1, constant: constant.second)
                    //如果不是父视图约束加载自己身上
                    constraintActive([top,right], addView: followView)
                    
                }
                

            default:
                break
            }
   
        }
        
    }
    
    
}
