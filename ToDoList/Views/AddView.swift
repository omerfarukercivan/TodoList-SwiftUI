//
//  AddView.swift
//  ToDoList
//
//  Created by Ömer Faruk Ercivan on 23.10.2023.
//

import SwiftUI

struct AddView: View {

	@Environment(\.presentationMode) var presentationMode
	@EnvironmentObject var listViewModel: ListViewModel

	@State var textFieldText: String = ""
	@State var alertTitle = ""
	@State var showAlert = false

	var body: some View {
		ScrollView {
			VStack {
				TextField("Type something here...", text: $textFieldText)
					.padding(.horizontal)
					.frame(height: 55)
					.background(Color(UIColor.secondarySystemBackground))
					.cornerRadius(10)

				Button(action: addButtonPressed, label: {
					Text("Save".uppercased())
						.foregroundStyle(Color(.white))
						.font(.headline)
						.frame(height: 55)
						.frame(maxWidth: .infinity)
						.background(Color.accentColor)
						.cornerRadius(10)
				})
			}
			.padding(14)
		}
		.navigationTitle("Add an item 🖋️")
		.alert(isPresented: $showAlert, content: getAlert)
	}

	func addButtonPressed() {
		if textIsAppropriate() {
			listViewModel.addItem(title: textFieldText)
			presentationMode.wrappedValue.dismiss()
		}
	}

	func textIsAppropriate() -> Bool {
		if textFieldText.count < 3 {
			alertTitle = "Your new todo item must be at least 3 characters long!"
			showAlert.toggle()
			return false
		}
		return true
	}

	func getAlert() -> Alert {
		return Alert(title: Text(alertTitle))
	}
}

#Preview {
	NavigationView {
		AddView()
			.environmentObject(ListViewModel())
	} 
}
