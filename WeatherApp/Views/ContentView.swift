import SwiftUI
import CoreData

struct ContentView: View {
    
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody? // "?" incase ResponseBody doesnt give us full or proper response

    var body: some View {
        VStack{
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    LoadingView()
                        .task { //this task is executed while LoadingView is doing its job
                            do {
                                //everything on basis of ResponseBody is stored from getCurrentWeather()
                                try await weather = weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Error loading weather, \(error)")
                            }
                        }
                }
            } else {
                WelcomeView()
                    .environmentObject(locationManager)
            }
        }
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
