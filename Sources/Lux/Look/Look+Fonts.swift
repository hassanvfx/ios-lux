//
//  Look+Fonts.swift
//  Styling
//
//  Created by mark maxwell on 1/5/20.
//  Copyright © 2020 eonflux. All rights reserved.
//

import SwiftUI

public extension Look {
    struct Fonts: Codable, Hashable {
        public var primary = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        public var secondary = UIFont.boldSystemFont(ofSize: UIFont.systemFontSize)
        public var tertiary = UIFont.italicSystemFont(ofSize: UIFont.systemFontSize)
        public var active: UIFont {
            switch priority {
            case .primary:
                return primary
            case .secondary:
                return secondary
            case .tertiary:
                return tertiary
            }
        }

        public var preferred: Look.Priority?
        public var priority: Look.Priority {
            preferred ?? .primary
        }

        public var largeTitleSize: CGFloat { 34 }
        public var titleSize: CGFloat { 28 }
        public var headlineSize: CGFloat { 17 }
        public var subheadlineSize: CGFloat { 15 }
        public var bodySize: CGFloat { 17 }
        public var calloutSize: CGFloat { 16 }
        public var footnoteSize: CGFloat { 13 }
        public var captionSize: CGFloat { 12 }

        public var largeTitle: Font { Font(largeTitleUIFont) }
        public var title: Font { Font(titleUIFont) }
        public var headline: Font { Font(headlineUIFont) }
        public var subheadline: Font { Font(subheadlineUIFont) }
        public var body: Font { Font(bodyUIFont) }
        public var callout: Font { Font(calloutUIFont) }
        public var footnote: Font { Font(footnoteUIFont) }
        public var caption: Font { Font(captionUIFont) }

        public var largeTitleUIFont: UIFont { active.withSize(largeTitleSize) }
        public var titleUIFont: UIFont { active.withSize(titleSize) }
        public var headlineUIFont: UIFont { active.withSize(headlineSize) }
        public var subheadlineUIFont: UIFont { active.withSize(subheadlineSize) }
        public var bodyUIFont: UIFont { active.withSize(bodySize) }
        public var calloutUIFont: UIFont { active.withSize(calloutSize) }
        public var footnoteUIFont: UIFont { active.withSize(footnoteSize) }
        public var captionUIFont: UIFont { active.withSize(captionSize) }

        public enum CodingKeys: String, CodingKey {
            case preferred, primary, secondary, tertiary
        }

        public init() {}
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.init()

            preferred = try container.decode(Look.Priority?.self, forKey: .preferred)

            primary = try container.decode(CodableFont.self, forKey: .primary).font
            secondary = try container.decode(CodableFont.self, forKey: .secondary).font
            tertiary = try container.decode(CodableFont.self, forKey: .tertiary).font
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(preferred, forKey: .preferred)
            try container.encode(CodableFont(primary), forKey: .primary)
            try container.encode(CodableFont(secondary), forKey: .secondary)
            try container.encode(CodableFont(tertiary), forKey: .tertiary)
        }
    }
}

public extension Look.Fonts {
    var specName: String {
        switch priority {
        case .primary:
            return "A"
        case .secondary:
            return "B"
        case .tertiary:
            return "C"
        }
    }
}
