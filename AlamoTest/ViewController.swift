//
//  ViewController.swift
//  AlamoTest
//
//  Created by Hideaki KAWAI on 2017/01/28.
//  Copyright © 2017年 Test. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var aImageView: UIImageView!
    @IBOutlet weak var aImageViewHiehgtConstraint: NSLayoutConstraint!

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.text = "https://d1l0ymoeaox3e3.cloudfront.net/2016/10/11/09/15/35/a7e110de-48fc-4342-aacc-9b2afc840174/mig.jpg"
        textField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        downloadImage()
        return false
    }

    func downloadImage() {
        if let url = textField.text {
            Alamofire.request(url).responseImage { response in
                debugPrint(response)
                
                print(response.request)
                print(response.response)
                debugPrint(response.result)
                
                if let image = response.result.value {
                    print("image downloaded: \(image)")
                    self.aImageView.image = image
                    self.aImageViewHiehgtConstraint.constant =
                        self.aImageView.bounds.width * image.size.height / image.size.width
                }
            }
        }
    }

}

