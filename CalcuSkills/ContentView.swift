import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) { // Elemente vertikal anordnen
                Image("katze-auf-einer-mauer") // Ersetze 'yourImageName' durch den Namen deines Bilds
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 300, maxHeight: 300)
                    .padding()

                NavigationLink(destination: MultiplicationView()) {
                    Text("Start")
                        .font(.title2)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .navigationTitle("Startdseite")
        }
    }
}

struct MultiplicationView1: View {
    @State private var selectedNumber: Int = 1

    var body: some View {
        VStack {
            Text("Einmaleins für \(selectedNumber)")
                .font(.title)
                .padding()

            Picker("Wähle einen Untergang", selection: $selectedNumber) {
                ForEach(1...10, id: \.self) { number in
                    Text("\(number)").tag(number)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .padding()

            List(1...10, id: \.self) { multiplier in
                Text("\(selectedNumber) × \(multiplier) = \(selectedNumber * multiplier)")
            }
        }
        .padding()
        .navigationTitle("Einmaleins")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
