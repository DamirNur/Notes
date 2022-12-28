//
//  Tasks+CoreDataProperties.swift
//  Notes
//
//  Created by Damir Nuriev on 27.12.2022.
//
//

import Foundation
import CoreData


extension Tasks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tasks> {
        return NSFetchRequest<Tasks>(entityName: "Tasks")
    }

    @NSManaged public var title: String?

}

extension Tasks : Identifiable {

}
