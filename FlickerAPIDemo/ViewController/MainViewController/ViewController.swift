//
//  ViewController.swift
//  FlickerAPIDemo
//
//  Created by will on 2022/1/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var keywordsTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var searButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiSetup()
    }
    

    //MARK: - 畫面設定
    
    func uiSetup() {
        textFieldUiSetup()
        searButton.isEnabled = false
    }
    
    ///判斷目前有無輸入內容
    func changeIsOpen() {
        if keywordsTextField.text?.isEmpty == false &&
           amountTextField.text?.isEmpty == false {
            //開啟按鈕使用
            searButton.isEnabled = true
            changButtonStyle()
        } else {
            searButton.isEnabled = false
            changButtonStyle()
        }
    }
    
    ///更換按鈕顯示狀態顏色
    func changButtonStyle() {
        if searButton.isEnabled {
            searButton.alpha = 1
        } else {
            searButton.alpha = 0.3
        }
    }
    
    //MARK: - action
    
    //關鍵字
    @IBAction func keywordsTextFieldImport(_ sender: UITextField) {
        changeIsOpen()
    }
    
    //搜尋數量
    @IBAction func amountTextFieldImport(_ sender: UITextField) {
        changeIsOpen()
    }
    
    @IBAction func searchButtonClick(_ sender: UIButton) {
        
    }
}

extension ViewController: UITextFieldDelegate {
    
    ///textField 設定
    func textFieldUiSetup() {
        keywordsTextField.delegate = self
        amountTextField.delegate = self
        
        keywordsTextField.returnKeyType = .done
        amountTextField.returnKeyType = .done
    }
    
    //點擊回覆 關閉鍵盤
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        keywordsTextField.resignFirstResponder()
        amountTextField.resignFirstResponder()
        return true
    }
    
    //點擊空白處關閉鍵盤
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
