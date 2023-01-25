//
//  GoodRepository.swift
//  MoyaTest
//
//  Created by 岡本 翔真 on 2023/01/25.
//

final class GoodRepository {
    private let goodApi: GoodApiProtocol

    init(goodApi: GoodApiProtocol) {
        self.goodApi = goodApi
    }
}

extension GoodRepository: GoodRepositoryProtocol {
    func good() async throws {
        try await goodApi.fetchGoodData()
    }
}
