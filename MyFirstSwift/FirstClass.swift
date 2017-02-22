//
//  FirstClass.swift
//  MyFirstSwift
//
//  Created by 七 叶 on 16/3/10.
//  Copyright © 2016年 jiaxuhui. All rights reserved.
//

import Foundation


func *(left:[Int],right:[Int])->[Int]{
    var sum=[Int]()
    assert(left.count==right.count, "please call this operate for the same count array")
    
    for x in 0..<left.count {
        sum.append(left[x]*right[x])
    }
    return sum
}

func +(left:[Int],right:[Int])->[Int]{
    var sum=[Int]()
    assert(left.count==right.count, "please call this operate for the same count array")
    
    //    for var x=0;x<left.count;x++ {
    //        sum.append(left[x]+right[x])
    //    }
    
    for (key,value) in left.enumerated(){
        print(key,value);
        sum.append(left[key]+right[key])
    }
    
    for s in left.enumerated(){
        print(s.offset,s.element)
    }
    
    return sum
}



enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

class FirstClass {
    
    private var number=1
    
    let secondClass=SecondClass()
    
    init(){
    }
    
    init(value:Int){
        self.number=value
    }
    
    init?(value:String) {
        if let num = Int(value){
            number=num
        }
        else{
            return nil
        }
//        Number(value)
        
//        self.number=value
    }
    
    func printNumber(){
        print(self.number)
    }
    
    func testBlock(firstPa:String,defaulPa:Int=2, thisIsBlock:(String)->Void) -> Void {
        thisIsBlock(firstPa+"\(defaulPa)")
        
    }
    
    deinit {
        print("this \(object_getClassName(self)) \(#function) been called in \(#line)")
    }
    
}






