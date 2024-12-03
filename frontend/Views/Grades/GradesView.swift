import SwiftUI

struct GradesView: View {
    
    @StateObject private var networkManager = GradesNetworkManager()
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy"
        return formatter
    }()
    
    var body: some View {
        VStack {
            ZStack {
                HStack (alignment: .center){
                    Text("Осень 2024")
                        .font(.custom("Inter-Regular_Bold", size: 18))
                        .foregroundColor(Color("AccentColor"))
                }
                .padding()
                
                HStack{
                    Spacer()
                    Image("dropDownIcon")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                .padding(.trailing, 25)
            }
            Divider()
         
            if let subjectsList = networkManager.gradesData {
                ScrollView {
                    ForEach(subjectsList.data.subjects) { subject in
                        SubjectView(subject: subject, dateFormatter: dateFormatter)
                        Divider()
                    }
                }
            }
            else {
                Text("Loading...")
            }
        }
        .onAppear {
            networkManager.fetchGrades(username: "GusakAN")
        }
    }
}

struct GradesView_Previews: PreviewProvider {
    static var previews: some View {
        GradesView()
    }
}

