//
//  MCSetting.swift
//  iMuzik1
//
//  Created by Anh Son Le on 4/7/16.
//  Copyright © 2016 Anh Son Le. All rights reserved.
//

import Foundation

class MCSetting {
    var title: String?
    var content: String?
    
    init(title: String, content: String){
        self.title = title
        self.content = content
    }

    static func makeDemoList() -> [MCSetting] {
        let list = [
            MCSetting(title: "About", content: "Đây là đoạn text demo about và không scroll được"),
            MCSetting(title: "Copyright", content: "Đây là đoạn text demo copyright cũng không scroll đc, icon và âm thanh được clone từ noiseli.com"),
            MCSetting(title: "More apps", content: "Đúng ra các more app không phải là một text như thế này :D Để demo scroll đoạn text sẽ copy nhiều lần :v Đúng ra các more app không phải là một text như thế này :D Để demo scroll đoạn text sẽ copy nhiều lần :v Đúng ra các more app không phải là một text như thế này :D Để demo scroll đoạn text sẽ copy nhiều lần :v Đúng ra các more app không phải là một text như thế này :D Để demo scroll đoạn text sẽ copy nhiều lần :v Đúng ra các more app không phải là một text như thế này :D Để demo scroll đoạn text sẽ copy nhiều lần :v Đúng ra các more app không phải là một text như thế này :D Để demo scroll đoạn text sẽ copy nhiều lần :v Đúng ra các more app không phải là một text như thế này :D Để demo scroll đoạn text sẽ copy nhiều lần :v Đúng ra các more app không phải là một text như thế này :D Để demo scroll đoạn text sẽ copy nhiều lần :v Đúng ra các more app không phải là một text như thế này :D Để demo scroll đoạn text sẽ copy nhiều lần :v Đúng ra các more app không phải là một text như thế này :D Để demo scroll đoạn text sẽ copy nhiều lần :v Đúng ra các more app không phải là một text như thế này :D Để demo scroll đoạn text sẽ copy nhiều lần :v Đúng ra các more app không phải là một text như thế này :D Để demo scroll đoạn text sẽ copy nhiều lần :v Đúng ra các more app không phải là một text như thế này :D Để demo scroll đoạn text sẽ copy nhiều lần :v Đúng ra các more app không phải là một text như thế này :D Để demo scroll đoạn text sẽ copy nhiều lần :v Đúng ra các more app không phải là một text như thế này :D Để demo scroll đoạn text sẽ copy nhiều lần :v Đúng ra các more app không phải là một text như thế này :D Để demo scroll đoạn text sẽ copy nhiều lần :v HẾT")
        ]
        return list
    }
}
