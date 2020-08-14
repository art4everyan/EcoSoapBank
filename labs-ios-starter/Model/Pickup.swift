//
//  Pickup.swift
//  labs-ios-starter
//
//  Created by Lydia Zhang on 8/11/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

// MARK: -All the initialized properties are set to make a fake data as template

enum Status: String {
    case sub = "SUBMITTED"
    case out = "OUT_FOR_PICKUP"
    case com = "COMPLETE"
    case can = "CANCELLED"
}
enum CollectionType: String {
    case c_c = "COURIER_CONSOLIDATED"
    case c_d = "COURIER_DIRECT"
    case g_l = "GENERATED_LABEL"
    case loc = "LOCAL"
    case oth = "OTHER"
}
enum PropertyType: String {
    case b_b = "BED_AND_BREAKFAST"
    case guest = "GUESTHOUSE"
    case hot = "HOTEL"
    case oth = "OTHER"
}
enum HospitalityService: String {
    case bot = "BOTTLES"
    case pap = "PAPER"
    case oth = "OTHER"
    case soa = "SOAP"
    case lin = "LINENS"
}
struct PickupCarton: Codable {
    let id: String!
    
    init(id: String = "4") {
        self.id = id
    }
}

struct Property: Codable {
    let id: String!
    let name: String!
    let propertyType: String!
    let rooms: Int!
    let services: [String]!
    let collectionType: String!
    
    init(id: String! = "4", name: String! = "Lydia", propertyType: String! = PropertyType.b_b.rawValue, rooms: Int! = 1, services: [String]! = [HospitalityService.bot.rawValue], collectionType: String! = CollectionType.c_c.rawValue) {
        self.id = id
        self.name = name
        self.propertyType = propertyType
        self.rooms = rooms
        self.services = services
        self.collectionType = collectionType
    }
}

struct Pickup: Codable {
    let id: String!
    let confirmNum: String!
    let readyDate: Date!
    let pickupDate: Date
    let status: String!
    let collectionType: String!
    let notes: String
    let cartons: [PickupCarton]!
    let property: Property!
    
    init(id: String! = "4", confirmNum: String! = "12345678", readyDate: Date! = Calendar.current.startOfDay(for: Date()), pickupDate: Date, status: String! = Status.can.rawValue, collectionType: String! = CollectionType.c_c.rawValue, notes: String!, cartons: [PickupCarton]! = [PickupCarton()], property: Property! = Property()) {
        
        self.id = id
        self.confirmNum = confirmNum
        self.readyDate = readyDate
        self.pickupDate = pickupDate
        self.status = status
        self.collectionType = collectionType
        self.notes = notes
        self.cartons = cartons
        self.property = property
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case confirmNum = "confirmationCode"
        case readyDate
        case pickupDate
        case notes
        case status
        case collectionType
        case cartons
        case property
    }
}

struct SchedulePickupPayload {
    let pickup: Pickup
    let label: URL?
}