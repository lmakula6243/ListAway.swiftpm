import SwiftUI

@main
struct MyApp: App {
    @AppStorage("hasSeenOnBoarding") private var hasSeenOnBoarding: Bool = false
    var body: some Scene {
        WindowGroup {
            if hasSeenOnBoarding {
                ContentView()
                    .transition(.opacity)
            } else {
                OnBoarding()
                    .transition(.opacity)
            }
            }
        }
    }

