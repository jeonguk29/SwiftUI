//
//  NavigationLinkiOS16.swift
//  SwiftUIiOS16Basic
//
//  Created by 정정욱 on 12/2/23.
//


import SwiftUI

// MARK: - Navigation Destination

struct NavigationLinkiOS16: View {
    var body: some View {
        NavigationStack {
            // Navigation Link 에서 value 값을 넘겨주고 navigationDestination 으로 값을 넘겨 줄수 있음
            // (Navigation Link 의 value type 을 파악해서 넘김
           
            VStack (spacing: 20) {
                // 1.value 값은 Hashable로 값 넘기기 가능
                NavigationLink(value: "String Test") {
                    Text("Navigation 1")
                }
                
                NavigationLink(value: true) {
                    Text("Navigation 2")
                }
            }
            // 2.for에 해당 타입이 뭔지 명시 해주면 됨 (넘기려는)
            .navigationDestination(for: String.self, destination: { stringValue in
                // 3.넘어가는 곳에서 해당 값을 출력 가능
                Text("값은: ") + Text("\(stringValue)").bold()
            })
            .navigationDestination(for: Bool.self, destination: { boolValue in
                Text("값은: ") + Text("\(boolValue.description)").bold()
            })
            .navigationTitle("Navigaion Destination")
        }
        .font(.title)
    }
}

// MARK: -  NavigationLink with sheet

// 어떤 문제가 발생하는지 알아보자
struct NavigaionLinkisPresented: View {
    
    @State private var showSheet = false
    @State private var navigate = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Button("Show Sheet") {
                    showSheet.toggle()
                }
            }
            .navigationTitle("Navigation with Sheet")
            .sheet(isPresented: $showSheet, content: {
                VStack (spacing: 20) {
                    // 1. Sheet 안에서는 Navigation Link 버튼이 disable 되서 사용할 수 없음
                    NavigationLink {
                        Text("Destination from Link")
                    } label: {
                        Text("NavigationLink")
                    }
                    
                    // 2. 그래서 해결법이 .ispresented 를 사용해서 navigate 을 true 로 해서 .navigationDestion 에서 넘기게 할 수 있음
                    Button("Button Link") {
                        showSheet = false // Sheet은 닫히게 되면서
                        navigate = true // 네비게이션은 참이 되면서 화면이 열리게 되는 것임
                        
                        // Sheet 안에서 Navigaion을 사용하기 위한 방법임
                    }

                }
            })
            .navigationDestination(isPresented: $navigate) {
                Text("Destination from Button ")
            }
        }
        .font(.title)
    }
}

// MARK: - Path


// Model
struct ProductForNav: Hashable {
    var name: String
    var price: Double
}

struct DateForNav: Hashable {
    var name: String
    var date: Date
}

struct NavigationLinkPath: View {
    
    // NavigationPath() 는 여러개의 collection 의 데이터 타입을 가질수 있는데, 다른 타입의 product 와 shop 을 navigationStack 에서 navigationDestion 으로 넘기게 하려면 NavigatioPath를 사용해서 넘겨야함
    @State private var product = ProductForNav(name: "iPhone 15 Pro", price: 150.99)
    @State private var date = DateForNav(name: "구매한 날짜 ", date: .now)
    @State private var navPath = NavigationPath()
    
    var body: some View {
        // 즉 각각의 모델에 대한 것을 넘길려면 Hashable을 채택한 모델을 path로 넘겨 줘야함
        NavigationStack(path: $navPath) {
            VStack (spacing: 20)  {
                List {
                    NavigationLink(value: product) {
                        Text(product.name)
                    }
                    
                    NavigationLink(value: date) {
                        Text(date.name)
                    }
                }
            }
            .navigationTitle("Order")
            // navigationDestination 에서 path 로 넘어온 Link 값을 설정함
            .navigationDestination(for: ProductForNav.self) { product in
                List {
                    Text(product.name)
                    Text(product.price, format: .currency(code: "USD"))
                        .foregroundStyle(.secondary)
                }
                .navigationTitle("Price Detail")
            }
            .navigationDestination(for: DateForNav.self) { when in
                List {
                    Text(when.name)
                    Text(when.date.formatted(date: .long, time: .omitted))
                        .foregroundStyle(.secondary)
                }
                .navigationTitle("Date Detail")
            }
        }
        .font(.title)
    }
        
}

// MARK: - To Root View
struct NavigationLinkToRoot: View {
    
    @State private var navPath: [String] = []
    
    var body: some View {
        NavigationStack(path: $navPath) {
            VStack (spacing: 20) {
                NavigationLink(value: "View 2") {
                    Text("2번 뷰로 가기")
                }
                NavigationLink(value: "View 3") {
                    Text("3번 뷰로 가기")
                }
            }
            .navigationTitle("To Root")
            .navigationDestination(for: String.self) { pathValue in
                if pathValue == "View 2" {
                    NavLinkView2(navPath: $navPath)
                } else {
                    NavLinkView3(navPath: $navPath)
                }
            }
        }
        .font(.title)
    }
}

struct NavLinkView2: View {
    
    // Binding 을 navPath 연결
    @Binding var navPath: [String]
    
    var body: some View {
        VStack (spacing: 20) {
            // navPath 에 View 3으로 value 값 넘기기
            NavigationLink(value: "View 3") {
                Text("3번 View 가기")
            }
            
            Text("NavPath:")
            Text(navPath, format: .list(type: .and, width: .narrow))
        }
    }
}

struct NavLinkView3: View {
    @Binding var navPath: [String]
    
    var body: some View {
        VStack (spacing: 20) {
            Button("Root View 로 가기") {
                navPath.removeAll()
            }
            
            Text("NavPath: ")
            Text(navPath, format: .list(type: .and, width: .narrow))
        }
    }
}



#Preview("Navigation Destination") {
    NavigationLinkiOS16()
}

#Preview("Navigation with Sheet") {
    NavigaionLinkisPresented()
}

#Preview("Navigation Path") {
    NavigationLinkPath()
}

#Preview("Navigation to Root") {
    NavigationLinkToRoot()
}

