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
            HStack {
                Text("Осень 2024")
                    .font(.custom("Inter-Regular_Bold", size: 18))
                    .foregroundColor(Color("AccentColor"))
                Spacer()
                Image("dropDownIcon")
            }
            .padding()

            ScrollView {
                ForEach(subjects) { subject in
                    SubjectView(subject: subject, dateFormatter: dateFormatter)
                    Divider()
                }
            }

            
        }
    }
}

struct SubjectView: View {
    var subject: Subject
    var dateFormatter: DateFormatter

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text(subject.name)
                    .font(.custom("Inter-Regular_SemiBold", size: 16))
                    .foregroundColor(Color("AccentColor"))
                    .frame(width: 300, alignment: .leading)
                Spacer()
                VStack{
                    Text("Средний\nбалл")
                        .font(.custom("Inter-Regular_SemiBold", size: 8))
                        .foregroundColor(Color("secondaryColor"))
                        .padding(.bottom, 0.5)
                    
                    Text("\(subject.averageGrade, specifier: "%.1f")")
                        .font(.custom("Inter-Regular_SemiBold", size: 12))
                        .foregroundColor(Color("AccentColor"))

                }
            }
            .padding(.bottom, 2)

            Text(subject.examinationType)
                .font(.custom("Inter-Regular_Medium", size: 12))
                .foregroundColor(Color("secondaryColor"))
            Text(subject.teacher)
                .font(.custom("Inter-Regular_Medium", size: 12))
                .foregroundColor(Color("secondaryColor"))

            // Заголовки таблицы
            TableHeaderView()

            // Таблица с оценками
            ForEach(subject.gradeList) { grade in
                GradeRowView(grade: grade, dateFormatter: dateFormatter)
            }
        }
        .padding()
    }
}

struct TableHeaderView: View {
    var body: some View {
        HStack {
            Text("Название")
                .font(.custom("Inter-Regular_SemiBold", size: 12))
                .foregroundColor(Color("secondaryColor"))
                .frame(width: 180, alignment: .topLeading)
            Text("Вес")
                .font(.custom("Inter-Regular_SemiBold", size: 12))
                .foregroundColor(Color("secondaryColor"))
                .frame(width: 30, alignment: .topLeading)
            Text("Дата")
                .font(.custom("Inter-Regular_SemiBold", size: 12))
                .foregroundColor(Color("secondaryColor"))
                .frame(width: 70, alignment: .topLeading)
            Text("Оценка")
                .font(.custom("Inter-Regular_SemiBold", size: 12))
                .foregroundColor(Color("secondaryColor"))
                .frame(width: 60, alignment: .topLeading)
        }
        .padding(.top, 10)
    }
}

struct GradeRowView: View {
    var grade: Grade
    var dateFormatter: DateFormatter

    var body: some View {
        HStack {
            Text(grade.name)
                .font(.custom("Inter-Regular_Medium", size: 10))
                .foregroundColor(Color("AccentColor"))
                .frame(width: 180, alignment: .topLeading)

            Text("\(grade.weight)")
                .font(.custom("Inter-Regular_Medium", size: 10))
                .foregroundColor(Color("AccentColor"))
                .frame(width: 30, alignment: .topLeading)

            Text("\(grade.weekNumber) неделя\n \(dateFormatter.string(from: grade.dateStart))-\n\(dateFormatter.string(from: grade.dateEnd))")
                .font(.custom("Inter-Regular_Medium", size: 10))
                .foregroundColor(Color("AccentColor"))
                .frame(width: 70, alignment: .topLeading)

            Text("\(grade.mark)\n(\(dateFormatter.string(from: grade.markDate)))")
                .font(.custom("Inter-Regular_Medium", size: 10))
                .foregroundColor(Color("AccentColor"))
                .frame(width: 60, alignment: .topLeading)
        }
        .frame(height: 40)
        .padding(.vertical, 3)
    }
}


struct GradesView_Previews: PreviewProvider {
    static var previews: some View {
        GradesView()
    }
}
