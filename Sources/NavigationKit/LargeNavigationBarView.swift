//
//  LargeNavigationBarView.swift
//  
//
//  Created by Alex Nagy on 26.12.2020.
//

import SwiftUI

@available(iOS 13.0, *)
public struct LargeNavigationBarView<TitleView: View, LeadingView: View, TrailingView: View, BackgroundView: View, Content: View>: View {
    public let titleView: TitleView
    public let leadingView: LeadingView
    public let trailingView: TrailingView
    public let backgroundView: BackgroundView
    public let content: Content
    
    public var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 0) {
                VStack(spacing: 12) {
                    HStack {
                        HStack {
                            leadingView
                            Spacer()
                        }
                        Spacer()
                        HStack {
                            Spacer()
                            trailingView
                        }
                    }
                    HStack {
                        titleView.font(.largeTitle)
                        Spacer()
                    }
                    
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(backgroundView)
                Divider()
                Spacer().frame(height: 0)
                content
            }.asScreen()
        }
    }
}

extension View {
    public func largeNavigationBar<TitleView: View, LeadingView: View, TrailingView: View, BackgroundView: View>(titleView: TitleView, leadingView: LeadingView, trailingView: TrailingView, backgroundView: BackgroundView) -> some View {
        modifier(LargeNavigationBarViewModifier(titleView: {
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
