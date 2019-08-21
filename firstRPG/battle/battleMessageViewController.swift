//
//  battleSceneViewController.swift
//  firstRPG
//
//  Created by 吉澤優衣 on 2019/08/20.
//  Copyright © 2019 吉澤優衣. All rights reserved.
//

import UIKit


class battleMessageViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!    // プレイヤーの名前
    @IBOutlet weak var hpLabel: UILabel!    // HP
    @IBOutlet weak var mpLabel: UILabel!    // MP
    @IBOutlet weak var lvLabel: UILabel!    // Lv
    
    @IBOutlet weak var monsterImage1: UIImageView!    // モンスター画像
    @IBOutlet weak var monsterImage2: UIImageView!
    @IBOutlet weak var monsterImage3: UIImageView!
    @IBOutlet weak var monsterImage4: UIImageView!
    
    @IBOutlet weak var messageTextView: UITextView!    // バトルメッセージ
    


    /// どのモンスターとエンカウントしたかの情報を受け取る
    var monster:[Int] = []

    /// 今どのモンスターが生きてるか
    //var currentMonster:[Int] = []

    /// メインボタンを押した時に画面遷移するかどうか判断
    //var toSelect: Bool = false



    /// 【プレイヤーのパラメータ】
    var player: [String: Int] = [
        "Lv": 1,    // レベル
        "maxHP": 50,    // 最大HP
        "maxMP": 10,    // 最大MP
        "atk": 20,    // 攻撃力
        "def": 10,    // 守備力
        "agi": 8,    // すばやさ
        "itemAtk": 0,    // 装備の攻撃力
        "itemDef": 0,    // 装備の守備力
        "exp": 0,    // 経験値
        "gold": 0    // 所持金
    ]

    // 3 ヒール
    // 7 ひのたま
    // 12 つららおとし
    // 16 しょうげきは
    // 20 ライトビーム
    // 23 メガヒール
    // 28 スターダスト





    // 【モンスターデータ共通の入れ物】
    var monsterData: [String: Int] = [
        "maxHP": 0,    // 最大HP
        "atk": 0,    // 攻撃力
        "def": 0,    // 守備力
        "agi": 0,    // すばやさ
        "exp": 0,    // 経験値
        "gold": 0    // ゴールド
    ]

    // 【モンスター情報】
    let monsterStatus: [[Int]] = [
        [1, 1,  1,  1,  1,  1],    // 0. スライム
        [1, 1,  1,  1,  1,  1],    // 1. バット
        [1, 1,  1,  1,  1,  1],    // 2. マタンゴ
        [1, 1,  1,  1,  1,  1],    // 3. ピヨネズミ
        [1, 1,  1,  1,  1,  1],    // 4. レイン
        [1, 1,  1,  1,  1,  1],    // 5. プランタ
        [1, 1,  1,  1,  1,  1],    // 6. ボーン
        [1, 1,  1,  1,  1,  1],    // 7. ラコステ
        [1, 1,  1,  1,  1,  1],    // 8. ナルシカラス
        [1, 1,  1,  1,  1,  1],    // 9. ゴーレム
        [1, 1,  1,  1,  1,  1],    // 10. トロール
        [1, 1,  1,  1,  1,  1],    // ハーミット
        [1, 1,  1,  1,  1,  1]    // ティグレ
    ]

    // モンスターの名前
    let monsterName: [String] = [
        "スライム",
        "バット",
        "マタンゴ",
        "ピヨネズミ",
        "レイン",
        "プランタ",
        "ボーン",
        "ラコステ",
        "ナルシカラス",
        "ナルシカラス",
        "ゴーレム",
        "トロール",
        "ハーミット",
        "ティグレ"
    ]





    override func viewDidLoad() {
        super.viewDidLoad()
        // 画面にモンスター画像を表示
        appearMonster()
        //print(monster)
        // 画面遷移OK
       // toSelect = true
    }

    override func viewWillAppear(_ animated: Bool) {
        //appearMonster()


    }





    // 【画面上にモンスターを出現させる処理】
    func appearMonster() {
        // モンスター何匹出現させる？
        switch monster.count {
        case 2:    // 2匹なら
            // どのモンスター？
            // 1匹目
            let monsterName1 = monsterName[monster[0]]    // 1匹目の名前を取得
            monsterImage2.image = UIImage(named: "\(monsterName1)")    // 1匹目の画像を表示
            // 2匹目
            let monsterName2 = monsterName[monster[1]]    // 2匹目の名前を取得
            monsterImage3.image = UIImage(named: "\(monsterName2)")    // 2匹目の画像を表示

        case 4:    // 4匹なら
            // どのモンスター？
            // 1匹目
            let monsterName3 = monsterName[monster[0]]    // 1匹目の名前を取得
            monsterImage1.image = UIImage(named: "\(monsterName3)")    // 1匹目の画像を表示
            // 2匹目
            let monsterName4 = monsterName[monster[1]]    // 2匹目の名前を取得
            monsterImage2.image = UIImage(named: "\(monsterName4)")    // 2匹目の画像を表示
            // 3匹目
            let monsterName5 = monsterName[monster[2]]    // 3匹目の名前を取得
            monsterImage3.image = UIImage(named: "\(monsterName5)")    // 3匹目の画像を表示
            // 4匹目
            let monsterName6 = monsterName[monster[3]]    // 4匹目の名前を取得
            monsterImage4.image = UIImage(named: "\(monsterName6)")    // 4匹目の画像を表示

        default:
            return
        }
    }


    // 【攻撃の処理】
    


    @IBAction func mainButton(_ sender: UIButton) {    // メインボタン
        //if toSelect == true {
            self.performSegue(withIdentifier: "toBattleCommand", sender: nil)    // 画面遷移
        //}
    }
    
    @IBAction func test(_ sender: UIButton) {
        performSegue(withIdentifier: "test", sender: nil)
    }


    // segue遷移前動作
    // セグエ実行前処理 / セグエの identifier 確認 / 遷移先ViewController の取得
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "toBattleCommand", let vc = segue.destination as? battleCommandViewController else {
            return
        }
        // 向こうで必要な情報は
        // 1. プレイヤーの名前、HP、MP,Lv
        // 2. 生き残ってるモンスターの画像



        //vc.select = selectNum
    }



}