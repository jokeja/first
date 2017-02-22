//
//  ScaleViewController.swift
//  MyFirstSwift
//
//  Created by 七 叶 on 16/3/28.
//  Copyright © 2016年 jiaxuhui. All rights reserved.
//


import UIKit

class ScaleViewController: UIViewController,UIScrollViewDelegate {

    var scaleView:UIScrollView!;
    var zoomView:UIView!;
    var endrag=false;
    var firstObj=FirstClass(value: 222)
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.zoomView=UIView(frame: CGRect(x: (self.view.frame.size.width-100)/2,y: 0,width: 100,height: 100));
        self.zoomView.backgroundColor=UIColor(red: 1, green: 0, blue: 0, alpha: 1);
        self.scaleView=UIScrollView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height));
        self.scaleView.backgroundColor=UIColor(red: 1, green: 1, blue:1, alpha: 1);
//        self.scaleView.multipleTouchEnabled=true;
        self.scaleView.delegate=self;
        self.scaleView.maximumZoomScale=3;
        self.scaleView.contentSize=CGSize(width: self.view.frame.size.width, height: 1000)
        self.scaleView.addSubview(self.zoomView);
        self.view.addSubview(self.scaleView);
        firstObj.printNumber()
    }
    override func viewDidLayoutSubviews() {
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.zoomView;
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.endrag=true;
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        self.dismiss(animated: true, completion: nil)
        print(scrollView.contentOffset);
        if(scrollView.contentOffset.y==0){
            self.endrag=false;
        }
        if(self.endrag&&scrollView.contentOffset.y<0){
            self.zoomView.frame=CGRect(x: self.zoomView.frame.origin.x+2.5,y: scrollView.contentOffset.y, width: self.zoomView.frame.size.width-5, height: 100+scrollView.contentOffset.y);
            return;
        }
        if(scrollView.contentOffset.y<0){
            self.zoomView.frame=CGRect(x: self.zoomView.frame.origin.x-2.5,y: scrollView.contentOffset.y, width: self.zoomView.frame.size.width+5, height: 100-scrollView.contentOffset.y);
        }
    }
    
}
