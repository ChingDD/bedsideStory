//
//  ViewController.swift
//  bedsideStory
//
//  Created by 林仲景 on 2023/3/2.
//

import UIKit
import AVFAudio
class ViewController: UIViewController {

    @IBOutlet weak var LabelText: UILabel!
    @IBOutlet weak var stationary: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var cookingUtensil: UITextField!
    @IBOutlet weak var liquid: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var conclusion: UITextView!
    let speaker = AVSpeechSynthesizer()
    
    //鍵盤收起來的指令
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //view的背景色
        view.backgroundColor = UIColor(red: 254/255, green: 174/255, blue: 81/255, alpha: 1)
    }

    @IBAction func TellTheStory(_ sender: Any) {
        //字稿
        
        let storyScript = "有一天，\(name.text!)發現一隻史前大蟑螂，長度目測可能比\(stationary.text!)還長。蟑螂慢悠悠的在牆角散步，\(name.text!)想趁蟑螂沒防備時打死牠，便隨手操起\(cookingUtensil.text!)如驟雨般落下，但見蟑螂冷笑一聲，踩著步伐輕鬆躲過，眼見物理攻擊無效，便使用\(liquid.text!)執行範圍掃射，蟑螂被嚇了個螂吃屎，轉頭看了\(name.text!)一眼後離開。隔天，\(name.text!)打開房門，看了到眼前的景色後驚呆了，千千萬萬個蟑螂恭候\(name.text!)的到來。後來有個諺語流傳至今："
        let storyConclusion = "螂若回頭，不是報恩，便是報仇"
        //將字稿存入textView的屬性text裡
        textView.text = storyScript
        //將字稿存入conclusion的屬性text裡
        conclusion.text = storyConclusion
        //設定conclusion的字體
        conclusion.font = UIFont.boldSystemFont(ofSize: 16)
        //將故事前的開頭語存入空字串
        LabelText.text = ""
        //語音
        let utterance = AVSpeechUtterance(string: storyScript+storyConclusion)
        utterance.volume = 0.5
        utterance.rate = 0.5
        utterance.pitchMultiplier = 1
        utterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        speaker.speak(utterance)
        
        
    }
    
    }
    
