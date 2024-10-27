import SwiftUI

struct GradesView: View {
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy"
        return formatter
    }()

    var subjects: [Subject] = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let subjectList: [Subject] = [
            Subject(
                name: "Архитектура вычислительных систем",
                teacher: "Шамаева О.Ю.",
                averageGrade: 4.3,
                examinationType: "Зачёт с оценкой (по совокупности)",
                gradeList: [
                    Grade(name: "1. Семестр 5. Выполнение и защита практических заданий №1 и 2", weight: 15, dateStart: dateFormatter.date(from: "2024-09-02")!, dateEnd: dateFormatter.date(from: "2024-09-29")!, weekNumber: 4, mark: 5, markDate: dateFormatter.date(from: "2024-09-29")!),
                    Grade(name: "2. Выполнение и защита практических заданий №3 и 4", weight: 20, dateStart: dateFormatter.date(from: "2024-10-07")!, dateEnd: dateFormatter.date(from: "2024-10-14")!, weekNumber: 7, mark: 4, markDate: dateFormatter.date(from: "2024-10-14")!),
                    Grade(name: "3. Выполнение лабораторных работ №3 и №4", weight: 20, dateStart: dateFormatter.date(from: "2024-11-04")!, dateEnd: dateFormatter.date(from: "2024-11-11")!, weekNumber: 10, mark: 5, markDate: dateFormatter.date(from: "2024-11-11")!),
                    Grade(name: "4. Выполнение и защита практического задания 5", weight: 15, dateStart: dateFormatter.date(from: "2024-11-18")!, dateEnd: dateFormatter.date(from: "2024-11-24")!, weekNumber: 12, mark: 4, markDate: dateFormatter.date(from: "2024-11-24")!)
                ]
            ),
            Subject(
                name: "Компьютерная графика",
                teacher: "Бартенев О.В.",
                averageGrade: 4.7,
                examinationType: "Зачёт с оценкой (по совокупности)",
                gradeList: []
            )
        ]
        
        return subjectList
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
         
            ScrollView {
                ForEach(subjects) { subject in
                    SubjectView(subject: subject, dateFormatter: dateFormatter)
                    Divider()
                }
            }

            
        }
    }
}

struct GradesView_Previews: PreviewProvider {
    static var previews: some View {
        GradesView()
    }
}

