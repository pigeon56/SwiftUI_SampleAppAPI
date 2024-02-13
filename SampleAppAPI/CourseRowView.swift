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
            URLImage(urlString: course.image)
                .accessibilityIdentifier(StartupUtils.shouldRunLocal() ? "Stubbed Image" :  course.image)
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
