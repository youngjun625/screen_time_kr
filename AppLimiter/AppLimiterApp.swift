//
//  AppLimiterApp.swift
//  AppLimiter
//
//  Created by Young Jun Kim on 3/11/24.
//

import SwiftUI
import FamilyControls

@main
struct AppLimiterApp: App {
    // 자식에
    @StateObject var familyViewModel = FamilyViewModel()
    
    var body: some Scene {
        WindowGroup {
            Home()
                .environmentObject(familyViewModel)
                .onAppear(){
                    // 앱이 실행 되자마자 Family Controls 권한을 묻는다
                    // 원하는 곳에서 아래의 Task를 복붙하여 Family Controls 권한을 물을 수 있다
                    Task {
                        do {
                            try await familyViewModel.familyCenter.requestAuthorization(for: .individual)
                            // Family Controls 권한 허용 성공
                            // ...
                        } catch {
                            print("Failed request: \(error)")
                            // Family Controls 권한 허용 실패
                            // ...
                        }
                       
                    }
                }
        }
    }
}
