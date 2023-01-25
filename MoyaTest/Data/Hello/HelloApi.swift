//
//  HelloApi.swift
//  MoyaTest
//
//  Created by 岡本 翔真 on 2023/01/25.
//

import Foundation
import Moya

final class HelloApi {
    private let provider = CustomMoyaProvider<API>()
}

extension HelloApi: HelloApiProtocol {
    func fetchHelloData() async throws {
        provider.request(.fetchHelloAPI) { result in
            switch result {
            case .success(let response):
                print("😀")
                guard let data = try? JSONDecoder().decode(HelloEntity.self, from: response.data) else {
                    return print("Decode failed")
                }

                print(data.url)
            case .failure:
                print("Failed")
            }
        }
    }
}
