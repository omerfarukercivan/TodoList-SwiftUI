//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Ömer Faruk Ercivan on 23.10.2023.
//

import SwiftUI

@main
struct ToDoListApp: App {

	@StateObject var listViewModel = ListViewModel()

	var body: some Scene {
		WindowGroup {
			NavigationView {
				ListView()
			}
			.navigationViewStyle(StackNavigationViewStyle())
			.environmentObject(listViewModel)
		}
	}
}
