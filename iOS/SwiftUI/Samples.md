# Alert
```Swift
struct AlertMessage: Identifiable {
    let id: Int
    let text: String
}

struct ContentView: View {
    @State private var alertMessage: AlertMessage? = nil

    var body: some View {
        Button("Show alert") {
            self.alertMessage = AlertMessage(id: 1, text: "Hello World!")
        }.alert(item: $alertMessage) { alertMessage in
            Alert(
                title: Text(alertMessage.text),
                dismissButton: .cancel()
            )
        }
    }
}
```

# ActionSheet
```Swift
struct ContentView: View {
    @State private var showActionSheet = false
    
    var body: some View {
        Button("Show action sheet") {
            self.showActionSheet = true
        }.actionSheet(isPresented: $showActionSheet) {
            ActionSheet(
                title: Text("Actions"),
                message: Text("Available actions"),
                buttons: [
                    .cancel { print(self.showActionSheet) },
                    .default(Text("Action")),
                    .destructive(Text("Delete"))
                ]
            )
        }
    }
}
```

