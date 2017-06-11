//
//  TransactionRecord.swift
//  AllPay
//
//  Created by ANGELOS CONSTANTINIDES on 11/06/2017.
//  Copyright © 2017 ANGELOS CONSTANTINIDES. All rights reserved.
//

import Foundation


class TransactionRecord
{
    private var tTransactionId:Int
    private var tMerchantId:Int
    private var tMerchantReference:String
    private var tAmount: Double;
    private var tCurrency:String
    private var tStatus:String
    private var tCreatedDate:String
    private var tId:Int
    private var tName:String
    private var tDescription:String
    private var tType:String
    
        required init(json: [String: Any])
        {
            self.tTransactionId = (json[TransactionRecordEnum.tTransactionId.rawValue] as? Int)!
            self.tMerchantId = (json[TransactionRecordEnum.tMerchantId.rawValue] as? Int)!
            self.tMerchantReference = (json[TransactionRecordEnum.tMerchantReference.rawValue] as? String)!
            self.tAmount = (json[TransactionRecordEnum.tAmount.rawValue] as? Double)!
            self.tCurrency = (json[TransactionRecordEnum.tCurrency.rawValue] as? String)!

            self.tStatus = (json[TransactionRecordEnum.tStatus.rawValue] as? String)!
            self.tCreatedDate = (json[TransactionRecordEnum.tCreatedDate.rawValue] as? String)!
            self.tId = (json[TransactionRecordEnum.tId.rawValue] as? Int)!

            self.tName = (json[TransactionRecordEnum.tName.rawValue] as? String)!
            self.tDescription = (json[TransactionRecordEnum.tDescription.rawValue] as? String)!
            self.tType = (json[TransactionRecordEnum.tType.rawValue] as? String)!


            // TODO: more fields!
        }
}
