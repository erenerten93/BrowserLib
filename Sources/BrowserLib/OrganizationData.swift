//
//  OrganizationData.swift
//  
//
//  Created by Eren Erten on 18.07.2023.
//

import Foundation
struct OrganizationData:Decodable{
    var login:String
    var id:Int
    var reposURL:String
    var avatarURL:String
    var description:String?
}