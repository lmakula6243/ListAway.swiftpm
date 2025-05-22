import SwiftUI

struct premadelistView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.orange,
                    Color.mint,
                    Color.cyan
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            Circle()
                .fill(Color.white.opacity(0.1))
                .frame(width: 300, height: 300)
                .offset(x: -100, y: -200)

            Circle()
                .fill(Color.yellow.opacity(0.1))
                .frame(width: 200, height: 200)
                .offset(x: 150, y: 250)

            VStack {
                Text("Pre-made Lists")
                    .font(.custom("MarkerFelt-Wide", size: 30))
                    .foregroundColor(.white)
                    .shadow(radius: 10)

                Button(action: {
                   
                    print("Button tapped!")
                }) {
                    Text("hawaii")
                        .font(.custom("ChalkboardSE-Bold", size: 20))
                        .foregroundColor(.white)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.2))
                                .shadow(radius: 5)
                        )
                }

            }
        }
    }
}

