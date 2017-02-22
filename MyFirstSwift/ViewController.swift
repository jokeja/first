//
//  ViewController.swift
//  MyFirstSwift
//
//  Created by 七 叶 on 16/3/10.
//  Copyright © 2016年 jiaxuhui. All rights reserved.
//

import UIKit


enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}

enum Language:Int{
    case chinese,english,america,spanish,japanese,korea
}

enum Testenum{
    case intEnum(Int,Int,Int)
    case stringEnum(String)
}
enum TestOrienum:NSString{
    case bigA="A"
    case bigB
}


class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var label:UILabel!
    
    var table:UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        let tempVar=Testenum.intEnum(0, 0, 1)
        
        
        switch tempVar {
        case .intEnum(let a, _, _) where a==0:
            print("fitst value is \(a)")
        default:
            print("no match")
        }
        
        
//        let motherLanguage=Language(rawValue: 14)
//        
//        
//        switch motherLanguage! {
//        case .chinese:
//            print("asdasd")
//        default:
//            print("123123123")
//        }
        var aaa:String="adfsdkhfjskdfksd"
        var bbb=aaa
        print("\(bbb)")
        aaa="12312312312313"
        print("\(bbb)")
        
        print("\(TestOrienum.bigB.rawValue)")
        
        
//        for index in 0...1000 {
//            _=Just.post("https://www.baidu.com", timeout: 30, asyncProgressHandler: { (httpProgress:HTTPProgress!) in
//                print(httpProgress)
//                print("asyncProgressHandler\(index)")
//            }) { (httpResult:HTTPResult!) in
//                print(httpResult.error)
//                print("asyncCompleted\(index)")
//            }
//        }
        // Do any additional setup after loading the view, typically from a nib.
        label.removeFromSuperview()
        self.table=UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        self.table!.delegate=self
        self.table!.dataSource=self
        self.view.addSubview(self.table!)
        
        
        let label1=UILabel(frame: CGRect(x: 0,y: 0,width: 0,height: 0))
        label1.text="asdasdsd"
        let labelStr = "The width is"
        let width = 94
        let widthLabel = labelStr + String(width)
        print(widthLabel);
        
        let arr1=[1,2,3]
        let arr2=[1,2,3]
        let arr3=arr1+arr2
        let arr4=arr1*arr2
        
        
        let sortArr = arr1.sorted { (value1, value2) -> Bool in
            return true;
        }
        let mapArr = arr1.map { (value) -> String in
            switch value{
            case 1:
                return "One"
            case 2:
                return "One"
            case 3:
                return "One"
            default :
                return "no"
            }
        }
        
        print("mapArr",mapArr);
        print("sortArr",sortArr);
        
        print("+ override",arr3[0],arr3[1],arr3[2]);
        print("* override",arr4[0],arr4[1],arr4[2]);
        
        
        let vegetable = "red pepper"
        switch vegetable {
        case "celery":
            print("Add some raisins and make ants on a log.")
        case "cucumber", "watercress":
            print("That would make a good tea sandwich.")
        case let x where x.hasSuffix("pepper"):
            print("Is it a spicy \(x)?")
        default:
            print("Everything tastes good in soup.")
        }
        
        let arrss=[1,2,3,35,6,7,2,5235,357,56,34,245,27].sorted{ (n1, n2) -> Bool in
            if(n1>n2){
                return true
            }
            return false
            
        }
        print(arrss)
        
        let firstObj=FirstClass(value: "2233")
//        firstObj.member=12;
        
        if firstObj != nil{
            firstObj!.printNumber()
            let _ = firstObj!.testBlock(firstPa: "sdasd",defaulPa: 445) { (result) in
                print(result)
            }
        }
        
        
        
        let ace = Rank.ace
        let aceRawValue = ace.rawValue
        
        print(aceRawValue)
        
        let datass=repeatItem(12, numberOfTimes: 4)
        
        print(datass)
        
        let `var`=33
        
        print(`var`)
        var possibleInteger: OptionalValue<Int> = .none
        possibleInteger = .some(100)
        print(possibleInteger)
    }
    
    func repeatItem<Item>(_ item: Item, numberOfTimes: Int) -> [Item] {
        var result = [Item]()
        for _ in 0..<numberOfTimes {
            result.append(item)
        }
        return result
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return 100;
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 3;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let scaleVC:ScaleViewController!=ScaleViewController();
        
        self.present(scaleVC, animated: false) { 
            
        }
    }
    
    func redirectAction(_ anyObject:AnyObject) -> Void {
        let preController=AVViewController();
        self.present(preController, animated: false) { 
            
        }
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cellID="cellid"
        
        var cell:UITableViewCell?=tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell==nil{
            cell=UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: cellID)
            let redirectBtn=UIButton(frame: cell!.frame)
            redirectBtn.backgroundColor=UIColor(red: 0, green: 1, blue: 0, alpha: 1)
            redirectBtn.addTarget(self, action:#selector(ViewController.redirectAction(_:)), for:.touchUpInside)
            cell?.addSubview(redirectBtn)
        }
        cell!.backgroundColor=UIColor(colorLiteralRed: 1, green: 0, blue: 0, alpha: 1)
        
        return cell!
    }

}

