import SwiftUI

struct ContentView: View {
    @AppStorage(
        WidgeteerSharedDefaults.storageKey,
        store: UserDefaults(suiteName: WidgeteerSharedDefaults.appGroupSuite)
    )
    private var savedText: String = ""

    @State private var inputText: String = ""

    var body: some View {
        NavigationStack {
            Form {
                Section("Widget Text") {
                    TextField("Enter text for widget", text: $inputText)
                        .textInputAutocapitalization(.sentences)

                    Button("Save") {
                        savedText = inputText.trimmingCharacters(in: .whitespacesAndNewlines)
                    }
                    .buttonStyle(.borderedProminent)
                }

                Section("Currently Saved") {
                    Text(savedText.isEmpty ? "No text saved yet." : savedText)
                        .foregroundStyle(savedText.isEmpty ? .secondary : .primary)
                }
            }
            .navigationTitle("Widgeteer")
            .onAppear {
                inputText = savedText
            }
        }
    }
}

#Preview {
    ContentView()
}
