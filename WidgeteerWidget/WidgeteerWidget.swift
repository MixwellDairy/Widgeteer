import SwiftUI
import WidgetKit

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> WidgeteerEntry {
        WidgeteerEntry(date: .now, text: "Widgeteer")
    }

    func getSnapshot(in context: Context, completion: @escaping (WidgeteerEntry) -> Void) {
        completion(WidgeteerEntry(date: .now, text: loadSavedText()))
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<WidgeteerEntry>) -> Void) {
        let entry = WidgeteerEntry(date: .now, text: loadSavedText())
        let nextRefresh = Calendar.current.date(byAdding: .minute, value: 15, to: .now) ?? .now
        completion(Timeline(entries: [entry], policy: .after(nextRefresh)))
    }

    private func loadSavedText() -> String {
        let defaults = UserDefaults(suiteName: "group.Personal.Widgeteer")
        return defaults?.string(forKey: "widgetText")?.trimmingCharacters(in: .whitespacesAndNewlines)
            .flatMap { $0.isEmpty ? nil : $0 } ?? "No text saved yet."
    }
}

struct WidgeteerEntry: TimelineEntry {
    let date: Date
    let text: String
}

struct WidgeteerWidgetEntryView: View {
    var entry: Provider.Entry

    var body: some View {
        ZStack {
            Color(.systemBackground)
            Text(entry.text)
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

struct WidgeteerWidget: Widget {
    let kind: String = "WidgeteerWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            WidgeteerWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Widgeteer")
        .description("Shows the saved Widgeteer text.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

#Preview(as: .systemSmall) {
    WidgeteerWidget()
} timeline: {
    WidgeteerEntry(date: .now, text: "Preview text")
}
