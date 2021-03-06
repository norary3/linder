//
//  Schedule.swift
//  Lindar
//
//  Created by 박종훈 on 2017. 1. 31..
//  Copyright © 2017년 Hidden Track. All rights reserved.
//

import Foundation
import EventKit

typealias ScheduleID = Int64

class Schedule {
    var id: ScheduleID
    var name: String
    var location: String
    var startedAt: Date
    var endedAt: Date = Date()
    var detail: String
    var createdAt: Date = Date()
    var updatedAt: Date = Date()
    var eventID: EventID = .empty
    
    init(id: ScheduleID = .empty , name: String = "Schedule No Named", location: String = "", startedAt: Date = Date(), detail: String = "", createdAt: Date = Date(), updatedAt: Date = Date()) {
        self.id = id
        self.name = name
        self.location = location
        self.startedAt = startedAt
        self.endedAt = startedAt.addingTimeInterval(.hour * 2.0)
        self.detail = detail
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
    
    init(id: ScheduleID = .empty , name: String = "Schedule No Named", location: String = "", startedAt: Date = Date(), endedAt: Date, detail: String = "", createdAt: Date = Date(), updatedAt: Date = Date()) {
        self.id = id
        self.name = name
        self.location = location
        self.startedAt = startedAt
        self.endedAt = endedAt
        self.detail = detail
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}

class RecommandedSchedule: Schedule {
    
    //    init(json: JSON) {
    //        // TODO : init with json
    //    }
    
}

class UserSchedule: Schedule {
    var originalEKEvent : EKEvent
    
    init(ekEvent event: EKEvent) {
        self.originalEKEvent = event
        super.init(id: .localStored,
                   name: event.title,
                   location: event.structuredLocation?.title ?? event.location ?? "",
                   startedAt: event.startDate,
                   endedAt: event.endDate,
                   createdAt: event.startDate)
    }
}

extension EKEvent {
    convenience init(schedule: Schedule, eventStore: EKEventStore) {
        self.init(eventStore: eventStore)
        self.title = schedule.name
        self.location = schedule.location
        self.startDate = schedule.startedAt
        self.endDate = schedule.endedAt
        //self.creationDate = schedule.createdAt // creationDate is get-only
        // TODO : make two date representation same
        self.notes =    "Created At: " + String(date: schedule.createdAt)! + "\n" +
                        "Updated At: " + String(describing: schedule.updatedAt)
        self.calendar = eventStore.defaultCalendarForNewEvents
    }
}

extension Int64 {
    static let localStored: Int64 = -3
    static let dummy: Int64 = -2
    static let empty: Int64 = -1
}
