//
//  ImageRow.swift
//  Landmarks
//
//  Created by Tran Dinh Hoang Huy on 2020/04/15.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct ImageRow: View {
    var categoryName: String
    var items: [MemoryPuzzle]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(self.items) { landmark in
                        NavigationLink(
                            destination: MemoryPuzzleDetail(
                                memoryPuzzle: landmark
                            )
                        ) {
                            CategoryItem(memoryPuzzle: landmark)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct ImageItem: View {
    var memoryPuzzle: MemoryPuzzle
    var body: some View {
        VStack(alignment: .leading) {
            // ImageViewContainer()
            Text(memoryPuzzle.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct ImageRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(
            categoryName: memoriesData[0].category.rawValue,
            items: Array(memoriesData.prefix(4))
        )
        .environmentObject(UserData())
    }
}

