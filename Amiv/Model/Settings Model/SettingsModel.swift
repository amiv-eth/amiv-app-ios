//
//  SettingsModel.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 18.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation
import UIKit

public class SettingsModel {
    
    // MARK: - Variables
    
    public private(set) var sectionModels: [SettingsSectionModel]
    
    // MARK: - Initializers
    
    public init(sectionModels: [SettingsSectionModel]) {
        self.sectionModels = sectionModels
    }
}

extension SettingsModel {
    
    public static func create() -> SettingsModel {
        let sections: [SettingsSectionModel] = [SettingsModel.createLoginSection(), SettingsModel.createValueSection(), SettingsModel.createDisclosureSection()]
        
        return SettingsModel(sectionModels: sections)
    }
    
    private static func createLoginSection() -> SettingsSectionModel {
        let first = SettingsCellModel(text: "Name: Hans", detailText: "Email: hans@ethz.ch", action: .none, cellType: .login)
        let second = SettingsCellModel(text: "Status: Logged In", detailText: "Tap to log out", action: .toggleLogin, cellType: .login)
        
        return SettingsSectionModel(headerText: "Login", footerText: nil, cellModels: [first, second])
    }
    
    private static func createValueSection() -> SettingsSectionModel{
        let food = SettingsCellModel(text: "Food Preference", detailText: "All", action: .changeValue("food"), cellType: .changeValue)
        let publicTransport = SettingsCellModel(text: "Public Transport", detailText: "GA", action: .changeValue("pubTrans"), cellType: .changeValue)
        let pushNotification = SettingsCellModel(text: "Enabled", detailText: "Tap to disable Push Notifications", action: .changeValue("pushNotification"), cellType: .changeValue)
        
        return SettingsSectionModel(headerText: "Settings", footerText: nil, cellModels: [food, publicTransport, pushNotification])
    }
    
    private static func createDisclosureSection() -> SettingsSectionModel {
        var disclosureFooterText: String
        if let release = Bundle.main.releaseVersionNumber, let build = Bundle.main.buildVersionNumber {
            disclosureFooterText = "Amiv an der ETH © 2018\nVersion \(release) (\(build))"
        } else {
            disclosureFooterText = "Amiv an der ETH © 2018"
        }
        let disclosureSection: SettingsSectionModel = SettingsSectionModel(headerText: nil, footerText: disclosureFooterText, cellModels: [], footerTextAlignment: .center)
        
        return disclosureSection
    }
}
