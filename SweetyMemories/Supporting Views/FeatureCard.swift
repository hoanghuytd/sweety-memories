/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view that shows a featured landmark.
*/

import SwiftUI

struct FeatureCard: View {
    var memoryPuzzle: MemoryPuzzle
    
    var body: some View {
        memoryPuzzle.featureImage?
            .resizable()
            .aspectRatio(3 / 2, contentMode: .fit)
            .overlay(TextOverlay(memoryPuzzle: memoryPuzzle))
    }
}

struct TextOverlay: View {
    var memoryPuzzle: MemoryPuzzle
    
    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [Color.black.opacity(0.6), Color.black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Rectangle().fill(gradient)
            VStack(alignment: .leading) {
                Text(memoryPuzzle.name)
                    .font(.title)
                    .bold()
                Text(memoryPuzzle.park)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(memoryPuzzle: features[0])
    }
}
