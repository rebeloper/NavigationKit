//
//  InlineNavigationBarView.swift
//  
//
//  Created by Alex Nagy on 26.12.2020.
//

import SwiftUI

public struct InlineNavigationBarView<TitleView: View, LeadingView: View, TrailingView: View, BackgroundView: View, Content: View>: View {
    public let titleView: TitleView
    public let leadingView: LeadingView
    public let trailingView: TrailingView
    public let backgroundView: BackgroundView
    public let content: Content
    
    public var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .center, spacing: 0) {
                HStack {
                    HStack {
                        leadingView
                        Spacer()
                    }.frame(width: proxy.size.width * 0.25)
                    Spacer()
                    titleView
                    Spacer()
                    HStack {
                        Spacer()
                        trailingView
                    }.frame(width: proxy.size.width * 0.25)
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(backgroundView)
                Divider().padding(.horizontal, -50)
                Spacer().frame(height: 0)
                content
            }
        }
    }
}

struct InlineNavigationBarViewModifier<TitleView: View, LeadingView: View, TrailingView: View, BackgroundView: View>: ViewModifier {
    
    var titleView: () -> TitleView
    var leadingView: () -> LeadingView
    var trailingView: () -> TrailingView
    var backgroundView: () -> BackgroundView
    
    func body(content: Content) -> some View {
        InlineNavigationBarView(titleView: titleView(), leadingView: leadingView(), trailingView: trailingView(), backgroundView: backgroundView(), content: content)
    }
}

extension View {
    public func inlineNavigationBar<TitleView: View, LeadingView: View, TrailingView: View, BackgroundView: View>(titleView: TitleView, leadingView: LeadingView, trailingView: TrailingView, backgroundView: BackgroundView) -> some View {
        modifier(InlineNavigationBarViewModifier(titleView: {
            titleView
        }, leadingView: {
            leadingView
        }, trailingView: {
            trailingView
        }, backgroundView: {
            backgroundView
        }))
    }
}
