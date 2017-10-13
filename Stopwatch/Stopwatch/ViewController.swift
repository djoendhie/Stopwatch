//
//  ViewController.swift
//  Stopwatch
//
//  Created by SMK IDN MI on 10/10/17.
//  Copyright © 2017 Be Dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // deklarasi variable Counter strikerr
    var counter = 0.0
    // deklarasi Timer
    var timer = Timer()
    // deklarasi is playing
    var isPlaying = false
    
    @IBOutlet weak var labelTimer: UILabel!
    @IBOutlet weak var labelStart: UIButton!
    @IBOutlet weak var labelPause: UIButton!
    @IBOutlet weak var labelStop: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //menampilkan teks ke labelTimer
        labelTimer.text = String(counter)
        //agar button pause tidak aktif
        labelPause.isEnabled = false
    }
    
    @IBAction func btnStart(_ sender: Any) {
        //mengecek apakah sedang playing atau tdk
        if (isPlaying){
            return
        }
        //btn start tdk aktif
        labelStart.isEnabled = false
        //btn pause aktif
        labelPause.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        //mengatur isplaying nya true
        isPlaying = true
        
        
    }
    
    func UpdateTimer(){
        
        //mengatur counter nya ditambah 0.1
        counter = counter + 0.1
        //menampilkan k label timer
        //%.1f ini adalah format untk bilangan berkoma atau float
        //%.1d ini adalah format untk bilanga ril atau tdk ber ,
        labelTimer.text = String(format: "%.1f" , counter)
    
    }
    
    @IBAction func btnPause(_ sender: Any) {
        // agar button start aktiffffff
        labelStart.isEnabled = true
        //agar btn pause tdk aktif
        labelPause.isEnabled = false
        //menampilkan data yg valid
        
        timer.invalidate()
        //mengatur isplaying false
        isPlaying = false
    }
    @IBAction func btnStop(_ sender: Any) {
        //agar btn start aktif
        labelStart.isEnabled = true
        //agar btn pause tdk aktif
        labelPause.isEnabled = false
        //menampilkan data yg valid
        timer.invalidate()
        //mengatur isplaying false
        isPlaying = false
        //mengatur counter jadi 0 kembali
        counter = 0.0
        //mnampilkan timer k lable
        //fungsi dari string(counter) adalah mengubah nilai decimal counter k dalam bntuk string
        labelTimer.text = String(counter)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

