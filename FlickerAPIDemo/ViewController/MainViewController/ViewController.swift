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
    
    var getImageData: [Photo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getNetworkData()
        print("測試 getImage", getImageData)
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
    
    //MARK: - 打api
    
    func getNetworkData() {
        if let url = URL(string: "https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=92f6eae65389a44f4072b37292cb739a&text=%E5%B0%8F%E8%B2%93&format=json&nojsoncallback=1&auth_token=72157720830939436-6ce9fe63723beaa2&api_sig=ce9997ff237b49b36271abb46c1fc735") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let searchResponse = try JSONDecoder().decode(SearchResponse.self, from: data)
                        self.getImageData = searchResponse.photos.photo
                        
                    } catch {
                        print("ViewController getNetworkData get searchResponse catch", error)
                    }
                } else {
                    print("ViewController getNetworkData get searchResponse error")
                }
            }.resume()
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
        let controller = ShowImageViewController()
        self.navigationController?.pushViewController(controller, animated: true)
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
