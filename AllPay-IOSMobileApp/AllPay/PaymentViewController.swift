//
//  FirstViewController.swift
//  yaPay
//
//  Created by Angelos Constantinides on 10/06/2017.
//  Copyright © 2017 Angelos Constantinides. All rights reserved.
//

import UIKit
import AVFoundation
import LocalAuthentication

class PaymentViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate
{
    @IBOutlet var m_ScannerView: UIView!
    @IBOutlet weak var m_OptionsView: UIView!
    @IBOutlet weak var m_MerchantLabel: UILabel!
    @IBOutlet weak var m_AmountLabel: UILabel!
    @IBOutlet weak var makePaymentButton: UIButton!
    
    private var m_CaptureSession:AVCaptureSession?
    private var m_VideoPreviewLayer:AVCaptureVideoPreviewLayer?
    private var qrCodeFrameView:UIView?
    private var m_Message: String?
    
    private var m_PaymentRecord : PaymentRecord?

    private var m_MerchantValid : Bool?
    
    
    
    @IBAction func makePayment(_ sender: Any)
    {
        // 1. Create a authentication context
        let authenticationContext = LAContext()
        var error:NSError?
        
        // 2. Check if the device has a fingerprint sensor
        // If not, show the user an alert view and bail out!
        guard authenticationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else
        {
            showAlertViewIfNoBiometricSensorHasBeenDetected()
            return
        }
        
        // 3. Check the fingerprint
        authenticationContext.evaluatePolicy(
            LAPolicy.deviceOwnerAuthenticationWithBiometrics,
            localizedReason: "Payment Requires Authentication",
            reply: { [unowned self] (success, error) -> Void in
                
                if ( error != nil && !success )
                {
                    let message = self.errorMessageForLAErrorCode(errorCode: error!._code)
                    self.showAlertViewAfterEvaluatingPolicyWithMessage(message: message)
                }
                else
                {
                    // Fingerprint recognized
                    // Go to view controller
                    self.navigateToAuthenticatedViewController()
                    
                }
                
        })
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let captureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        
        do {
            // Get an instance of the AVCaptureDeviceInput class using the previous device object.
            let input = try AVCaptureDeviceInput(device: captureDevice)
            
            // Initialize the captureSession object.
            self.m_CaptureSession = AVCaptureSession()
            
            // Set the input device on the capture session.
            self.m_CaptureSession?.addInput(input)
            
            
            // Initialize a AVCaptureMetadataOutput object and set it as the output device to the capture session.
            let captureMetadataOutput = AVCaptureMetadataOutput()
            self.m_CaptureSession?.addOutput(captureMetadataOutput)
            
            // Set delegate and use the default dispatch queue to execute the call back
            captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            captureMetadataOutput.metadataObjectTypes = [AVMetadataObjectTypeQRCode]
            
            
            // Initialize the video preview layer and add it as a sublayer to the viewPreview view's layer.
            self.m_VideoPreviewLayer = AVCaptureVideoPreviewLayer(session: self.m_CaptureSession)
            self.m_VideoPreviewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
            self.m_VideoPreviewLayer?.frame = self.m_ScannerView.layer.bounds
            self.m_ScannerView.layer.addSublayer(self.m_VideoPreviewLayer!)
            
            // Start video capture.
            self.m_CaptureSession?.startRunning()
            
            self.qrCodeFrameView = UIView()
            
            if let qrCodeFrameView = qrCodeFrameView {
                qrCodeFrameView.layer.borderColor = UIColor.green.cgColor
                qrCodeFrameView.layer.borderWidth = 2
                self.m_ScannerView.addSubview(qrCodeFrameView)
                self.m_ScannerView.bringSubview(toFront: qrCodeFrameView)
            }
            
        } catch {
            // If any error occurs, simply print it out and don't continue any more.
            print(error)
            return
        }
        
        
        
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!)
    {
        
        // Check if the metadataObjects array is not nil and it contains at least one object.
        if metadataObjects == nil || metadataObjects.count == 0
        {
            qrCodeFrameView?.frame = CGRect.zero
            self.m_Message = "No QR code is detected"
            return
        }
        
        // Get the metadata object.
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        if metadataObj.type == AVMetadataObjectTypeQRCode
        {
            // If the found metadata is equal to the QR code metadata then update the status label's text and set the bounds
            let barCodeObject = self.m_VideoPreviewLayer?.transformedMetadataObject(for: metadataObj)
            qrCodeFrameView?.frame = barCodeObject!.bounds
            
            if metadataObj.stringValue != nil {
                self.m_Message = metadataObj.stringValue
                let valuesArray : [String] = self.m_Message!.components(separatedBy: ";")
                
                self.m_MerchantLabel.text = valuesArray[0]
                self.m_AmountLabel.text = valuesArray[1]
                
                self.m_PaymentRecord = PaymentRecord(merchantId: valuesArray[0],amount: Double(valuesArray[1])!, referencedID: valuesArray[2])
                
                self.m_MerchantValid = self.GetMerchantStatus()
                print(self.m_MerchantValid!)
                if(self.m_MerchantValid!)
                {
                    print(self.m_PaymentRecord!)
                    self.m_CaptureSession?.stopRunning()
                }
                else
                {
                    
                }
            }
        }
    }
    
    func getMessage() -> String
    {
        return self.m_Message!
    }
    
    
    /**
     This method will present an UIAlertViewController to inform the user that the device has not a TouchID sensor.
     */
    func showAlertViewIfNoBiometricSensorHasBeenDetected()
    {
        showAlertWithTitle(title: "Error", message: "This device does not have a TouchID sensor.")
    }
    
    /**
     This method will present an UIAlertViewController to inform the user that there was a problem with the TouchID sensor.
     
     - parameter error: the error message
     
     */
    func showAlertViewAfterEvaluatingPolicyWithMessage( message:String )
    {
        showAlertWithTitle(title: "Error", message: message)
    }
    
    /**
     This method presents an UIAlertViewController to the user.
     
     - parameter title:  The title for the UIAlertViewController.
     - parameter message:The message for the UIAlertViewController.
     
     */
    func showAlertWithTitle( title:String, message:String )
    {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertVC.addAction(okAction)
        
        DispatchQueue.main.async() { () -> Void in
            
            self.present(alertVC, animated: true, completion: nil)
            
        }
    }
    
    /**
     This method will return an error message string for the provided error code.
     The method check the error code against all cases described in the `LAError` enum.
     If the error code can't be found, a default message is returned.
     
     - parameter errorCode: the error code
     - returns: the error message
     */
    func errorMessageForLAErrorCode( errorCode:Int ) -> String
    {
        var message = ""
        
        switch errorCode
        {
        case LAError.appCancel.rawValue:
            message = "Authentication was cancelled by application"
            
        case LAError.authenticationFailed.rawValue:
            message = "The user failed to provide valid credentials"
            
        case LAError.invalidContext.rawValue:
            message = "The context is invalid"
            
        case LAError.passcodeNotSet.rawValue:
            message = "Passcode is not set on the device"
            
        case LAError.systemCancel.rawValue:
            message = "Authentication was cancelled by the system"
            
        case LAError.touchIDLockout.rawValue:
            message = "Too many failed attempts."
            
        case LAError.touchIDNotAvailable.rawValue:
            message = "TouchID is not available on the device"
            
        case LAError.userCancel.rawValue:
            message = "The user did cancel"
            
        case LAError.userFallback.rawValue:
            message = "The user chose to use the fallback"
            
        default:
            message = "Did not find error code on LAError object"
            
        }
        
        return message
        
    }
    
    /**
     This method will push the authenticated view controller onto the UINavigationController stack
     */
    func navigateToAuthenticatedViewController()
    {
        let urlString = "http://codeduomobileapi.azurewebsites.net/api/Transfers/1/\(self.m_PaymentRecord!.MerchantID)/\(self.m_PaymentRecord!.Amount)/\(self.m_PaymentRecord!.ReferenceID)"
        
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with:url!) { (data, response, error) in
            if error != nil {
                print(error!)
            } else {
                do {
                    
                    let parsedData = try JSONSerialization.jsonObject(with: data!) as! [String:Any]
                    
                    DispatchQueue.main.async()
                    {
                        
                        self.m_PaymentRecord?.PaymentStatus = (parsedData["status"] as! String) == "success"
                    }
                } catch let error as NSError {
                    print(error)
                }
            }
            
            }.resume()
        
        //showAlertWithTitle(title: "Testing This", message: "PRR")
    }
    
    func GetMerchantStatus() -> Bool
    {
        let urlString = "http://codeduomobileapi.azurewebsites.net/api/AcceptPayments/\(self.m_PaymentRecord!.MerchantID)"
        
        let url = URL(string: urlString)
        
        var merchantEligibility : String = "false"
        
        URLSession.shared.dataTask(with:url!) { (data, response, error) in
            if error != nil {
                print(error!)
            } else {
                do {
                    
                    let parsedData = try JSONSerialization.jsonObject(with: data!) as! [String:Any]
                    
                    DispatchQueue.main.async() {
                        
                        
                        
                        merchantEligibility = parsedData["CanAccept"] as! String
                       
                    }
                } catch let error as NSError {
                    print(error)
                }
            }
            
            }.resume()
        
        if( merchantEligibility == "true")
        {
            return true
        }
        else
        {
            return false
        }
    }
    
}
