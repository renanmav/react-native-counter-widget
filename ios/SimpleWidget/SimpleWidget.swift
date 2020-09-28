import WidgetKit
import SwiftUI

struct SimpleEntry: TimelineEntry {
  let date = Date()
  let count: Int
}

extension SimpleEntry {
  static var placeholder: SimpleEntry {
    SimpleEntry(count: 0)
  }
}

struct Provider: TimelineProvider {
  @AppStorage("counter", store: UserDefaults(suiteName: "group.com.renanmav.Widget"))
  var count: Int = Int()
  
  func placeholder(in context: Context) -> SimpleEntry {
    SimpleEntry.placeholder
  }

  func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
    if context.isPreview {
      completion(SimpleEntry.placeholder)
    } else {
      let entry = SimpleEntry(count: count)
      completion(entry)
    }
  }

  func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
    let entry = SimpleEntry(count: count)
    let timeline = Timeline(entries: [entry], policy: .atEnd)
    completion(timeline)
  }
}


struct SimpleWidgetEntryView : View {
  var entry: Provider.Entry

  var body: some View {
    VStack {
      Text("Counter is \(entry.count)")
    }
  }
}

@main
struct SimpleWidget: Widget {
    let kind: String = "SimpleWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            SimpleWidgetEntryView(entry: entry)
        }
        .supportedFamilies([.systemSmall])
        .configurationDisplayName("Counter")
        .description("This is an counter widget.")
    }
}

struct SimpleWidget_Previews: PreviewProvider {
    static var previews: some View {
      SimpleWidgetEntryView(entry: SimpleEntry.placeholder)
          .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
