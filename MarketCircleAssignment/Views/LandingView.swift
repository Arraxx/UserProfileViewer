//
//  LandingView.swift
//  MarketCircleAssignment
//
//  Created by Arrax on 05/03/24.
//

import SwiftUI

struct LandingView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @State var name: String?
    @State var age: String?
    @State var phone: String?
    @State var email: String?
    @ObservedObject var viewModel: JSONLoader = JSONLoader()
    @State private var showList = false
    
    var body: some View {
        NavigationStack{
            GeometryReader { geometry in
                VStack {
                    HStack {
                        if verticalSizeClass == .compact {
                            Button(action: {
                                name = ""
                                age = ""
                                phone = ""
                                email = ""
                                showList.toggle()
                            }) {
                                Image(systemName: (showList ? "xmark" : "list.bullet"))
                                    .font(.title)
                                    .foregroundStyle(showList ? .red : .black)
                            }
                            .padding()
                        }
                        Spacer()
                        NavigationLink(destination: NewUserView()) {
                            Text("Add User +")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundStyle(.black)
                                .padding()
                        }
                    }
                    HStack {
                        VStack {
                            if verticalSizeClass != .compact || showList {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: geometry.size.width / 2.5)
                                    .foregroundStyle(.white)
                                    .overlay(
                                        List {
                                            ForEach(viewModel.userInfoData, id: \.self) { val in
                                                Text(val.name)
                                                    .onTapGesture {
                                                        self.name = val.info.title + " " + val.name
                                                        self.age = String(val.info.age)
                                                        self.phone = val.info.phone
                                                        self.email = val.info.email
                                                    }
                                            }
                                        }
                                            .listStyle(PlainListStyle())
                                            .padding()
                                    )
                            }
                        }
                        VStack {
                            PersonDetailedView(title: $name, age: $age, phone: $phone, email: $email)
                        }
                        Spacer()
                    }
                }
            }
            
            .task {
                viewModel.loadData()
            }
        }
    }
}

#Preview {
    LandingView()
}
