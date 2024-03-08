//
//  SchoolDetailView.swift
//  NYSchools
//
//  Created by Vamshi Bussa on 3/7/24.
//

import SwiftUI

struct SchoolDetailView: View {
    
    let school : SchoolModel
    var body: some View {
        VStack(alignment: .leading,spacing: 10){
            Text(school.schoolName)
                .font(.headline)
            
            Text(school.website)
                .font(.subheadline)
            
            Text(school.paragraph)
                .font(.caption)
        }
        .padding()
    }
}

#Preview {
    SchoolDetailView(school: SchoolModel(schoolName: "ABC School", website: "www.abcschool.com", paragraph: "asghkcjbasyb,vasbdv bdvuyaoljhrlfiau hgsdfuykga,hmfbasf kgddafkuy,sbfv ashbdfyusgflas"))
}
