//
//  EventTimerView.swift
//  Landmarks
//
//  Created by Tran Dinh Hoang Huy on 2020/04/14.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

let isoDate = "2020-09-21T00:00:00+0700"

let dateFormatter = ISO8601DateFormatter()
let date = dateFormatter.date(from:isoDate)!

struct EventTimerView: View {
    
    
    @State var nowDate: Date = Date()
    let referenceDate = date
    var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
            self.nowDate = Date()
        }
    }
    

    
    var body: some View {
        HStack {
            Image("rainbowlake.jpg")
                .resizable()
                .frame(width: 50, height: 50)
            Text("Comeback home")
            Spacer()
            Text(countDownString(from: referenceDate))
                .font(.body)
                .onAppear(perform: {
                    _ = self.timer
                })
        }
    .padding()
    }

    func countDownString(from date: Date) -> String {
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar
            .dateComponents([.day, .hour, .minute, .second],
                            from: nowDate,
                            to: referenceDate)
        return String(format: "%02dd%01dh%01dm",
                      components.day ?? 00,
                      components.hour ?? 00,
                      components.minute ?? 00,
                      components.second ?? 00)
    }

}


//struct EventTimerView_Previews: PreviewProvider {
//    static var previews: some View {
//        
//        let isoDate = "2021-04-14T10:44:00+0000"
//
//        let dateFormatter = ISO8601DateFormatter()
//        _ = dateFormatter.date(from:isoDate)!
//        
//        let formatter = DateFormatter()
//        // initially set the format based on your datepicker date / server String
//        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//        
//        Text("A")
//        
//        
//        // EventTimerView(referenceDate: date)
//    }
//}

struct EventTimerView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EventTimerView()
            EventTimerView()
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
