//
//  ViewController.swift
//  HomeworkUiKit
//
//  Created by Hiếu đang cáu on 16/10/2023.
//

import UIKit

class ViewController: UIViewController {

   

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var txt: UITextField!
    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageSetUp()
        setupButton()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onclick(_ sender: Any) {
        guard let text = txt.text else {
            return
        }
        if let number = Double(text){
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            // Mã tiền tệ (USD, EUR, VND, ...)
            let result1: Double = caculator(txt: number)
            let res : Int = Int(round(result1))
            let res1: String? = formatter.string(from: NSNumber(value: res))
            let resuiltString = res1! + "  VND"
            result.text = String(resuiltString)
            result.textColor = UIColor.red
        }else{
            return
        }
    }
    func imageSetUp(){
        imgView.image = UIImage(named: "Img1")
    }
    
    func setupButton(){
      
    }
    
    func caculator(txt: Double) -> Double{
        var sum: Double = 0
        switch txt {
            case 0...50:
                sum = txt*1.678
                break
            case 51...100:
                sum = 50 * 1.678
                sum+=(txt-50)*1.734
                break
        case 101...200:
                sum = 50 * 1.678 + (50)*1.734
                sum+=(txt-100)*2.014
                break
        case 201...300:
            sum = 50 * 1.678 + (50)*1.734 + 100*2.014
            sum+=(txt-200)*2.536
            break
        case 301...400:
            sum = (50)*1.678 + (50)*1.734
            sum+=100*2.834 + 100*2.014
            sum+=(txt-300)*2.834
            break
        default:
            sum = 50*1.678 + (50)*1.734 + 100*2.014
            sum+=100*2.536+100*2.834
            sum+=(txt-400)*2.927
            break
        }
        return sum*1000
    }
}

