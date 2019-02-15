//
//  ViewController.swift
//  BYHUB_Swift
//
//  Created by xby023 on 2019/1/31.
//  Copyright © 2019 com.jglist. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    @IBAction func successForBtn(_ sender: UIButton) {
       BYHUB.BYHUBManager.showSuccessHUB(info: "Success!")
    }
    
    @IBAction func errorForBtn(_ sender: UIButton) {
       BYHUB.BYHUBManager.showErrorHUB(info: "Error,Try Again")
    }
    
    @IBAction func meesageForBtn(_ sender: UIButton) {
       BYHUB.BYHUBManager.showMessageHUB(info: "Early to bed, early to rise makes a man healthy, wealthy and wise")
    }
    
    @IBAction func loadingForBtn(_ sender: UIButton) {
       BYHUB.BYHUBManager.showLoadingHUB(info: "Loading...")
       BYHUB.BYHUBManager.hiddenHUB(deadline: DispatchTime.now() + 2)
    }
}

