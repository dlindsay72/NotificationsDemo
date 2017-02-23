//
//  ViewController.swift
//  NotificationsDemo
//
//  Created by Dan Lindsay on 2017-02-23.
//  Copyright © 2017 Dan Lindsay. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scheduleNotification()
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "10 second notification demo"
        content.subtitle = "From Treehouse"
        content.body = "Notification after 10 seconds - Your alert is ready!"
        content.badge = 1
        content.sound = UNNotificationSound(named: "gong.aif")
        content.userInfo = ["id": 42]
        
        
        let imageURL = Bundle.main.url(forResource: "treehouse", withExtension: "jpg")
        let attachment = try! UNNotificationAttachment(identifier: "treehouse.jpg", url: imageURL!, options: nil)
        content.attachments = [attachment]
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10.0, repeats: false)
        let request = UNNotificationRequest(identifier: "10.second.notification", content: content, trigger: trigger)
        let notificationCenter = UNUserNotificationCenter.current()
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        notificationCenter.delegate = self
    }

   
    


}

extension ViewController: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print(response.notification.request.content.userInfo)
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
       // print("Silently handle notification")
        completionHandler([.alert, .sound])
    }
}












