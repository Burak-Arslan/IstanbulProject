//
//  API.swift
//  Istanbul information and travel guide
//
//  Created by Burak Arslan on 12.04.2021.
//

import Foundation
import Moya

enum IstanbulService {
    case getNotification
    case getBusStop
}

extension IstanbulService : TargetType {
    
    var sampleData: Data {
        return Data()
    }
    
    var baseURL: URL {
        switch self {
        default:
            return URL(string: "https://mekansal.herokuapp.com/api/")!
        }
    }
    
    var path: String {
        switch self {
        case .getNotification:
            return "duyuru"
        case .getBusStop:
            return "durak"
        }
       
    }
    
    var method: Moya.Method {
        switch self {
        case .getNotification, .getBusStop:
            return .get
        }
    }
    
    var headers: [String : String]?{
        switch self {
        case .getNotification:
            return ["Content-type": "application/json"]
        case .getBusStop:
            return ["Content-type": "application/json"]
        }
    }
    
    var task: Task {
        switch self {
        case .getNotification, .getBusStop:
            return .requestPlain
    }
}
}


