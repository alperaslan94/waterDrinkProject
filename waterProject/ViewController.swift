//
//  ViewController.swift
//  waterProject
//
//  Created by Alperaslan on 22.10.2023.
//

import UIKit
import UserNotifications





class ViewController: UIViewController {

    
    @IBOutlet weak var waterLabel: UILabel!
    
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var waterIntake: Int = 0
    

    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        waterLabel.text = "Günlük Su Tüketimi: \(waterIntake) Bardak"
        welcomeLabel.text = "Hoş geldiniz! Bu uygulama su içmeyi hatırlatır.Uzmanlar erkeklerin günde 15,5 bardak, kadınların ise 11,5 bardak su tüketmesini öneriyor."

          DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
              // 3 saniye sonra metni gizle
              self.welcomeLabel.isHidden = true
          }
    }
   
    
    @IBAction func drinkWater(_ sender: UIButton) {
        
        waterIntake += 1
        waterLabel.text = "Günlük Su Tüketimi: \(waterIntake) Bardak"
        
    }
     

    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Su İçme Zamanı!"
        content.body = "Bir bardak su içme zamanı geldi."
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60 * 60, repeats: true)
        
        let request = UNNotificationRequest(identifier: "waterReminder", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    

}

