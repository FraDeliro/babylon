//
//  User.swift
//  babylon
//
//  Created by Francesco on 13/01/17.
//  Copyright © 2017 me. All rights reserved.
//

import Foundation

public struct User {
    let address: Address
    let company: Company
    var email: String
    var id: Int
    var name: String
    var phone: String
    var username: String
    var website: String
    
    init?(_ dictionary: [String: Any]) {
        if let address = dictionary["address"] as? [String: Any] {
            self.address = Address(address)!
        } else {
            return nil
        }
        
        if let company = dictionary["company"] as? [String: Any] {
            self.company = Company(company)!
        } else {
            return nil
        }
        
        if let email = dictionary["email"] as? String {
            self.email = email
        } else {
            return nil
        }
        
        if let id = dictionary["id"] as? Int {
            self.id = id
        } else {
            return nil
        }
        
        if let name = dictionary["name"] as? String {
            self.name = name
        } else {
            return nil
        }
        
        if let phone = dictionary["phone"] as? String {
            self.phone = phone
        } else {
            return nil
        }
        
        if let username = dictionary["username"] as? String {
            self.username = username
        } else {
            return nil
        }
        
        if let website = dictionary["website"] as? String {
            self.website = website
        } else {
            return nil
        }
    }
}

extension User: Equatable {
    public static func ==(x: User, y: User) -> Bool {
        return x.address == y.address &&
            x.company == y.company &&
            x.email == y.email &&
            x.id == y.id &&
            x.name == y.name &&
            x.phone == y.phone &&
            x.username == y.username &&
            x.website == y.website
    }
}

extension User: Hashable {
    public var hashValue: Int {
        return address.hashValue ^
            company.hashValue ^
            email.hashValue ^
            id.hashValue ^
            name.hashValue ^
            phone.hashValue ^
            username.hashValue ^
            website.hashValue
    }
}

// MARK: - Address

public struct Address {
    var city: String
    let geo: Geo
    var street: String
    var suite: String
    var zipcode: String
    
    init?(_ dictionary: [String: Any]) {
        if let city = dictionary["city"] as? String {
            self.city = city
        } else {
            return nil
        }
        
        if let geo = dictionary["geo"] as? [String: Any] {
            self.geo = Geo(geo)!
        } else {
            return nil
        }
        
        if let street = dictionary["street"] as? String {
            self.street = street
        } else {
            return nil
        }
        
        if let suite = dictionary["suite"] as? String {
            self.suite = suite
        } else {
            return nil
        }
        
        if let zipcode = dictionary["zipcode"] as? String {
            self.zipcode = zipcode
        } else {
            return nil
        }
    }
}

extension Address: Equatable {
    public static func ==(x: Address, y: Address) -> Bool {
        return x.city == y.city &&
            x.geo == y.geo &&
            x.street == y.street &&
            x.suite == y.suite &&
            x.zipcode == y.zipcode
    }
}

extension Address: Hashable {
    public var hashValue: Int {
        return city.hashValue ^
            geo.hashValue ^
            street.hashValue ^
            suite.hashValue ^
            zipcode.hashValue
    }
}

// MARK: - Company

public struct Company {
    var bs: String
    var catchPhrase: String
    var name: String
    
    init?(_ dictionary: [String: Any]) {
        if let bs = dictionary["bs"] as? String {
            self.bs = bs
        } else {
            return nil
        }
        
        if let catchPhrase = dictionary["catchPhrase"] as? String {
            self.catchPhrase = catchPhrase
        } else {
            return nil
        }
        
        if let name = dictionary["name"] as? String {
            self.name = name
        } else {
            return nil
        }
    }
}

extension Company: Equatable {
    public static func ==(x: Company, y: Company) -> Bool {
        return x.bs == y.bs && 
            x.catchPhrase == y.catchPhrase && 
            x.name == y.name
    } 
}

extension Company: Hashable {
    public var hashValue: Int {
        return bs.hashValue ^ 
            catchPhrase.hashValue ^ 
            name.hashValue
    } 
}

// MARK: - Geo

public struct Geo {
    var lat: String
    var lng: String 
    
    init?(_ dictionary: [String: Any]) {
        if let lat = dictionary["lat"] as? String {
            self.lat = lat
        } else {
            return nil
        }
        
        if let lng = dictionary["lng"] as? String {
            self.lng = lng
        } else {
            return nil
        }
    }
}

extension Geo: Equatable {
    public static func ==(x: Geo, y: Geo) -> Bool {
        return x.lat == y.lat && 
            x.lng == y.lng
    } 
}

extension Geo: Hashable {
    public var hashValue: Int {
        return lat.hashValue ^ 
            lng.hashValue
    } 
}
