//
//  ViewController.swift
//  Buttons Test
//
//  Created by Joshua Dance on 9/16/17.
//  Copyright © 2017 Joshua Dance. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var upButton: UIButton!
    @IBOutlet weak var downButton: UIButton!
    @IBOutlet weak var counter: UILabel!
    @IBOutlet weak var bottomTableView: UITableView!
    @IBOutlet weak var saveLabel: UILabel!
    var workout: Workout!
    //var counterValue = 0
    var savedWorkouts = ["No saved workouts"]
    var workoutsSaved = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        workout = Workout()
        workout.counterValue = 0
        saveLabel.text = ""
        //this is the data source for the tableview.
        bottomTableView.dataSource = self
        //set this class as the delegate of the tableview
        bottomTableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
//    you don't need this section. by default tables have 1 section
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Since we have only one section, we don’t have to use the variable section.
        return savedWorkouts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = bottomTableView.dequeueReusableCell(withIdentifier: "reuseId")
        
        let text = savedWorkouts[indexPath.row]
        
        cell?.textLabel?.text = text
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        saveButton.wiggleSideways()
        
        saveCount(counter: workout.counterValue)
        workoutsSaved = true
        
        saveButton.setTitle("Saved ✅", for: .normal)
        
        //cast it as a string
        counter.text = String(workout.counterValue)
        
        //don't forget to zero it out.
        workout.counterValue = 0
    }
    
    @IBAction func upButtonTapped(_ sender: Any) {
        upButton.wiggleUp()
        workout.counterValue = workout.counterValue + 1
        //cast it as a string
        counter.text = String(workout.counterValue)
        saveButton.setTitle("Saved 💾", for: .normal)
    }
    
    @IBAction func downButtonTapped(_ sender: Any) {
        if workout.counterValue != 0 {
        workout.counterValue = workout.counterValue - 1
        downButton.wiggleDown()
        } else {
            workout.counterValue = 0
            downButton.wiggleNo()
        }
        
        //cast it as a string
        counter.text = String(workout.counterValue)
        saveButton.setTitle("Saved 💾", for: .normal)
    }
    
    func saveCount(counter: Int) {
        let workoutRecord = generateWorkout()
        
        if workoutsSaved == false {
            savedWorkouts = []
            savedWorkouts.append(workoutRecord)
        } else {
            savedWorkouts.append(workoutRecord)
        }
        
        //don't forget to reload the data
        bottomTableView.reloadData()
        //TODO save the count to CoreData?
        
        saveLabel.text = workoutRecord
    }
    
    func generateWorkout() -> String {
        let currentDateTime = Date()
        
        let dateFormatter = DateFormatter()
        //dateFormatter.timeStyle = .long
        dateFormatter.dateFormat = "MMM d, yyyy - h:mm a"
        
        let workoutRecord = "\(workout.counterValue) pushups at : \(dateFormatter.string(from: currentDateTime))"
        return workoutRecord
    }

}

