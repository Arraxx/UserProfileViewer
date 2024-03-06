//
//  PersonDetailedView.swift
//  MarketCircleAssignment
//
//  Created by Arrax on 06/03/24.
//

import SwiftUI

struct PersonDetailedView: View {
    @Binding var title : String?
    @Binding var age : String?
    @Binding var phone : String?
    @Binding var email : String?
    var body: some View {
        VStack(spacing : 10) {
            Text(title ?? "")
            Text(age ?? "")
            Text(phone ?? "")
            Text(email ?? "")
        } .font(.subheadline)
            .padding()
    }
}
