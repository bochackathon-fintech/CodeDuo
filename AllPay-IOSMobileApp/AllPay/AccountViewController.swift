//
//  AccountViewController.swift
//  allPay
//
//  Created by ANGELOS CONSTANTINIDES on 10/06/2017.
//  Copyright © 2017 Angelos Constantinides. All rights reserved.
//

import UIKit
import Foundation
import CoreFoundation
import CFNetwork

class AccountViewController: UIViewController
{
    @IBOutlet weak var m_AccountLabelValue: UILabel!
    @IBOutlet weak var m_IBANNumberLabelValue: UILabel!
    @IBOutlet weak var m_BalanceLabelValue: UILabel!
    @IBOutlet weak var m_CurrencyLabelValue: UILabel!
    @IBOutlet weak var m_AccountQRCode: UIImageView!
    @IBOutlet weak var m_UI_QRCodeImage: UIImageView!
    
    private var m_AccountNumber: String?
    private var m_IbanNumber: String?
    private var m_Balance: Double = -1.00
    private var m_Currency : String?
    private var m_SpenderID : Int = 1;
    private var m_CurrencyID : Int = 0
    private let c_Currencies = ["BTC","EUR","PLN","USD","CNY"]


    

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.LoadAccountDetails(spenderID: self.m_SpenderID, onCompletion:
            { (finished,success) -> Void in
                if(finished && success)
                {
                    self.GenerateQRCode(onCompletion: { (finished, success) in
                        if(finished && success)
                        {
                            print("QR Code Should Be Ready")
                        }
                        else
                        {
                            print("QR Code Generation Failed")
                        }
                    })
                }
                else
                {
                    print("Unsupported Currency or Bad API Call")
                }
            })
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func LoadAccountDetails(spenderID:Int, onCompletion: @escaping (_:Bool, _:Bool ) -> Void )
    {
        
        let urlString = "http://codeduomobileapi.azurewebsites.net/api/Accounts/\(spenderID)/\(self.GetCurrencyAlpha3())"
        
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with:url!) { (data, response, error) in
            if error != nil
            {
                print(error!)
                onCompletion(true,false)
            }
            else
            {
                do
                {
                    let parsedData = try JSONSerialization.jsonObject(with: data!) as! [String:Any]
                    self.m_Balance = parsedData["balance"] as! Double
                    if( self.m_Balance > 0)
                    {
                    
                        self.m_AccountNumber = parsedData["number"] as? String
                    
                        self.m_IbanNumber = parsedData["iban"] as? String
                    
                        self.m_Currency = parsedData["currency"] as? String
                        
                         DispatchQueue.main.async
                        {
                            self.m_BalanceLabelValue.text = "\(self.m_Balance)"
                            self.m_AccountLabelValue.text=self.m_AccountNumber
                            self.m_IBANNumberLabelValue.text = self.m_IbanNumber
                            self.m_CurrencyLabelValue.text = self.m_Currency
                        }
                        
                        onCompletion(true,true)
                    }
                    else
                    {
                        onCompletion(true,false)
                    }

                }
                catch let error as NSError
                {
                    print(error)
                    onCompletion(true,false)
                }
            }
            
            }.resume()
    }
    
    func GenerateQRCode(onCompletion: @escaping (_:Bool, _:Bool ) -> Void )
    {
            let qr_data : String = "Contact|\(self.m_SpenderID)"

            
            let data = qr_data.data(using: String.Encoding.isoLatin1)
            
            if let filter = CIFilter(name: "CIQRCodeGenerator")
            {
                filter.setValue(data, forKey: "inputMessage")
                filter.setValue("H", forKey: "inputCorrectionLevel")
                let transform = CGAffineTransform(scaleX: 1, y: 1)
                if let output = filter.outputImage?.applying(transform)
                {
                    DispatchQueue.main.async
                    {
                        self.m_UI_QRCodeImage.image = UIImage(ciImage:output)
                        onCompletion(true,true)
                    }
                }
            }
    }
    
    private func GetCurrencyAlpha3() -> String
    {
        print(self.c_Currencies[self.m_CurrencyID])
        return self.c_Currencies[self.m_CurrencyID];
    }
    

    
    @IBAction func ViewSwipe(_ sender: UISwipeGestureRecognizer)
    {
        if sender.direction == UISwipeGestureRecognizerDirection.right
        {
            self.m_CurrencyID = abs(( self.m_CurrencyID - 1 ) % 5)
            print(self.m_CurrencyID)
            print("Swipe Right")
        }
        else if sender.direction == UISwipeGestureRecognizerDirection.left
        {
            self.m_CurrencyID = abs(( self.m_CurrencyID + 1 ) % 5)
            print(self.m_CurrencyID)

            print("Swipe Left")
        }
        self.LoadAccountDetails(spenderID: self.m_SpenderID, onCompletion:
            { (finished,success) -> Void in
                if(finished && success)
                {
                    print("Loading New Currency Done")
                }
                else
                {
                    print("Loading New Currency Done")
                }
        })

    }
    
    func showAlertWithTitle( title:String, message:String )
    {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertVC.addAction(okAction)
        
        DispatchQueue.main.async() { () -> Void in
            
            self.present(alertVC, animated: true, completion: nil)
            
        }
    }
    /*func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {

    }*/
}
