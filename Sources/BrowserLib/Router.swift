//
//  Router.swift
//  
//
//  Created by Eren Erten on 18.07.2023.
//

import Foundation

public enum Router {
    case getOrganizationList
    case searchForFlight
    
    
    var scheme: String {
        switch self {
        case .getOrganizationList, .searchForFlight:
            return "https"
        }
    }

    var host: String {
        switch self {
        case .getOrganizationList:
            return "api.github.com"
        case .searchForFlight:
            return  "nativeapps.ryanair.com"
        }
    }
    
    var path: String {
        switch self {
        case .getOrganizationList:
            return "/organizations"
        case .searchForFlight:
            return "/api/v4/en-IE/Availability"
        }
    }
    
    var parameters: [URLQueryItem] {
        switch self {
        case .getOrganizationList,.searchForFlight:
            return []
        }
    }
    
    var method: String {
        switch self {
        case .getOrganizationList, .searchForFlight:
            return "GET"
            }
      }
}
