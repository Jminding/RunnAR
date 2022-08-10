import SwiftUI

struct MotherView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
            if viewRouter.currentPage == "main" {
                ContentView()
            } else if viewRouter.currentPage == "settings" {
                SettingsView()
            } else if viewRouter.currentPage == "howtoplay" {
                HowToPlay()
            } else if viewRouter.currentPage == "startGame" {
                MainView().environmentObject(DataModel.shared)
            } else if viewRouter.currentPage == "login" {
                LoginView()
            } else if viewRouter.currentPage == "signup" {
                SignUpView()
            }
        }
    }

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView().environmentObject(ViewRouter())
    }
}

