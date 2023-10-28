//
//  NoItemsView.swift
//  ToDoList
//
//  Created by Ömer Faruk Ercivan on 24.10.2023.
//

import SwiftUI

struct NoItemsView: View {

	@State var animate = false
	let secondaryAccentColor = Color("secondaryAccentColor")

	var body: some View {
		ScrollView {
			VStack(spacing: 10, content: {
				Text("There no items!")
					.font(.title)
					.fontWeight(.semibold)

				Text("Are you a productive person? I think you should click the add button and add a bunch of items to your todo list!")
					.padding(.bottom, 20)

				NavigationLink {
					AddView()
				} label: {
					Text("Add something 🥳")
						.foregroundStyle(Color(.white))
						.font(.headline)
						.frame(height: 55)
						.frame(maxWidth: .infinity)
						.background(animate ? secondaryAccentColor : Color.accentColor)
						.cornerRadius(10)
				}
				.padding(.horizontal, animate ? 30 : 50)
				.shadow(
					color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
					radius: animate ? 30 : 10,
					x: 0,
					y: animate ? 50 : 30)
				.scaleEffect(animate ? 1.1 : 1.0)
				.offset(y: animate ? -7 : 0)
			})
			.frame(maxWidth: 400)
			.multilineTextAlignment(.center)
			.padding(40)
			.onAppear(perform: addAnimation)
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
	}

	func addAnimation() {
		guard !animate else { return }

		DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
			withAnimation(
				Animation
					.easeInOut(duration: 1.5)
					.repeatForever()
			) {
				animate.toggle()
			}
		})
	}
}

#Preview {
	NavigationView {
		NoItemsView()
			.navigationTitle("Title")
	}
}