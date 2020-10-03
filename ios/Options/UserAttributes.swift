//
//  UserAttributes.swift
//  Intercom
//
//  Created by Matei Oprea on 18/09/2020.
//  Copyright © 2020 Facebook. All rights reserved.
//

class UserCompany: ICMCompany {
    init(data: NSMutableDictionary) {
        super.init()
        self.name = data["name"] as? String
        self.companyId = data["companyId"] as? String
    }
}

class UserAttributes: ICMUserAttributes {
    
    init(data: NSDictionary) {
        super.init()
        self.name = data["name"] as? String
        self.userId = data["userId"] as? String
        self.email = data["email"] as? String
        self.phone = data["phone"] as? String
        self.languageOverride = data["languageOverride"] as? String
        self.companies = (data["companies"] as? NSMutableArray ?? []).map{UserCompany(data: $0 as! NSMutableDictionary)}
    }
}
