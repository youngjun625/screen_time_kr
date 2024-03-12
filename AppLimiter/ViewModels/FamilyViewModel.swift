import Foundation
import FamilyControls

class FamilyViewModel: ObservableObject {
    
    // Family Controls 권한 센터
    let familyCenter = AuthorizationCenter.shared
    
    // 선택된 앱 목록
    @Published var appSelection = FamilyActivitySelection(includeEntireCategory: true)
    

}
