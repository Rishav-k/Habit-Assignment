//
//  Styles.swift
//  Habit
//
//  Created by Rishav Kumar on 21/04/25.
//
import SwiftUI

// MARK: - App Colors
extension Color {
    static let appPrimary = Color("AppPrimary")
    static let appSecondary = Color("AppSecondary")
    static let violet = Color.purple
    static let background = Color("Background")
    static let textPrimary = Color("TextPrimary")
    static let textSecondary = Color("TextSecondary")

    // Optional: Hex color initializer
    static let customGray = Color(hex: "#7D7D7D")
    static let violet1 = Color(hex: "#4F1C51")
    static let violet2 = Color(hex: "#F8E7F6")
    static let violet3 = Color(hex: "#7C4585")
    static let violet4 = Color(hex: "#D4BEE4")
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")

        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let r = Double((rgb >> 16) & 0xFF) / 255
        let g = Double((rgb >> 8) & 0xFF) / 255
        let b = Double(rgb & 0xFF) / 255

        self.init(red: r, green: g, blue: b)
    }
}

// MARK: - App Fonts
struct AppFont {
    // Lato
    static func lato(size: CGFloat, weight: Font.Weight = .regular) -> Font {
        switch weight {
        case .bold: return .custom("Lato-Bold", size: size)
        case .semibold: return .custom("Lato-Semibold", size: size)
        case .medium: return .custom("Lato-Medium", size: size)
        case .light: return .custom("Lato-Light", size: size)
        default: return .custom("Lato-Regular", size: size)
        }
    }

    // Poppins
    static func poppins(size: CGFloat, weight: Font.Weight = .regular) -> Font {
        switch weight {
        case .bold: return .custom("Poppins-Bold", size: size)
        case .semibold: return .custom("Poppins-SemiBold", size: size)
        case .medium: return .custom("Poppins-Medium", size: size)
        case .light: return .custom("Poppins-Light", size: size)
        default: return .custom("Poppins-Regular", size: size)
        }
    }

    // Inter
    static func inter(size: CGFloat, weight: Font.Weight = .regular) -> Font {
        switch weight {
        case .bold: return .custom("Inter-Bold", size: size)
        case .semibold: return .custom("Inter-SemiBold", size: size)
        case .medium: return .custom("Inter-Medium", size: size)
        case .light: return .custom("Inter-Light", size: size)
        default: return .custom("Inter-Regular", size: size)
        }
    }

    // Roboto
    static func roboto(size: CGFloat, weight: Font.Weight = .regular) -> Font {
        switch weight {
        case .bold: return .custom("Roboto-Bold", size: size)
        case .semibold: return .custom("Roboto-Medium", size: size) // No Semibold in some versions
        case .medium: return .custom("Roboto-Medium", size: size)
        case .light: return .custom("Roboto-Light", size: size)
        default: return .custom("Roboto-Regular", size: size)
        }
    }

    // Default system font
    static func system(size: CGFloat, weight: Font.Weight = .regular) -> Font {
        return .system(size: size, weight: weight)
    }
}

struct BottomCornerRadius: Shape {
    var radius: CGFloat = 20

    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.minX, y: rect.minY))               // top-left
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))            // top-right
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - radius))   // bottom-right before curve
        path.addArc(
            center: CGPoint(x: rect.maxX - radius, y: rect.maxY - radius),
            radius: radius,
            startAngle: .degrees(0),
            endAngle: .degrees(90),
            clockwise: false
        )
        path.addLine(to: CGPoint(x: rect.minX + radius, y: rect.maxY))   // bottom-left before curve
        path.addArc(
            center: CGPoint(x: rect.minX + radius, y: rect.maxY - radius),
            radius: radius,
            startAngle: .degrees(90),
            endAngle: .degrees(180),
            clockwise: false
        )
        path.closeSubpath()

        return path
    }
}
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat
    var corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
struct HorizontalLine: View {
    var color: Color = .gray.opacity(0.3)
    var height: CGFloat = 1
    var padding: EdgeInsets = EdgeInsets()

    var body: some View {
        Rectangle()
            .fill(color)
            .frame(height: height)
            .padding(padding)
    }
}

