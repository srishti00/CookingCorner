//
//  CoreData.swift
//  CookingCorner
//
//  Created by srisshar on 19/05/25.
//

import Foundation
import CoreData
import UIKit

class CoreData: UIViewController {
    var container: NSPersistentContainer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        container = NSPersistentContainer(name: "CookingCorner")
        container.loadPersistentStores { storesDescription, error in
            if let error = error {
                print("error")
            }
        }
    }
    
    func saveContext() {
        if container.viewContext.hasChanges {
            do {
                try container.viewContext.save()
            } catch(let error) {
                print(error)
            }
        }
    }
}
