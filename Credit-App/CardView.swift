//
//  CardView.swift
//  Credit-App
//
//  Created by Abdelrahman Shehab on 14/04/2023.
//

import SwiftUI

struct CardView: View {
    // MARK: -  PROPERTIES
    var card: Card
    
    @State private var fadeIn: Bool     = false
    @State private var moveDown: Bool   = false
    @State private var moveUP: Bool     = false
    @State private var showAlert: Bool  = false
    
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    
    // MARK: -  BODY
    var body: some View {
        ZStack {
            
            Image(card.imageName)
                .resizable()
                .scaledToFit()
                .opacity(fadeIn ? 1.0: 0.0)
            
            VStack {
                Text(card.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                Text(card.headline)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .italic()
            }//: VSTACK
            .offset(y: moveDown ? -218 : -300)
            
            Button {
                print("Button was Tapped.")
                playSound(sound: "sound-chime", type: "mp3")
                self.hapticImpact.impactOccurred()
                self.showAlert.toggle()
            } label: {
                HStack {
                    Text(card.callToAction.uppercased())
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    Image(systemName: "arrow.right.circle")
                        .font(Font.title.weight(.medium))
                        .accentColor(.white)
                }//: HSTACK
                .padding(.vertical)
                .padding(.horizontal, 24)
                .background(
                    LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .leading, endPoint: .trailing)
                )
                .clipShape(Capsule())
                .shadow(color: Color("ColorShadow"), radius: 6, x: 0, y: 3)
                
            }//: BUTTON
            .offset(y: moveUP ? 210 : 300)

            
        }//: ZSTACK
        .frame(width: 335, height: 545)
        .background(
            LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .top, endPoint: .bottom)
        )
        .cornerRadius(15)
        .onAppear {
            withAnimation(.linear(duration: 1.2)) {
                self.fadeIn.toggle()
            }
            withAnimation(.linear(duration: 0.6)) {
                self.moveUP.toggle()
                self.moveDown.toggle()
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(card.title),
                message: Text(card.message),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

// MARK: -  PREVIEW
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: cardData[0])
            .previewLayout(.sizeThatFits)
    }
}
