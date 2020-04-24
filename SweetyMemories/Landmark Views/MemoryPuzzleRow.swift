/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A single row to be displayed in a list of landmarks.
*/

import SwiftUI

struct MemoryPuzzleRow: View {
    var momoryPuzzle: MemoryPuzzle

    var body: some View {
        HStack {
            momoryPuzzle.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(momoryPuzzle.name)
            Spacer()

            if momoryPuzzle.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct MemoryPuzzleRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MemoryPuzzleRow(momoryPuzzle: memoriesData[0])
            MemoryPuzzleRow(momoryPuzzle: memoriesData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
