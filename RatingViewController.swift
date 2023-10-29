//
//  RatingViewController.swift
//  Meal Rater
//
//  Created by Tien Tran on 10/28/23.
//

import UIKit

protocol RatingDelegate {
func onRatingChanged(data: String)
}

class RatingViewController: UIViewController{
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    
    var delegate: RatingDelegate? = nil
    
    var rating: Int!
    var ratingText: String!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func updateRating(rating: Int){
        
        btn1.isSelected = false
        btn2.isSelected = false
        btn3.isSelected = false
        btn4.isSelected = false
        btn5.isSelected = false
        
        for i in 1...rating{
            switch i{
            case 1:
                btn1.isSelected = true
            case 2:
                btn1.isSelected = true
                btn2.isSelected = true
            case 3:
                btn1.isSelected = true
                btn2.isSelected = true
                btn3.isSelected = true
            case 4:
                btn1.isSelected = true
                btn2.isSelected = true
                btn3.isSelected = true
                btn4.isSelected = true
            case 5:
                btn1.isSelected = true
                btn2.isSelected = true
                btn3.isSelected = true
                btn4.isSelected = true
                btn5.isSelected = true
            default:
                break
            }
        }
        
    }

    @IBAction func btn1Pressed(_ sender: Any) {
        updateRating(rating: 1)
        rating = 1
    }
    
    
    @IBAction func btn2Pressed(_ sender: Any) {
        updateRating(rating: 2)
        rating = 2
    }
    
    
    @IBAction func btn3Pressed(_ sender: Any) {
        updateRating(rating: 3)
        rating = 3
    }
    
    
    @IBAction func btn4Pressed(_ sender: Any) {
        updateRating(rating: 4)
        rating = 4
    }
    
    @IBAction func btn5Pressed(_ sender: Any) {
        updateRating(rating: 5)
        rating = 5
    }
    
    
    @IBAction func cancelBtn(_ sender: Any) {
        btn1.isSelected = false;
        btn2.isSelected = false;
        btn3.isSelected = false;
        btn4.isSelected = false;
        btn5.isSelected = false;
        rating = 0
    }
    
    
    @IBAction func saveBtn(_ sender: Any) {
        ratingText = String(rating)
        if self.delegate != nil && self.ratingText != nil{
            let rate = self.ratingText
            self.delegate?.onRatingChanged(data: rate!)
            dismiss(animated: true, completion: nil)
        }
    }
   

}
