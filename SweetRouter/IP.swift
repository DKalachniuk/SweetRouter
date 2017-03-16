//
//  IP.swift
//  SweetRouter
//
//  Created by Oleksii on 16/03/2017.
//  Copyright © 2017 ViolentOctopus. All rights reserved.
//

import Foundation

public struct IP {
    public let firstOctet: UInt8
    public let secondOctet: UInt8
    public let thirdOctet: UInt8
    public let fourthOctet: UInt8
    
    public init(_ first: UInt8, _ second: UInt8, _ third: UInt8, _ fourth: UInt8) {
        firstOctet = first
        secondOctet = second
        thirdOctet = third
        fourthOctet = fourth
    }
    
    public var stringValue: String {
        return "\(firstOctet).\(secondOctet).\(thirdOctet).\(fourthOctet)"
    }
}

extension IP: Hashable {
    public static func == (lhs: IP, rhs: IP) -> Bool {
        return lhs.firstOctet == rhs.firstOctet
            && lhs.secondOctet == rhs.secondOctet
            && lhs.thirdOctet == rhs.thirdOctet
            && lhs.fourthOctet == rhs.fourthOctet
        
    }
    
    public var hashValue: Int {
        var hash = 5381
        hash = ((hash << 5) &+ hash) &+ firstOctet.hashValue
        hash = ((hash << 5) &+ hash) &+ secondOctet.hashValue
        hash = ((hash << 5) &+ hash) &+ thirdOctet.hashValue
        hash = ((hash << 5) &+ hash) &+ fourthOctet.hashValue
        return hash
    }
}
