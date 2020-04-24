//
//  AsyncImage.swift
//  Landmarks
//
//  Created by Tran Dinh Hoang Huy on 2020/04/15.
//  Copyright © 2020 Apple. All rights reserved.
//

//struct AsyncImage<Placeholder: View>: View {
//    @ObservedObject private var loader: ImageLoader
//    private let placeholder: Placeholder?
//
//    init(url: URL, placeholder: Placeholder? = nil) {
//        loader = ImageLoader(url: url)
//        self.placeholder = placeholder
//    }
//
//    var body: some View {
//        image
//            .onAppear(perform: loader.load)
//            .onDisappear(perform: loader.cancel)
//    }
//
//    private var image: some View {
//        placeholder
//    }
//}
