//
//  UnitTestingBootcampView.swift
//  SwiftUIAdvanced
//
//  Created by Санжар Асанов on 16/6/23.
//

/*
 1. Unit test
 - test the business logic in ur app
 
 2. UI test
 - tests the UI of your app
 */

import SwiftUI

struct UnitTestingBootcampView: View {
    
    @StateObject private var vm: UnitTestingBootcampViewModel
    
    init(isPremium: Bool) {
        _vm = StateObject(wrappedValue: UnitTestingBootcampViewModel(isPremium: isPremium))
    }
    
    var body: some View {
        Text(vm.isPremium.description)
    }
}

struct UnitTestingBootcampView_Previews: PreviewProvider {
    static var previews: some View {
        UnitTestingBootcampView(isPremium: true)
    }
}
