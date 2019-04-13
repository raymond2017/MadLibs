//
//  ViewController.swift
//  MadLibs
//
//  Created by Raymond on 4/13/19.
//  Copyright © 2019 Raymond. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    fileprivate enum VoiceRate:Int{
        case slow
        case normal
        case fast
        
        var speed:Float{
            switch self{
            case .slow:
                    return 60
            case .normal:
                    return 176
            case .fast:
                    return 360
            }
        }
    }
    
    @IBOutlet var phraseTextView: NSTextView!
    @IBOutlet weak var pluralNonuPopup: NSPopUpButton!
    @IBOutlet weak var myCombox: NSComboBox!
    @IBOutlet weak var pastTenseVerbTextField: NSTextField!
    
    let singularNouns = ["dog", "muppet", "ninja", "pirate", "dev" ]
    let pluralNouns = ["tacos", "rainbows", "iPhones", "gold coins"]
    fileprivate let synth = NSSpeechSynthesizer()
    
    fileprivate func readSentence(_ sentence: String, rate: VoiceRate ) {
        synth.rate = rate.speed
        synth.stopSpeaking()
        synth.startSpeaking(sentence)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        pastTenseVerbTextField.stringValue="ate"

        myCombox.removeAllItems()
        myCombox.addItems(withObjectValues: singularNouns)
        myCombox.selectItem(at: singularNouns.count-1)
        
        pluralNonuPopup.removeAllItems()
        pluralNonuPopup.addItems(withTitles: pluralNouns)
        pluralNonuPopup.selectItem(at: 0)
        
        phraseTextView.string = "Me coding Mac Apps!!!"
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func goButtonClicked(_ sender: Any) {
        let pastTenseVerb = pastTenseVerbTextField.stringValue
        let singulaNonu = myCombox.stringValue
        let pluralNoun = pluralNouns[pluralNonuPopup.indexOfSelectedItem]
        let phrase = phraseTextView.string
        
        let madLibSentence = "A \(singulaNonu) \(pastTenseVerb) \(pluralNoun) and said, \(phrase)!"
        print("\(madLibSentence)")
        readSentence(madLibSentence, rate: .normal)
    }


}

