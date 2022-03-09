import SwiftUI

struct ContentView: View {
    var body: some View {
        Button { } label: {
            Label("Stop", systemImage: "xmark.circle")
                .labelStyle(.iconOnly)
        }
        .buttonStyle(.borderedProminent)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDisplayName("Default text size")
            
            ContentView()
                .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
                .previewDisplayName("Accessibility text size")

        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
