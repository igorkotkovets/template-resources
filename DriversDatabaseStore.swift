//
//  DriversDatabaseStore.swift
//  Template
//
//  Created by igork on 8/31/18.
//  Copyright © 2018 Igor Kotkovets. All rights reserved.
//

import Result
import RxSwift
import CoreData
import Foundation

enum DriversDatabaseStoreError: Error {
    case wrongData
}

protocol DriversDatabaseStoreInput {
    func createDriverWith(firstName: String, lastName: String, patronymicName: String, series: String, number: String) -> Observable<Driver>
}

class DriversDatabaseStore: DriversDatabaseStoreInput {
    class DocumentsDirectoryContainer: NSPersistentContainer {
        override class func defaultDirectoryURL() -> URL {
            let fileManager = FileManager.default
            let urls = fileManager.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask)

            if let url = urls.first {
                return url
            } else {
                return super.defaultDirectoryURL()
            }
        }
    }

    fileprivate lazy var persistentContainer: NSPersistentContainer = {
        //        let description = NSPersistentStoreDescription()
        //        description.type = NSSQLiteStoreType
        //        description.shouldInferMappingModelAutomatically = true
        //        description.shouldMigrateStoreAutomatically = true

        let container = DocumentsDirectoryContainer(name: "Drivers")
        //        container.persistentStoreDescriptions = [description]
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    init() {
    }

    private func save(context: NSManagedObjectContext) throws {
        if context.hasChanges {
            try context.save()
        }
    }

    func createDriverWith(firstName: String, lastName: String, patronymicName: String, series: String, number: String) -> Observable<Driver> {
        return Observable.create { [weak self] observer in
            guard let `self` = self else {
                return Disposables.create()
            }
            self.persistentContainer.performBackgroundTask { context in
                context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
                let dbModel = NSEntityDescription.insertNewObject(forEntityName: "DriverEntity",
                                                                  into: context) as! DriverEntity
                let identifier = String.uuid
                dbModel.firstName = firstName
                dbModel.lastName = lastName
                dbModel.patronymicName = patronymicName
                dbModel.series = series
                dbModel.number = number
                dbModel.identifier = identifier

                do {
                    try self.save(context: context)
                    let driver = Driver(firstName: firstName,
                                        lastName: lastName,
                                        patronymicName: patronymicName,
                                        series: series,
                                        number: number,
                                        identifier: identifier)
                    observer.onNext(driver)
                } catch {
                    observer.onError(DriversDatabaseStoreError.wrongData)
                }
            }

            return Disposables.create()
        }
    }
}

extension DriverEntity {
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        let now = Date()
        self.dateCreated = now
        self.dateModified = now
    }
}
