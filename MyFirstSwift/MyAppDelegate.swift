//
//  MyAppDelegate.swift
//  MyFirstSwift
//
//  Created by 七 叶 on 16/3/10.
//  Copyright © 2016年 jiaxuhui. All rights reserved.
//

import Foundation
import UIKit
@UIApplicationMain
class MyAppDelegate:UIResponder,UIApplicationDelegate{
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let twoDArray=[[3,2],[4,3],[2,3],[3,4]]//2dArray
        let number=30//number
        var aisleSeats = Array<Array<Any>>();
        var midSeats = Array<Array<Any>>();
        var winSeats = Array<Array<Any>>();
        var maxRow=0//最大行数
        
        var result=Array<NSMutableArray>()
        
        for index in 0..<twoDArray.count {
            let rows=twoDArray[index][1]
            if rows>maxRow {
                maxRow=rows
            }
        }
        
        for index in 0..<twoDArray.count {
            let colums=twoDArray[index][0]
            let rows=twoDArray[index][1]
            let area=NSMutableArray()
            for _ in 0..<rows{
                let rowArr=NSMutableArray()
                for _ in 0..<colums{
                    rowArr.add("0")
                }
                area.add(rowArr)
            }
            result.append(area)
        }
        
        //分组座位类型，标记区域，行列
        for row in 0..<maxRow{
            for index in 0..<twoDArray.count {
                let colums=twoDArray[index][0]
                let rows=twoDArray[index][1]
                if(row>=rows){
                    continue;
                }
                if(index==0){
                    aisleSeats.append([index,row,colums-1,""])
                    winSeats.append([index,row,0,""])
                }
                else if(index==twoDArray.count-1){
                    aisleSeats.append([index,row,0,""])
                    winSeats.append([index,row,colums-1,""])
                }
                else{
                    aisleSeats.append([index,row,0,""])
                    aisleSeats.append([index,row,colums-1,""])
                }
                if(colums>2){
                    for n in 1..<(colums-1) {
                        midSeats.append([index,row,n,""])
                    }
                }
                
            }
        }
        //根据number 排列
        for m in 0...number{
            var arr:Array<Any>
            var areaIndex=0
            var areaRow=0
            var areaColum=0
            let aisle=m
            if(m<aisleSeats.count){
                arr=aisleSeats[aisle]
                
                areaIndex=(Int)(arr[0]  as! NSNumber)
                areaRow=(Int)(arr[1] as! NSNumber)
                areaColum=(Int)(arr[2] as! NSNumber)
                arr[3]="\(m+1)"
                (result[areaIndex][areaRow] as AnyObject).replaceObject(at:areaColum, with: "\(m+1)")
            }
            else if(m>=aisleSeats.count&&m<aisleSeats.count+winSeats.count){
                let win=m-aisleSeats.count
                
                arr=winSeats[win]
                areaIndex=(Int)(arr[0] as! NSNumber)
                areaRow=(Int)(arr[1] as! NSNumber)
                areaColum=(Int)(arr[2] as! NSNumber)
                arr[3]="\(m+1)"
                (result[areaIndex][areaRow] as AnyObject).replaceObject(at:areaColum, with: "\(m+1)")
                
            }
            else if(m>=winSeats.count+aisleSeats.count-1){
                let mid=m-aisleSeats.count-winSeats.count
                
                arr=midSeats[mid]
                areaIndex=(Int)(arr[0] as! NSNumber)
                areaRow=(Int)(arr[1] as! NSNumber)
                areaColum=(Int)(arr[2] as! NSNumber)
                arr[3]="\(m+1)"
                (result[areaIndex][areaRow] as AnyObject).replaceObject(at:areaColum, with: "\(m+1)")
            }
            
        }
        
        var outPut:String=""
        //输出
        for row in 0..<maxRow{
            for index in 0..<twoDArray.count {
                let colums=twoDArray[index][0]
                let rows=twoDArray[index][1]
                if(row>=rows){
                    for _ in 0..<colums{
                        outPut+="   "
                    }
                }
                else{
                    let rowArr:NSArray=result[index][row] as! NSArray
                    for n in 0..<rowArr.count{
                        let colum=rowArr[n]
                        outPut+="\(colum) "
                    }
                }
                outPut+=" "
            }
            outPut+="\n"
        }
        
        print(outPut)
        
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}
