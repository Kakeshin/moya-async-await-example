//
//  ViewController.swift
//  MoyaTest
//
//  Created by 岡本 翔真 on 2023/01/24.
//

import UIKit

final class ViewController: UIViewController {
    private var helloRepository: HelloRepositoryProtocol?
    private var goodRepository: GoodRepositoryProtocol?

    @IBOutlet weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.helloRepository = HelloRepository(helloApi: HelloApi())
        self.goodRepository = GoodRepository(goodApi: GoodApi())
    }

    @IBAction func tappedButton(_ sender: UIButton) {
        hoge()
    }

    private func hoge() {
        _Concurrency.Task {
            do {
                _ = try await helloRepository?.hello()
                _ = try await goodRepository?.good()
            } catch {

            }
        }
    }
}

