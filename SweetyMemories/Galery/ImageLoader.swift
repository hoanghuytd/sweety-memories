//
//  ImageLoader.swift
//  Landmarks
//
//  Created by Tran Dinh Hoang Huy on 2020/04/15.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI
import Combine
import Foundation

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private let url: URL

    init(url: URL) {
        self.url = url
    }
    
    func load() {}

    func cancel() {}
}
