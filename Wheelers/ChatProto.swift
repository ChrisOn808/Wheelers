//
//  chatProto.swift
//  Wheelers
//
//  Created by Apprenant 79 on 05/05/2023.
//

import SwiftUI

struct ChatProto: View {
    @State private var reponseProto: String = ""
    @Binding var convoProto: [Message]
    @Binding var dotUpdate: Bool
    
    var body: some View {
        NavigationStack{
            VStack{
                Rectangle()
                    .frame(height: 2.0)
                    .foregroundColor(.gray)
                ZStack{
                    Rectangle()
                        .padding(.top, -10.0)
                        .foregroundColor(colorBleu)
                    
                    VStack{
                        ForEach(convoProto) { preset in
                            chatOrder(discussionProto: preset)
                        }
                        
                        Spacer()
                        
                        ZStack{
                            Rectangle()
                                .frame(height: 40)
                                .foregroundColor(Color("lGray"))
                            HStack{
                                Image(systemName: "camera.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 6)
                                    .font(.system(size: 25))
                                Image(systemName: "photo.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 5)
                                    .font(.system(size: 25))
                                
                                ZStack{
                                    Rectangle()
                                        .frame(width: 260, height: 30)
                                        .foregroundColor(.white)
                                        .cornerRadius(20)
                                    HStack{
                                        TextField("Tapez votre message içi", text: $reponseProto)
                                            .frame(width: 210, height: 18)
                                            .foregroundColor(.gray)
                                            .font(.system(size: 15))
                                            .onSubmit{
                                                convoProto.append(Message(user: "Maria", heureReception: Date.now, msg: reponseProto, orientation: 0))
                                            }
                                        Image(systemName: "waveform.circle.fill")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 25))
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Kim")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear{
                dotUpdate = true
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Image(kim.pp)
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 40,height: 40)
                }
                
            }
            
        }
    }
}
struct chatOrder: View {
    var discussionProto : Message
    
    var body: some View {
        VStack{
            if discussionProto.orientation == 0 {
                HStack{
                    Spacer()
                    HStack{
                        VStack(alignment: .leading){
                            Text("vous")
                                .fontWeight(.bold)
                            VStack (alignment: .trailing){
                                Text(discussionProto.msg)
                                    .font(.system(size: 25))
                                Text(discussionProto.heureReception.formatted(date:.omitted, time: .shortened))
                                    .font(.system(size: 15))
                                    .padding(.trailing)
                            }
                            .fontWeight(.light)
                            .padding(.horizontal, 30)
                            .background(.white)
                            .cornerRadius(20)
                        }
                        .padding(.horizontal)
                    }
                }
            } else {
                HStack{
                    HStack{
                        VStack(alignment: .leading){
                            Text(discussionProto.user)
                                .fontWeight(.bold)
                            VStack(alignment: .trailing){
                                Text(discussionProto.msg)
                                    .font(.system(size: 25))
                                Text(discussionProto.heureReception.formatted(date:.omitted, time: .shortened))
                                    .font(.system(size: 15))
                                    .padding(.trailing)
                                
                            }
                            .fontWeight(.light)
                            .padding(.horizontal)
                            .background(.white)
                            .cornerRadius(20)
                        }
                        .padding(.horizontal)
                    }
                    Spacer()
                }
            }
        }
    }
}

struct chatProto_Previews: PreviewProvider {
    static var previews: some View {
        ChatProto(convoProto: .constant([Message(user: "Toto", heureReception: Date(timeIntervalSinceNow: -2000), msg: "YOTITITITYIT", orientation: 1), Message(user: "Lala", heureReception: Date(timeIntervalSinceNow: -1000), msg: "IYOOjozgkeozkgooekzH", orientation: 0)]),dotUpdate: .constant(true))
    }
}

