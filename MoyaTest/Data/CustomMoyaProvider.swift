//
//  CustomMoyaProvider.swift
//  MoyaTest
//
//  Created by 岡本 翔真 on 2023/01/25.
//

import Foundation
import Moya
import Alamofire

class CustomMoyaProvider<T: TargetType>: MoyaProvider<T> {
    public init(endpointClosure: @escaping MoyaProvider<Target>.EndpointClosure = CustomMoyaProvider.defaultEndpointMapping,
                stubClosure: MoyaProvider<Target>.StubClosure? = nil,
                session: Alamofire.Session? = nil) {

        let unwrapStubClosure: MoyaProvider<Target>.StubClosure = {
            if let stubClosure = stubClosure {
                return stubClosure
            } else {
                return MoyaProvider.neverStub
            }
        }()

        super.init(endpointClosure: endpointClosure,
                   requestClosure: CustomMoyaProvider.defaultRequestMapping,
                   stubClosure: unwrapStubClosure,
                   callbackQueue: nil,
                   plugins: [],
                   trackInflights: false)
    }
}
