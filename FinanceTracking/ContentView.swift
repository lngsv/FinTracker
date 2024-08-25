//
//  ContentView.swift
//  FinanceTracking
//
//  Created by Alan Gasiev on 2024-08-22.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    @State private var updateDate = Date()
    @State private var newScore = ""

    var body: some View {
        NavigationStack {
            List {
                ForEach(Array(items.enumerated()), id: \.1.id) { idx, item in
                    // TODO: add move
                    // TODO: add edit
                    let diff = idx == 0 ? 0 : item.score - items[idx-1].score
                    let (diffText, diffStyle) = formatDiff(idx: idx, diff: diff)
                    HStack {
                        Text(item.date, format: Date.FormatStyle(date: .numeric))
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text("\(item.score)")
                                .fontWeight(.bold)
                            Text(diffText)
                                .foregroundStyle(diffStyle)
                        }

                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    NavigationLink(
                        destination: AddView(newScore: $newScore, updateDate: $updateDate),
                        label: {Label("", systemImage: "plus")}
                    )
                }
            }
            .navigationTitle("Credit Score")
        }
    }

    private func formatDiff(idx: Int, diff: Int) -> (String, Color) {
        if idx == 0 {
            return ("first", .gray)
        }

        if diff < 0 {
            return ("\(diff)", .red)
        }

        if diff > 0 {
            return ("+\(diff)", .green)
        }

        return ("0", .gray)
    }



    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

struct AddView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    @Binding var newScore: String
    @Binding var updateDate: Date

    var body: some View {
        Form {
            DatePicker("Score update date", selection: $updateDate, displayedComponents: [.date])
            TextField("New score", text: $newScore)
            if isNumber() {
                Button(action: addItem) {
                    Label("Add Item", systemImage: "square.and.arrow.down")
                }
            } else if !newScore.isEmpty {
                HStack{
                    Spacer()
                    Text("A decimal integer expected")
                        .foregroundStyle(.red)
                }
            }
        }
    }

    private func isNumber() -> Bool {
        if Int(newScore) != nil {
            return true
        }
        return false
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(date: updateDate, score: Int(newScore) ?? 0)
            modelContext.insert(newItem)
            newScore = ""
            dismiss.callAsFunction()
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
//    AddView(newScore: .constant(1), updateDate: .constant(Date()))

}
