//
//  SecondClass.swift
//  MyFirstSwift
//
//  Created by jasuho on 04/11/2016.
//  Copyright © 2016 jiaxuhui. All rights reserved.
//

import Foundation

class SecondClass{
    
    deinit {
        print("this \(NSStringFromClass(SecondClass.self)) \(#function) been called in \(#line)")
    }
    
}
