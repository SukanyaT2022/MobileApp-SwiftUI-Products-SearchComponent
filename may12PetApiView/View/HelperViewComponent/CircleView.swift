import SwiftUI

struct CircleView<Content: View>: View {
    let diameter: CGFloat
    let color: Color
    let content: Content
    let verticalOffset: CGFloat
    
    init(diameter: CGFloat, color: Color, verticalOffset: CGFloat = 0, @ViewBuilder content: () -> Content) {
        self.diameter = diameter
        self.color = color
        self.verticalOffset = verticalOffset
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            Circle()
                .fill(color)
                .frame(width: diameter, height: diameter)
            
            content
                .offset(y: verticalOffset)
        }
    }
}

#Preview {
    CircleView(diameter: 100, color: .blue, verticalOffset: 10) {
        Text("42")
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.white)
    }
} 