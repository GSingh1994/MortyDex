//
//  DetailsViewController.swift
//  MortyDex
//
//  Created by Gagan on 2023-02-27.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var characterNameLabel: UILabel!
    
    var characterNameValue: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        characterNameLabel.text = characterNameValue
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

