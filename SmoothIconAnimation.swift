//
// Created By: Mobile Apps Academy
// Subscribe : https://www.youtube.com/@MobileAppsAcademy?sub_confirmation=1
// Medium Blob : https://medium.com/@mobileappsacademy
// LinkedIn : https://www.linkedin.com/company/mobile-apps-academy
// Twitter : https://twitter.com/MobileAppsAcdmy
// Lisence : https://github.com/Mobile-Apps-Academy/MobileAppsAcademyLicense/blob/main/LICENSE.txt
//

import SwiftUI

struct SmoothIconAnimation: View {
    
    @State private var isRotation = false
    @State private var isHidden = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 15) {
                Line()
                    .rotationEffect(.degrees(isRotation ? 48 : 0), anchor: .leading)
                
                Line()
                    .scaleEffect(isHidden ? 0 : 1, anchor: isHidden ? .trailing : .leading)
                    .opacity(isHidden ? 0 : 1)
                
                Line()
                    .rotationEffect(.degrees(isRotation ? -48 : 0), anchor: .leading)
            }
            .onTapGesture {
                withAnimation (.interpolatingSpring(stiffness: 500, damping: 15)) {
                    isRotation.toggle()
                    isHidden.toggle()
                }
            }
        }
    }
    
    @ViewBuilder
    func Line() -> some View {
        Rectangle()
            .frame(width: 65, height: 10)
            .cornerRadius(5)
            .foregroundColor(.black)
    }
}

struct SmoothIconAnimation_Previews: PreviewProvider {
    static var previews: some View {
        SmoothIconAnimation()
    }
}
