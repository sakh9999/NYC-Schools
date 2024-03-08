//
//  SchoolListCell.swift
//  NYSchools
//
//  Created by Vamshi Bussa on 3/7/24.
//

import SwiftUI

struct SchoolListCell: View {
    
    @State var school : SchoolModel
    
    var schoolTapped: (SchoolModel) -> Void
    var body: some View {
        
        Button {
            schoolTapped(school)
        } label: {
           
            VStack(alignment: .leading){
                Text(school.schoolName)
                Text(school.website)
            }
        }
        .buttonStyle(.plain)
    }
}

//#Preview {
//    SchoolListCell(school: SchoolModel(schoolName: "ABC School", website: "www.abcschools.org"), schoolTapped: <#(SchoolModel) -> Void#>)
//}
