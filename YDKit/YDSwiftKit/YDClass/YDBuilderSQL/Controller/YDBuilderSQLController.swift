//
//  YDBuilderSQLController.swift
//  YDKit
//
//  Created by 王允顶 on 2018/8/16.
//  Copyright © 2018年 王允顶. All rights reserved.
//

import UIKit

class YDBuilderSQLController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBaseParameter()
        self.view.addSubview(self.sqlLabel)
        
        let selectSQLBuilder = YDSQLSelectBuilder()
        var wh = [String: Any]()
        wh["age"] = 18
        wh["name"] = "Dream"
        let sql: String = selectSQLBuilder.select().all().from().table("student").wh().whAnd(wh).build()
        self.sqlLabel.text = sql;
        print("SQL: " + sql)
        
        //单行SQL语句
//        var colums = Array<String>()
//        colums.append("id")
//        colums.append("name")
//        colums.append("age")
//
//        var values = Array<Any>()
//        values.append(1)
//        values.append("Dream")
//        values.append(18)
//
//        let insert = YDSQLInsertBuilder()
//        let sql = insert.insert().into().table("student").colums(colums).values(values).build()
//        self.sqlLabel.text = sql
//        print("SQL: " + sql)

        //批量插入SQL语句
//        var colums = Array<String>()
//        colums.append("id")
//        colums.append("name")
//        colums.append("age")
//
//        var batchValues = Array<Array<Any>>()
//
//        var values1 = Array<Any>()
//        values1.append(3)
//        values1.append("Dream")
//        values1.append(19)
//        batchValues.append(values1)
//
//        var values2 = Array<Any>()
//        values2.append(4)
//        values2.append("阳光种在风雨后")
//        values2.append(20)
//        batchValues.append(values2)
//
//        let insert = YDSQLInsertBuilder()
//        let sql = insert.insert().into().table("student").colums(colums).batchValues(batchValues).build()
//        print("SQL: " + sql)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    lazy var sqlLabel: UILabel = {
        let label: UILabel = UILabel(frame: CGRect(x: 13, y: 80, width: self.view.frame.size.width - 30, height: 50))
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        return label
    }()

}

extension YDBuilderSQLController {
    func setBaseParameter() {
        self.navigationItem.title = "构建者模式SQL"
        self.view.backgroundColor = UIColor.white
        self.addNavigationBack()
    }
}
