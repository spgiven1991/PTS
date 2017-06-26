//
//  CoreDataStack.swift
//  Post to Shop Redo
//
//  Created by Samuel Given on 6/22/17.
//  Copyright © 2017 Post to Shop. All rights reserved.
//

import Foundation
import CoreData

final class CoreDataStack {
    
    static let store = CoreDataStack()
    private init() {}
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    var fetchedLinks = [Link]()
    
    func storeLink(withTitle title: String, onDate date: NSDate) {
        let link = Link(context: context)
        link.title = title
        link.date = date
        try! context.save()
        print("storing links - before fetch")
        fetchLinks()
    }
    
    func fetchLinks() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Link")
        let dateSort = NSSortDescriptor(key: "date", ascending: false)
        fetchRequest.sortDescriptors = [dateSort]
        self.fetchedLinks = try! context.fetch(fetchRequest) as! [Link]
    }
    
    func delete(link: Link) {
        context.delete(link)
        try! context.save()
    }
    
    lazy var persistentContainer: CustomPersistentContainer = {
        
        let container = CustomPersistentContainer(name: "LinksModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}

class CustomPersistentContainer: NSPersistentContainer {
    static let url = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.com.PosttoShop.Post-to-Shop-Redo")!
    let storeDescription = NSPersistentStoreDescription(url: url)
    
    override class func defaultDirectoryURL() -> URL {
        return url
    }
}
