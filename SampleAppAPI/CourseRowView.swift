//
//  CourseRowView.swift
//  SampleAppAPI
//
//  Created by Cindy Michalowski on 2/13/24.
//

import SwiftUI

struct CourseRowView: View {
    var course: Course
    
    var body: some View {
        HStack {
            URLImageList(urlString: course.image)
                .accessibilityIdentifier(StartupUtils.shouldRunLocal() ? "Stubbed Image" :  course.image)
                .frame(width: 130, height: 70, alignment: .leading)
            Text(course.name)
                .accessibilityIdentifier(course.name)
                .bold()
        }
        .padding(3)
    }
}

#Preview {
    CourseRowView(course: Course(name: "A.J. and Paulie's Super Wonderful and Amazing Course", image: "video"))
}
