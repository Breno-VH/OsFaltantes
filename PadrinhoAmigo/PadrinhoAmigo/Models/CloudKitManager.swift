//
//  CloudKitManager.swift
//  PadrinhoAmigo
//
//  Created by Larissa Okabayashi on 03/07/23.
//

import Foundation
import CloudKit
enum FetchError {
  case fetchingError, noRecords, none
}
struct CloudKitManager {
  private let recordFields = ["afilhados",
                              "ano",
                              "curso",
                              "entidades",
                              "experiencia",
                              "imagem",
                              "interesses",
                              "name",
                              "origem",
                              "padrinhos",
                              "pronomes",
                              "descricao"
  
  ]
    
  private let recordType = "User"
  private let publicDatabase = CKContainer(identifier: "iCloud.com.academy.PadrinhoAmigo").publicCloudDatabase
  
    func fetch() async throws -> [CKRecord] {
    let pred = NSPredicate(value: true)
    let query = CKQuery(recordType: recordType, predicate: pred)
    let result = try await publicDatabase.records(matching: query)
    let records = try result.matchResults.map({ try $0.1.get() })
    return records
  }

    func fetch(recordsId: [CKRecord.ID]) async throws-> [CKRecord] {
        var records = [CKRecord]()
        do {
            let result = try await publicDatabase.records(for: recordsId, desiredKeys: nil)
            records = try result.map({ try $0.value.get() })
        } catch {
            print(error.localizedDescription)
        }
        
        return records
    }
    
    
    func updateParentsList(godSon: User, godParent: User) {
        let godSonRecord: CKRecord = godSon.record!
        let godParentRecord: CKRecord = godParent.record!
        
        var listGodParents = godSon.godParents!
        listGodParents.append(godParentRecord.recordID)
        
        let godParentsReferences = listGodParents.map({
            CKRecord.Reference(recordID: $0, action: .none)
        })
        godSonRecord["padrinhos"] = godParentsReferences
        
        var listGodChildren = godParent.godChildren!
        listGodChildren.append(godSonRecord.recordID)
        let godChildrenReferences = listGodChildren.map({
            CKRecord.Reference(recordID: $0, action: .none)
        })
        godParentRecord["afilhados"] = godChildrenReferences
        
        publicDatabase.save(godSonRecord) { newRecord, error in
            if let error = error {
                print(error)
            } else {
                if let _ = newRecord {
                    print("SAVED")
                }
            }
        }
        
        publicDatabase.save(godParentRecord) { newRecord, error in
            if let error = error {
                print(error)
            } else {
                if let _ = newRecord {
                    print("SAVED")
                }
            }
            
        }
        
    }
    
    func fetchUser(email: String, password: String) async throws -> CKRecord? {
        let pred = NSPredicate(format: "email == %@ AND senha == %@", email, password)
        let query = CKQuery(recordType: recordType, predicate: pred)
        let result = try await publicDatabase.records(matching: query)
        let records = try result.matchResults.map({ try $0.1.get() })
        return records.first
    }
    
    
    func save(user: User)  {
        let record = CKRecord(recordType: recordType)
        record.setValuesForKeys(["ano": user.year!, "curso": user.course!,
                                 "entidades": user.entities ?? [], "descricao": user.description ?? "",
                                 "experiencia": user.experience ?? [], "interesses": user.interests ?? [],
                                 "name": user.name, "origem": user.origin!, "pronomes": user.pronouns!, "senha": user.password!, "email": user.email!])
        
        
        publicDatabase.save(record) { newRecord, error in
            if let error = error {
                print(error)
            } else {
                if let _ = newRecord {
                    print("SAVED")
                }
            }
            
        }
       
    }

}









