//
//  LoginVc.swift
//  FileManager-UseDefauls
//
//  Created by DCS on 07/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class LoginVc: UIViewController {
    
    private var studarray = [student]()
    
    private let usertxt:UITextField = {
        let txt = UITextField()
        txt.placeholder = "ENTER USER NAME "
        txt.textColor = .blue
        txt.text = ""
        //txt.autocorrectionType = .
        txt.autocapitalizationType = .none
        txt.borderStyle = .roundedRect
        txt.textAlignment = .center
        txt.borderStyle = .roundedRect
        
        return txt
    }()
    private let pswdtxt:UITextField = {
        let txt = UITextField()
        txt.placeholder = "ENTER PASSWORD "
        txt.textColor = .blue
        txt.isSecureTextEntry = true
        txt.text = ""
        //txt.autocorrectionType = .
        txt.autocapitalizationType = .none
        txt.borderStyle = .roundedRect
        txt.textAlignment = .center
        txt.borderStyle = .roundedRect
        
        return txt
    }()
    
    private let mybtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("LOGIN", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.borderWidth = 5
        
        btn.addTarget(self, action: #selector(loginfunc), for: .touchUpInside)
        btn.backgroundColor = .gray
        btn.layer.cornerRadius = 27
        
        return btn
    }()
    @objc private func loginfunc(){
        
        
        
        if usertxt.text == "admin" && pswdtxt.text == "admin"
        {
            /* let vc = ViewController()
             navigationController?.pushViewController(vc, animated: true)*/
            
            let vc = ViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            nav.setNavigationBarHidden(false, animated: false)
            present(nav,animated: true)
            UserDefaults.standard.setValue("abcdefg", forKey: "adminToken")
            UserDefaults.standard.setValue(usertxt.text, forKey: "username")
            
            //self.dismiss(animated: false)
            
        }
        else
        {
            let scnt = studarray.count
            for i in 0..<scnt
            {
                if usertxt.text == studarray[i].spid && pswdtxt.text == studarray[i].password
                {
                    /*let vc = StudentVC()
                     navigationController?.pushViewController(vc, animated: true)*/
                    let vc = StudentVC()
                    let nav = UINavigationController(rootViewController: vc)
                    nav.modalPresentationStyle = .fullScreen
                    nav.setNavigationBarHidden(false, animated: false)
                    present(nav,animated: true)
                    
                    UserDefaults.standard.setValue("qwertyuiop", forKey: "studToken")
                    UserDefaults.standard.setValue(usertxt.text, forKey: "username")
                    // UserDefaults.standard.setValue(studarray[i].standard, forKey: "std")
                    //   UserDefaults.standard.setValue(studarray[i].studName, forKey: "name")
                    //   UserDefaults.standard.setValue(studarray[i].phoneno, forKey: "phone")
                    
                    //self.dismiss(animated: true)
                    break
                }
                else{
                    
                    let  alert = UIAlertController(title: "Incorrect!", message: "Username and password is incorrect !", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
                    DispatchQueue.main.async {
                        self.present(alert,animated: false,completion : nil)
                        
                    }
                }
            }
            
            
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "LOGIN"
        view.addSubview(pswdtxt)
        view.addSubview(usertxt)
        view.addSubview(mybtn)
        // Do any additional setup after loading the view.
        view.backgroundColor = .purple
        studarray  = sqlitehandler.shared.fetch()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        pswdtxt.text = ""
        usertxt.text = ""
        
        if UserDefaults.standard.string(forKey: "adminToken") != nil
            //("abcdefg", forKey: "adminToken"
        {
            /*let vc = ViewController()
             navigationController?.pushViewController(vc, animated: true)*/
            let vc = ViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            nav.setNavigationBarHidden(false, animated: true)
            present(nav,animated: true)
            
        }
        else if UserDefaults.standard.string(forKey: "studToken") != nil
            //("qwertyuiop", forKey: "studToken") != nil
        {
            /*let vc = StudentVC()
             navigationController?.pushViewController(vc, animated: true)*/
            let vc = StudentVC()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            nav.setNavigationBarHidden(false, animated: true)
            present(nav,animated: true)
            
        }
        /* else{
         print("Remain on login Screen")
         let vc = LoginVc()
         navigationController?.pushViewController(vc, animated: false)
         
         }*/
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        usertxt.frame = CGRect(x: 20,y: 300, width: view.width - 40, height: 50)
        pswdtxt.frame = CGRect(x: 20,y: usertxt.bottom + 10, width: view.width - 40, height: 50)
        mybtn.frame = CGRect(x: 20,y: pswdtxt.bottom + 10, width: view.width - 40, height: 50)
        
    }
    
}
