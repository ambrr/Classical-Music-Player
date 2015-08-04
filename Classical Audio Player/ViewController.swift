//
//  ViewController.swift
//  Classical Audio Player
//
//  Created by Amber Morris on 2015-08-03.
//  Copyright (c) 2015 Amber Morris. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer = AVAudioPlayer()
    
    
    
    @IBOutlet weak var volumeOutlet: UISlider!
    
    @IBOutlet weak var skipOutlet: UISlider!
    
    @IBAction func volumeChange(sender: AnyObject) {
        
       player.volume = volumeOutlet.value
        
    }
    
    
    @IBAction func skipAudio(sender: AnyObject) {
        
     player.currentTime = NSTimeInterval(skipOutlet.value)
        
    }
    
    @IBAction func pause(sender: AnyObject) {
        
        player.pause()
        
    }
    
    
    @IBAction func play(sender: AnyObject) {
        
        player.play()
        
    }
    
    
    @IBAction func stop(sender: AnyObject) {
        
        player.stop()
        
        player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("bach", ofType: "mp3")!), error: nil)
     
        
    }
    
    func updateSkipSlider() {
        
        skipOutlet.value = Float(player.currentTime)
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("bach", ofType: "mp3")!), error: nil)
        
        //Set the maximum value of the skip slider to equal the duration of the audio file
        skipOutlet.maximumValue = Float(player.duration)
        
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateSkipSlider"), userInfo: nil, repeats: true)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

