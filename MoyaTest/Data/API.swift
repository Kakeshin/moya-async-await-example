//
//  API.swift
//  MoyaTest
//
//  Created by 岡本 翔真 on 2023/01/24.
//

import Foundation
import Moya

enum API {
    case fetchHelloAPI
    case fetchGoodAPI
}

extension API: TargetType {
    var baseURL: URL {
        return URL(string: "https://httpbin.org/")!
    }
    var path: String {
        switch self {
        case .fetchHelloAPI: return "delay/1"
        case .fetchGoodAPI: return "delay/3"
        }
    }
    var method: Moya.Method {
        return .get
    }
    var sampleData: Data {
        let resourceName: String = {
            return "Stub"

        }()
        let path = Bundle.main.path(forResource: resourceName, ofType: "json")!
        return FileHandle(forReadingAtPath: path)!.readDataToEndOfFile()
    }
    var task: Task {
        return .requestParameters(parameters: [:], encoding: URLEncoding.default)
    }

    var headers: [String : String]? {
        switch self {
        case .fetchHelloAPI:
//            return ["value": "Hello", "Content-type": "application/json"]
            return ["Content-type": "application/json"]
        case .fetchGoodAPI:
//            return ["value": "Good", "Content-type": "application/json"]
            return ["Content-type": "application/json"]
        }

    }
}
