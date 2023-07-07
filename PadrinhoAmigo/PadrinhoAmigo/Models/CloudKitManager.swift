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
  private let recordType = "User"
  private let publicDatabase = CKContainer(identifier: "iCloud.com.academy.PadrinhoAmigo").publicCloudDatabase
  func fetch() async throws -> [CKRecord] {
    let pred = NSPredicate(value: true)
    let query = CKQuery(recordType: recordType, predicate: pred)
    let result = try await publicDatabase.records(matching: query)
    let records = try result.matchResults.map({ try $0.1.get() })
    return records
  }
}









