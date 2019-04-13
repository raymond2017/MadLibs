//
//  ViewController.swift
//  MadLibs
//
//  Created by Raymond on 4/13/19.
//  Copyright © 2019 Raymond. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var pastTenseVerbTextField: NSTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("App load.")
        // Do any additional setup after loading the view.
        pastTenseVerbTextField.stringValue="ate ate ate..."
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

