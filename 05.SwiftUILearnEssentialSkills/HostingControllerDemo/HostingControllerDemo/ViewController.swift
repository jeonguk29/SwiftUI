//
//  ViewController.swift
//  HostingControllerDemo
//
//  Created by 정정욱 on 11/20/23.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 데이터 저장
         // SwiftUI 의 @AppStorage 동일
         UserDefaults.standard.set("Woogie", forKey: "userID")
         // 데이터 불러오기
        // let userid = UserDefaults.standard.object(forKey: "UserID") as! String
        // 위코드는 UIKit에서 실제 저장된 값을 사용하는 방법
        
        // UserDefaults,   @AppStorage에 저장된 값은 사용자가 앱을 지울 때까지 유지 : 간단한 사용자 설정 정보 같은 걸 넣으면 좋음
        // p.630
        
        
        let  swiftUIController = UIHostingController(rootView: SwiftUIView(text: "하나로 병합하기3"))
        
        addChild(swiftUIController) // 컨트롤러 가 있는 뷰를 자식으로
        swiftUIController.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(swiftUIController.view)
        
        swiftUIController.view.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        swiftUIController.view.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        // swiftUIController.didMove(toParent: self) 상위 뷰 컨에 올라갈때 호출 되는 함수
        
        
        
    }

    
    // 1. SwiftUI 병합하기 UIHostingController 이용하기
    // 버튼 액션이 아니라 세그웨이 액션으로 연결해서 뷰를 띄워야함
    
    // p.626
    @IBSegueAction func showSwiftUIView(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: SwiftUIView(text: "하나로 병합하기1"))
    }
    // p.629
    @IBSegueAction func embedSwiftUIView(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: SwiftUIView(text: "하나로 병합하기2"))
    }
    
}

