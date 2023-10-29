//
//  ViewController.swift
//  Meal Rater
//
//  Created by Tien Tran on 10/27/23.
//

import UIKit
import CoreData



class ViewController: UIViewController, RatingDelegate, UITextFieldDelegate  {

    @IBOutlet weak var rating: UILabel!
    var ratingDouble: Double!
    
    @IBOutlet weak var restName: UITextField!
    @IBOutlet weak var dish: UITextField!
    
    var currentRating: Ratings?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        
        let context = appDelegate.persistentContainer.viewContext
            currentRating = Ratings(context: context)
        
        
        currentRating?.meal = dish.text
        currentRating?.restaurantName = restName.text
        currentRating?.rate = Double(rating.text ?? "0.0")!
        appDelegate.saveContext()
        
        restName.text?.removeAll()
        dish.text?.removeAll()
        rating.text?.removeAll()
        
    }
    
    
    func onRatingChanged(data: String){
        self.rating!.text = data
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "DisplayRating" {
                let secondVC: RatingViewController = segue.destination as! RatingViewController
                secondVC.delegate = self
            }
        }
   
}


