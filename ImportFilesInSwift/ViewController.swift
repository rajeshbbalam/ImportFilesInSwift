//
//  ViewController.swift
//  ImportFilesInSwift
//
//  Created by Sandeep Gandra on 29/11/15.
//  Copyright © 2015 SampleApps. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    
    @IBAction func ShowFilesImportPopover(sender: UIButton)
    {
        var fileimportPopupVC:FilesImportPopupViewController = FilesImportPopupViewController()
        fileimportPopupVC.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext
        self.presentViewController(fileimportPopupVC, animated:true, completion: nil)
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

