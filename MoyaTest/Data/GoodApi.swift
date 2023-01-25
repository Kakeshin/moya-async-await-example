//
//  GoodApi.swift
//  MoyaTest
//
//  Created by 岡本 翔真 on 2023/01/25.
//

import Foundation
import Moya

final class GoodApi {
    private let provider = CustomMoyaProvider<API>()
}

extension GoodApi: GoodApiProtocol {
    func fetchGoodData() async throws {
        provider.request(.fetchGoodAPI) { result in
            switch result {
            case .success(let response):
                print("👍")
                guard let data = try? JSONDecoder().decode(GoodEntity.self, from: response.data) else {
                    return print("Decode failed")
                }
                print(data.url)
            case .failure:
                print("Failed")
            }
        }
    }
}

