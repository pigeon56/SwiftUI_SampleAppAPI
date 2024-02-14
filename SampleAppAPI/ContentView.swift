//
//  ContentView.swift
//  SampleAppAPI
//
//  Created by Cindy Michalowski on 2/5/24.
//

// tutorial: https://www.youtube.com/watch?v=CimY_Sr3gWw
// no image caching implemented in this app
// can abstract fetchData() loading function into a URLImageViewModel

import SwiftUI

struct URLImageList: View {
    
    let urlString: String
    
    @State var data: Data?
    
    var body: some View {
        if let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 130, height: 70)
                .background(Color.gray)
        } else {
            Image(systemName: "video")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 130, height: 70)
                .background(Color.gray)
                .onAppear {
                    fetchData()
                }
        }
    }
    
    private func fetchData() {
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            self.data = data
        }
        task.resume()
    }
}

struct URLImageDetail: View {
    
    let urlString: String
    
    @State var data: Data?
    
    var body: some View {
        if let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 460, height: 210)
                .background(Color.gray)
        } else {
            Image(systemName: "video")
                .resizable()
                .padding(8)
                .aspectRatio(contentMode: .fit)
                .frame(width: 460, height: 210)
                .background(Color.gray)
                .onAppear {
                    fetchData()
                }
        }
    }
    
    private func fetchData() {
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            self.data = data
        }
        task.resume()
    }
}

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.courses, id: \.self) { course in
                    ZStack(alignment: .leading) {
                        CourseRowView(course: course)
                        NavigationLink("", destination: CourseDetailView(course: course))
                    }
                }
            }
            .navigationTitle("Courses")
            .onAppear {
                viewModel.fetch()
            }
        }
    }
}

#Preview {
    ContentView()
//    URLImageList(urlString: "http://localhost:9999/disk-images")
}
