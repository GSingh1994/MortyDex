//
//  LocationDetailsViewController.swift
//  MortyDex
//
//  Created by Gagan on 2023-02-28.
//

import UIKit

class LocationDetailsViewController: UIViewController {

    var currentSelection: Location?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = currentSelection?.name
    }

}
