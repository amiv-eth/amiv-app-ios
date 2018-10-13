//
//  User.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 13.10.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public struct User {
    
    public var nethz: String?
    public var firstname: String
    public var lastname: String
    public var membership: AMIVMembership
    public var legi: String?
    public var department: ETHDepartment?
    public var gender: Gender
    public var email: String
    public var rfid: String?
    public var phone: String?
    public var isPasswordSet: Bool
    public var id: String
    public var etag: String
    
}

extension User: Decodable {
    
    private enum UserCodingKeys: String, CodingKey {
        case nethz = "nethz"
        case firstname = "firstname"
        case lastname = "lastname"
        case membership = "membership"
        case legi = "legi"
        case department = "department"
        case gender = "gender"
        case password = "password"
        case email = "email"
        case rfid = "rfid"
        case phone = "phone"
        case wantsNewsletter = "send_newsletter"
        case isPasswordSet = "password_set"
        case id = "_id"
        case etag = "_etag"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: UserCodingKeys.self)
        
        self.nethz = try? container.decode(String.self, forKey: .nethz)
        self.firstname = try container.decode(String.self, forKey: .firstname)
        self.lastname = try container.decode(String.self, forKey: .lastname)
        self.membership = try container.decode(AMIVMembership.self, forKey: .membership)
        self.legi = try? container.decode(String.self, forKey: .legi)
        self.department = try? container.decode(ETHDepartment.self, forKey: .department)
        self.gender = try container.decode(Gender.self, forKey: .gender)
        self.email = try container.decode(String.self, forKey: .email)
        self.rfid = try? container.decode(String.self, forKey: .rfid)
        self.phone = try? container.decode(String.self, forKey: .phone)
        self.isPasswordSet = try container.decode(Bool.self, forKey: .isPasswordSet)
        self.id = try container.decode(String.self, forKey: .id)
        self.etag = try container.decode(String.self, forKey: .etag)
    }
    
}
