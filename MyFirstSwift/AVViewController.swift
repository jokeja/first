//
//  AVViewController.swift
//  MyFirstSwift
//
//  Created by 七 叶 on 16/5/30.
//  Copyright © 2016年 jiaxuhui. All rights reserved.
//

import UIKit
import AVFoundation

class AVViewController: UIViewController {

    var avPlayer:AVPlayer?
    
    var playLayer:AVPlayerLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let playerItem=AVPlayerItem(url: URL(fileURLWithPath: "https://www.iqiyi.com/common/flashplayer/20160526/1322f98c2359.swf"))
        
        self.avPlayer=AVPlayer(playerItem: playerItem)
        self.playLayer=AVPlayerLayer(player: self.avPlayer)
        self.playLayer?.frame=self.view.frame
        self.view.layer.addSublayer(self.playLayer!)
        self.avPlayer?.play()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
