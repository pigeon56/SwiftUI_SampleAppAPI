//
//  CourseDetailView.swift
//  SampleAppAPI
//
//  Created by Cindy Michalowski on 2/14/24.
//

import SwiftUI

struct CourseDetailView: View {
    
    var course: Course
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: course.image_detail))
                .frame(maxHeight: 270)
            Text(course.name)
                .padding(.leading, 16)
                .font(.system(size: 36, weight: .bold, design: .rounded))
                .foregroundColor(.yellow)
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
        }
        .background(Color.mint)
    }
}

#Preview {
    CourseDetailView(course: Course(name: "Drama II", image: "pidge-coffee", image_detail: "yaphit"))
}
