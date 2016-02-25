//
//  DetailViewController.swift
//  Plain Ol' Notes
//
//  Created by LDC on 9/2/15.
//  Copyright © 2015 LDC. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet var detailGratefulOne: UITextField!
    
    
    

    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if objects.count == 0 {
            return
        }
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        detailViewController = self
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        //enter detail description info here if you want that to update
       // detailGratefulOne.setValue(detailGratefulOne.text, forKey: kNotes)
        saveAndUpdate()
    }

    func saveAndUpdate(){
        masterView?.save()
        masterView?.tableView.reloadData()
    }

}

