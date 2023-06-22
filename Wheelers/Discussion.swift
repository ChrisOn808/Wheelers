//
//  Recherche.swift
//  Wheelers
//
//  Created by Apprenant 79 on 24/04/2023.
//

import SwiftUI

struct Discussion: View {
    
    @State private var convo = chatProfil
    
    var body: some View {
        NavigationStack{
            VStack{
                Rectangle()
                    .frame(height: 2.0)
                    .foregroundColor(.gray)
                ZStack{
                    Rectangle()
                        .padding(.top, -11.0)
                        .foregroundColor(colorBleu)
                    
                    VStack{
                        //                        ForEach($convo.prefix(upTo: 3)) { personne in
                        //                                NavigationLink(destination: chatKim(dotUpdate: $convo[1].read)){
                        //                                    Chat(discussion: personne)
                        //                                }
                        //                            }
                        
                        ForEach($convo.prefix(3)) { personne in
                            NavigationLink(destination: ChatProto(convoProto: personne.messages, dotUpdate: $convo[1].read)){
                                Chat(discussion: personne)
                            }
                        }
                        
                        
                        Spacer()
                    }
                    .navigationTitle("Discussion")
                }
            }
        }
    }
}
struct Chat: View {
    @Binding var discussion : ChatPreset
    
    
    var body: some View {
        ZStack{
            if !discussion.read {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 360,height: 105)
                    .foregroundColor(.white)
                    .padding(.trailing, 35)
                    .overlay(
                        HStack{
                            Spacer()
                            VStack{
                                Circle()
                                    .frame(width: 10.0, height: 10.0)
                                    .foregroundColor(Color("darkRed"))
                                    .padding(.trailing, 41)
                                Spacer()
                            }
                            .padding(.top, 9.0)
                        }
                    )
            }else {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 360,height: 105)
                    .foregroundColor(.white)
                    .padding(.trailing, 35)
            }
            HStack() {
                Image(discussion.utilisateur.pp)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 80, height: 80)
                    .shadow(radius: 5)
                    .overlay(Circle()
                        .stroke(Color("myYellow"), lineWidth:1)
                    )
                VStack(alignment: .leading) {
                    HStack {
                        Text(discussion.utilisateur.prenom)
                            .font(.title)
                            .fontWeight(.bold)
                        
                    }
                    if !discussion.read {
                        HStack{
                            Text(discussion.text)
                                .font(.footnote)
                            if let lastMessage = discussion.messages.last?.heureReception {
                                Text(lastMessage.formatted(date: .omitted, time: .shortened))
                                    .font(.footnote)
                            }
                        }
                        .padding(.top, 3)
                        .fontWeight(.bold)
                    } else {
                        HStack{
                            Text(discussion.text)
                                .font(.footnote)
                            if let lastMessage = discussion.messages.last?.heureReception {
                                Text(lastMessage.formatted(date: .omitted, time: .shortened))
                                    .font(.footnote)
                            }
                        }
                        .padding(.top, 3)
                        .foregroundColor(.gray)
                        .fontWeight(.bold)
                    }
                }
                Spacer()
            }
            .frame(width: 360,height: 105)
        }
        .padding(.leading, 30)
        
    }
}

struct Discussion_Previews: PreviewProvider {
    static var previews: some View {
        Discussion()
    }
}


