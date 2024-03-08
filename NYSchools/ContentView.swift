//
//  ContentView.swift
//  NYSchools
//
//  Created by Vamshi Bussa on 3/7/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var schoolsVM = SchoolsViewModel(schoolService: NetworkHelper())
    @State private var selectedSchool : SchoolModel?
    @State private var isShowingDetails = false
    var body: some View {
        VStack{
            Text("Schools Around NYC")
            List{
                ForEach(schoolsVM.schoolModels){ data in
                    SchoolListCell(school: data, schoolTapped: {
                        selectedSchool in
                        self.selectedSchool = selectedSchool
                        self.isShowingDetails = true
                    })
                }
            }
            .listStyle(.plain)
        }
        .overlay(content: {
            if schoolsVM.isLoading{
                ProgressView()
            }
        })
        .task {
            await schoolsVM.getData()
        }
        .alert("Error", isPresented: Binding<Bool>.constant($schoolsVM.errorMessage.wrappedValue != nil), actions: {
            Button("OK", role: .cancel){}
        }, message: {
            Text($schoolsVM.errorMessage.wrappedValue ?? "")
        })
        .sheet(isPresented: $isShowingDetails, content: {
            if let school = selectedSchool{
                SchoolDetailView(school: school)
            }
        })
    }
}

#Preview {
    ContentView()
}
