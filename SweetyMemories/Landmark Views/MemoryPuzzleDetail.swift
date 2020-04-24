/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing the details for a landmark.
*/

import SwiftUI

struct MemoryPuzzleDetail: View {
    @EnvironmentObject var userData: UserData
    var memoryPuzzle: MemoryPuzzle
    
    var puzzleIndex: Int {
        userData.memoryPuzzles.firstIndex(where: { $0.id == memoryPuzzle.id })!
    }

    var body: some View {
        VStack {
            MapView(coordinate: memoryPuzzle.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 250)
            
            CircleImage(image: memoryPuzzle.image)
                .offset(x: 0, y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(memoryPuzzle.name)
                        .font(.title)
                    
                    Button(action: {
                        self.userData.memoryPuzzles[self.puzzleIndex]
                            .isFavorite.toggle()
                    }) {
                        if self.userData.memoryPuzzles[self.puzzleIndex].isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.yellow)
                        } else {
                            Image(systemName: "star")
                                .foregroundColor(Color.gray)
                        }
                    }
                }
                
                HStack(alignment: .top) {
                    Text(memoryPuzzle.park)
                        .font(.subheadline)
                    Spacer()
                    Text(memoryPuzzle.state)
                        .font(.subheadline)
                }
                EventTimerView()
            }
            .padding()
            
            Spacer()
        }
    }
}

struct MemoryPuzzleDetail_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return MemoryPuzzleDetail(memoryPuzzle: userData.memoryPuzzles[0])
            .environmentObject(userData)
    }
}
