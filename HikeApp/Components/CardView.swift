//
//  CardView.swift
//  HikeApp
//
//  Created by Aashish karn on 05.12.23.
//

import SwiftUI

struct CardView: View {
    // MARK: PROPERTIES
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    // MARK: FUNCTIONS
    
    func randomImage() {
        repeat {
            randomNumber = Int.random(in: 1...5)
            
        } while imageNumber == randomNumber
        
        imageNumber = randomNumber
        
    }
    var body: some View {
        ZStack {
            CustomBackgroundView()
            VStack {
                //MARK: - HEADER
                VStack(alignment: .leading) {
              
                    HStack {
                        Text("Hiking")
                                .fontWeight(.black)
                                .font(.system(size: 52))
                                .foregroundStyle(
                                    LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top,
                                                   endPoint: .bottom
                                                               )
                            )
                        Spacer()
                        
                        Button {
                            // ACTION: Show a Sheet
                            print("The button was pressed")
                            isShowingSheet.toggle()
                        } label: {
                           CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet) {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        }
                    }
                   
                    Text("Fun and enjoyable outdoor activity for friends and families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                }.padding(.horizontal, 30)
                
                //MARK: - MAIN CONTENT
                ZStack {
                    CustomCircleView()
                    Image("image-\(imageNumber)")
                        .resizable()
                    .scaledToFit()
                    .animation(.easeInOut(duration: 2), value: imageNumber)
                }
               
                // MARK: - FOOTER
                Button {
                   randomImage()
                } label: {
                     Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(LinearGradient(colors: [.customGreenLight, .customGreenMedium], startPoint: .top,
                                                        endPoint: .bottom
                                                       )
                        )
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                    
                }
                .buttonStyle(GradientButton())
                //: VSTACK
            }
        }
        .frame(width: 320, height: 570)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
