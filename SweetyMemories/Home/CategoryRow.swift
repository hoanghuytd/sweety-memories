/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing a scrollable list of landmarks.
*/

import SwiftUI

struct CategoryRow: View {
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
                    ForEach(self.items) { memoryPuzzle in
                        NavigationLink(
                            destination: MemoryPuzzleDetail(
                                memoryPuzzle: memoryPuzzle
                            )
                        ) {
                            CategoryItem(memoryPuzzle: memoryPuzzle)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryItem: View {
    var memoryPuzzle: MemoryPuzzle
    var body: some View {
        VStack(alignment: .leading) {
            memoryPuzzle.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(memoryPuzzle.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(
            categoryName: memoriesData[0].category.rawValue,
            items: Array(memoriesData.prefix(4))
        )
        .environmentObject(UserData())
    }
}
