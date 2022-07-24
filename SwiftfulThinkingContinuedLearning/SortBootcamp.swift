//
//  SortBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Sy Lee on 2022/07/24.
//

import SwiftUI
import Combine

struct FriendInfo: Identifiable {
    let id = UUID()
    let name: String
    let gender: String
    let contact: String
    let relation: String
    let age: Int
}

class SortBootcampVM: ObservableObject {
    @Published var friendList: [FriendInfo] = []
    @Published var sortOption: SortOption = .defaultCase
    
    var subscription = Set<AnyCancellable>()
    init() {
        initList()
        combineSortAndList()
    }
    
    enum SortOption {
        case age, ageReverse, defaultCase
    }
    
    func initList() {
        let friend1 = FriendInfo(name: "김서연", gender: "👩🏼", contact: "010-1234-5678", relation: "고등학교", age: 20)
        let friend2 = FriendInfo(name: "김민준", gender: "🧑🏼", contact: "010-2345-6789", relation: "고등학교", age: 21)
        let friend3 = FriendInfo(name: "이서준", gender: "🧑🏼", contact: "010-3456-7890", relation: "중학교", age: 22)
        let friend4 = FriendInfo(name: "민서윤", gender: "👩🏼", contact: "010-4567-8901", relation: "대학교", age: 23)
        let friend5 = FriendInfo(name: "최시우", gender: "🧑🏼", contact: "010-5678-9012", relation: "고등학교", age: 24)
        let friend6 = FriendInfo(name: "박서진", gender: "🧑🏼", contact: "010 -6789-0123", relation: "회사", age: 24)
        let friend7 = FriendInfo(name: "신지안", gender: "👩🏼", contact: "010 -7890-1234", relation: "회사", age: 23)
        let friend8 = FriendInfo(name: "정우진", gender: "🧑🏼", contact: "010 -8901-2345", relation: "중학교", age: 22)
        let friend9 = FriendInfo(name: "박현준", gender: "🧑🏼", contact: "010 -9012-3456", relation: "중학교", age: 21)
        let friend10 = FriendInfo(name: "최영진", gender: "🧑🏼", contact: "010 -0123-4567", relation: "대학교", age: 20)
        friendList.append(contentsOf: [
            friend1, friend2, friend3, friend4, friend5, friend6, friend7, friend8, friend9, friend10
        ])
    }
    func combineSortAndList() {
        $sortOption
            .sink(receiveCompletion: { completion in
                print("subscribe: \(completion)")
            }, receiveValue: { [weak self] option in
                guard let self = self else { return }
                switch option {
                case .age:
                    let ageSortedArray = self.friendList.sorted { friend1, friend2 in
                         return friend1.age > friend2.age
                     }
                    self.friendList = ageSortedArray
                case .ageReverse:
                    self.friendList.sort { friend1, friend2 in
                        return friend1.age < friend2.age
                    }
                case .defaultCase: break
                }
            })
            .store(in: &subscription)
    }
}
struct FriendInfoCard: View {
    let name: String
    let gender: String
    let contact: String
    let relation: String
    let age: Int
    
    var body: some View {
        VStack {
            HStack(spacing: 5) {
                Text(name)
                Text("\(age)")
                Spacer()
                Text(relation)
            }
            HStack(spacing: 30) {
                Text(gender)
                Spacer()
                Text(contact)
            }
        }.padding()
            .background(.brown)
            .cornerRadius(10)
            .foregroundColor(.white)
    }
}

struct SortBootcamp: View {
    @StateObject var vm = SortBootcampVM()
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Button {
                        if vm.sortOption == .defaultCase || vm.sortOption == .ageReverse {
//                            vm.sortAge(sortOption: .age)
                            vm.sortOption = .age
                        } else if vm.sortOption == .age {
//                            vm.sortAge(sortOption: .ageReverse)
                            vm.sortOption = .ageReverse
                        }
                    } label: {
                        HStack {
                            Text("Age")
                            Image(systemName: "triangle.fill")
                                .rotationEffect(Angle(degrees: vm.sortOption == .age ? 180 : 0))
                                .opacity(vm.sortOption == .defaultCase ? 0 : 1.0)
                        }
                        
                    }

                }
                ForEach(vm.friendList) { friend in
                    FriendInfoCard(name: friend.name, gender: friend.gender, contact: friend.contact, relation: friend.relation, age: friend.age)
                        .padding()
                }
            }
        }
    }
}

struct SortBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SortBootcamp()
    }
}
