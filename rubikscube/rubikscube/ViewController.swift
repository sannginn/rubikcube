//
//  ViewController.swift
//  rubikscube
//
//  Created by Ashkan Memarian on 2018-05-13.
//  Copyright © 2018 Ashkan Memarian. All rights reserved.
//




import UIKit


//public protocol histdelegate{func tellhistory()->[Int?]}


class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource,additionaltransformationsdelegate{

    //The squares:
    @IBOutlet weak var one: UIView!
    @IBOutlet weak var two: UIView!
    @IBOutlet weak var three: UIView!
    @IBOutlet weak var four: UIView!
    @IBOutlet weak var five: UIView!
    @IBOutlet weak var six: UIView!
    @IBOutlet weak var seven: UIView!
    @IBOutlet weak var eight: UIView!
    @IBOutlet weak var nine: UIView!
    @IBOutlet weak var ten: UIView!
    @IBOutlet weak var eleven: UIView!
    @IBOutlet weak var twelve: UIView!
    @IBOutlet weak var thirteen: UIView!
    @IBOutlet weak var fourteen: UIView!
    @IBOutlet weak var fifteen: UIView!
    @IBOutlet weak var sixteen: UIView!
    @IBOutlet weak var seventeen: UIView!
    @IBOutlet weak var eighteen: UIView!
    @IBOutlet weak var nineteen: UIView!
    @IBOutlet weak var twenty: UIView!
    @IBOutlet weak var twentyone: UIView!
    @IBOutlet weak var twentytwo: UIView!
    @IBOutlet weak var twentythree: UIView!
    @IBOutlet weak var twentyfour: UIView!
    @IBOutlet weak var twentyfive: UIView!
    @IBOutlet weak var twentysix: UIView!
    @IBOutlet weak var twentyseven: UIView!
    @IBOutlet weak var twentyeight: UIView!
    @IBOutlet weak var twentynine: UIView!
    @IBOutlet weak var thirty: UIView!
    @IBOutlet weak var thirtyone: UIView!
    @IBOutlet weak var thirtytwo: UIView!
    @IBOutlet weak var thirtythree: UIView!
    @IBOutlet weak var thirtyfour: UIView!
    @IBOutlet weak var thirtyfive: UIView!
    @IBOutlet weak var thirtysix: UIView!
    @IBOutlet weak var thirtyseven: UIView!
    @IBOutlet weak var thirtyeight: UIView!
    @IBOutlet weak var thirtynine: UIView!
    @IBOutlet weak var forty: UIView!
    @IBOutlet weak var fortyone: UIView!
    @IBOutlet weak var fortytwo: UIView!
    @IBOutlet weak var fortythree: UIView!
    @IBOutlet weak var fortyfour: UIView!
    @IBOutlet weak var fortyfive: UIView!
    @IBOutlet weak var fortysix: UIView!
    @IBOutlet weak var fortyseven: UIView!
    @IBOutlet weak var fortyeight: UIView!
    @IBOutlet weak var fortynine: UIView!
    @IBOutlet weak var fifty: UIView!
    @IBOutlet weak var fiftyone: UIView!
    @IBOutlet weak var fiftytwo: UIView!
    @IBOutlet weak var fiftythree: UIView!
    @IBOutlet weak var fiftyfour: UIView!
    @IBOutlet weak var transformation: UIPickerView!
    var conf = [UIColor?]()
    var iconf = [UIColor?]()
    var confb = [UIView?]()
    var c: Int = 0
    var hist = [Int?]()
    var isrecording: Bool?
    var record = [Int?]()
    var additionaltrans = additionaltransformations()
    @IBOutlet weak var history: UITextField!
    var contentarray = [Int?]()
    var rows: Int = 0
    var shift = [Int?]()
    
    
    override func viewDidLoad() {
        hist += [0]
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        transformation.delegate = self
        transformation.dataSource = self
        transformation.showsSelectionIndicator = true
        iset()
        //isrecording? = false
        isrecording = false
       // additionaltrans.two()
      //  for j in 0 ... hist.count-1{
          //  history.text! += String(hist[j]!)
       // }
        var adtransf = additionaltransformations()
        adtransf.delegate = self
       // adtransf.testvar = 1
       // print(adtransf.delegate)
       // print(transformation.delegate)
       // print(adtransf.testvar)
        //adtransf.two()
        //additionaltrans? = additionaltransformations()
        additionaltrans.delegate = self
    }
    var ini: Int = 0
    
    func iset(){
        if ini == 0 {
            confcreate()
            confset()
            iconfcreate()
            shift+=[0]
        }
        ini += 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //The PickerView setup
    public func numberOfComponents(in pickerView: UIPickerView)->Int {return 2}
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int)->Int {
        if (component == 0){return 9}
        else{return rows}
    }
    
    @IBAction func historyupdate(_ sender: UIButton) {
        viewDidLoad()
    }
    
    
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (row == 0 && component == 0){return "T1"}
        if (row == 1 && component == 0) {return "T2"}
        if (row == 2 && component == 0) {return "T3"}
        if (row == 3 && component == 0) {return "T4"}
        if (row == 4 && component == 0) {return "T5"}
        if (row == 5 && component == 0) {return "T6"}
        if (row == 6 && component == 0) {return "T7"}
        if (row == 7 && component == 0) {return "T8"}
        if (row == 8 && component == 0) {return "T9"}
        if (row == 0 && component == 1) {return "M1"}
        if (row == 1 && component == 1) {return "M2"}
        if (row == 2 && component == 1) {return "M3"}
        if (row == 3 && component == 1) {return "M4"}
        if (row == 4 && component == 1) {return "M5"}
        if (row == 5 && component == 1) {return "M6"}
        if (row == 6 && component == 1) {return "M7"}
        if (row == 7 && component == 1) {return "M8"}
        else {return "M9"}
    }
    
    
    
    
    
    //The saving of the configuration
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    let ArchiveURL = DocumentsDirectory.appendingPathComponent("rubikscube")
    
    //saving for the second button:
    //static let DocumentsDirectorytwo = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    let ArchiveURLtwo = DocumentsDirectory.appendingPathComponent("rubikscubetwo")
    
    
    
    @IBAction func save(_ sender: UIButton) {
        self.confset()
        NSKeyedArchiver.archiveRootObject(conf, toFile: self.ArchiveURL.path)
        print("saved")
    }
    
    
    @IBAction func savetwo(_ sender: UIButton) {
        self.confset()
        NSKeyedArchiver.archiveRootObject(conf, toFile: self.ArchiveURLtwo.path)
        print("saved")
    }
    
    @IBAction func load(_ sender: UIButton) {
        conf = NSKeyedUnarchiver.unarchiveObject(withFile: self.ArchiveURL.path) as! [UIColor?]
        //note that both the string the output of the object and the string in as? String need
        //to be replaced with the proper array type that is stored
        one.backgroundColor! = conf[0]!
        two.backgroundColor! = conf[1]!
        three.backgroundColor! = conf[2]!
        four.backgroundColor! = conf[3]!
        five.backgroundColor! = conf[4]!
        six.backgroundColor! = conf[5]!
        seven.backgroundColor! = conf[6]!
        eight.backgroundColor! = conf[7]!
        nine.backgroundColor! = conf[8]!
        ten.backgroundColor! = conf[9]!
        eleven.backgroundColor! = conf[10]!
        twelve.backgroundColor! = conf[11]!
        thirteen.backgroundColor! = conf[12]!
        fourteen.backgroundColor! = conf[13]!
        fifteen.backgroundColor! = conf[14]!
        sixteen.backgroundColor! = conf[15]!
        seventeen.backgroundColor! = conf[16]!
        eighteen.backgroundColor! = conf[17]!
        nineteen.backgroundColor! = conf[18]!
        twenty.backgroundColor! = conf[19]!
        twentyone.backgroundColor! = conf[20]!
        twentytwo.backgroundColor! = conf[21]!
        twentythree.backgroundColor! = conf[22]!
        twentyfour.backgroundColor! = conf[23]!
        twentyfive.backgroundColor! = conf[24]!
        twentysix.backgroundColor! = conf[25]!
        twentyseven.backgroundColor! = conf[26]!
        twentyeight.backgroundColor! = conf[27]!
        twentynine.backgroundColor! = conf[28]!
        thirty.backgroundColor! = conf[29]!
        thirtyone.backgroundColor! = conf[30]!
        thirtytwo.backgroundColor! = conf[31]!
        thirtythree.backgroundColor! = conf[32]!
        thirtyfour.backgroundColor! = conf[33]!
        thirtyfive.backgroundColor! = conf[34]!
        thirtysix.backgroundColor! = conf[35]!
        thirtyseven.backgroundColor! = conf[36]!
        thirtyeight.backgroundColor! = conf[37]!
        thirtynine.backgroundColor! = conf[38]!
        forty.backgroundColor! = conf[39]!
        fortyone.backgroundColor! = conf[40]!
        fortytwo.backgroundColor! = conf[41]!
        fortythree.backgroundColor! = conf[42]!
        fortyfour.backgroundColor! = conf[43]!
        fortyfive.backgroundColor! = conf[44]!
        fortysix.backgroundColor! = conf[45]!
        fortyseven.backgroundColor! = conf[46]!
        fortyeight.backgroundColor! = conf[47]!
        fortynine.backgroundColor! = conf[48]!
        fifty.backgroundColor! = conf[49]!
        fiftyone.backgroundColor! = conf[50]!
        fiftytwo.backgroundColor! = conf[51]!
        fiftythree.backgroundColor! = conf[52]!
        fiftyfour.backgroundColor! = conf[53]!
        
        
    }
    
    @IBAction func loadtwo(_ sender: UIButton) {
        conf = NSKeyedUnarchiver.unarchiveObject(withFile: self.ArchiveURLtwo.path) as! [UIColor?]
        //note that both the string the output of the object and the string in as? String need
        //to be replaced with the proper array type that is stored
        one.backgroundColor! = conf[0]!
        two.backgroundColor! = conf[1]!
        three.backgroundColor! = conf[2]!
        four.backgroundColor! = conf[3]!
        five.backgroundColor! = conf[4]!
        six.backgroundColor! = conf[5]!
        seven.backgroundColor! = conf[6]!
        eight.backgroundColor! = conf[7]!
        nine.backgroundColor! = conf[8]!
        ten.backgroundColor! = conf[9]!
        eleven.backgroundColor! = conf[10]!
        twelve.backgroundColor! = conf[11]!
        thirteen.backgroundColor! = conf[12]!
        fourteen.backgroundColor! = conf[13]!
        fifteen.backgroundColor! = conf[14]!
        sixteen.backgroundColor! = conf[15]!
        seventeen.backgroundColor! = conf[16]!
        eighteen.backgroundColor! = conf[17]!
        nineteen.backgroundColor! = conf[18]!
        twenty.backgroundColor! = conf[19]!
        twentyone.backgroundColor! = conf[20]!
        twentytwo.backgroundColor! = conf[21]!
        twentythree.backgroundColor! = conf[22]!
        twentyfour.backgroundColor! = conf[23]!
        twentyfive.backgroundColor! = conf[24]!
        twentysix.backgroundColor! = conf[25]!
        twentyseven.backgroundColor! = conf[26]!
        twentyeight.backgroundColor! = conf[27]!
        twentynine.backgroundColor! = conf[28]!
        thirty.backgroundColor! = conf[29]!
        thirtyone.backgroundColor! = conf[30]!
        thirtytwo.backgroundColor! = conf[31]!
        thirtythree.backgroundColor! = conf[32]!
        thirtyfour.backgroundColor! = conf[33]!
        thirtyfive.backgroundColor! = conf[34]!
        thirtysix.backgroundColor! = conf[35]!
        thirtyseven.backgroundColor! = conf[36]!
        thirtyeight.backgroundColor! = conf[37]!
        thirtynine.backgroundColor! = conf[38]!
        forty.backgroundColor! = conf[39]!
        fortyone.backgroundColor! = conf[40]!
        fortytwo.backgroundColor! = conf[41]!
        fortythree.backgroundColor! = conf[42]!
        fortyfour.backgroundColor! = conf[43]!
        fortyfive.backgroundColor! = conf[44]!
        fortysix.backgroundColor! = conf[45]!
        fortyseven.backgroundColor! = conf[46]!
        fortyeight.backgroundColor! = conf[47]!
        fortynine.backgroundColor! = conf[48]!
        fifty.backgroundColor! = conf[49]!
        fiftyone.backgroundColor! = conf[50]!
        fiftytwo.backgroundColor! = conf[51]!
        fiftythree.backgroundColor! = conf[52]!
        fiftyfour.backgroundColor! = conf[53]!
        
        
    }
    
    
    @IBAction func reset(_ sender: UIButton) {
        conf = iconf
        one.backgroundColor! = conf[0]!
        two.backgroundColor! = conf[1]!
        three.backgroundColor! = conf[2]!
        four.backgroundColor! = conf[3]!
        five.backgroundColor! = conf[4]!
        six.backgroundColor! = conf[5]!
        seven.backgroundColor! = conf[6]!
        eight.backgroundColor! = conf[7]!
        nine.backgroundColor! = conf[8]!
        ten.backgroundColor! = conf[9]!
        eleven.backgroundColor! = conf[10]!
        twelve.backgroundColor! = conf[11]!
        thirteen.backgroundColor! = conf[12]!
        fourteen.backgroundColor! = conf[13]!
        fifteen.backgroundColor! = conf[14]!
        sixteen.backgroundColor! = conf[15]!
        seventeen.backgroundColor! = conf[16]!
        eighteen.backgroundColor! = conf[17]!
        nineteen.backgroundColor! = conf[18]!
        twenty.backgroundColor! = conf[19]!
        twentyone.backgroundColor! = conf[20]!
        twentytwo.backgroundColor! = conf[21]!
        twentythree.backgroundColor! = conf[22]!
        twentyfour.backgroundColor! = conf[23]!
        twentyfive.backgroundColor! = conf[24]!
        twentysix.backgroundColor! = conf[25]!
        twentyseven.backgroundColor! = conf[26]!
        twentyeight.backgroundColor! = conf[27]!
        twentynine.backgroundColor! = conf[28]!
        thirty.backgroundColor! = conf[29]!
        thirtyone.backgroundColor! = conf[30]!
        thirtytwo.backgroundColor! = conf[31]!
        thirtythree.backgroundColor! = conf[32]!
        thirtyfour.backgroundColor! = conf[33]!
        thirtyfive.backgroundColor! = conf[34]!
        thirtysix.backgroundColor! = conf[35]!
        thirtyseven.backgroundColor! = conf[36]!
        thirtyeight.backgroundColor! = conf[37]!
        thirtynine.backgroundColor! = conf[38]!
        forty.backgroundColor! = conf[39]!
        fortyone.backgroundColor! = conf[40]!
        fortytwo.backgroundColor! = conf[41]!
        fortythree.backgroundColor! = conf[42]!
        fortyfour.backgroundColor! = conf[43]!
        fortyfive.backgroundColor! = conf[44]!
        fortysix.backgroundColor! = conf[45]!
        fortyseven.backgroundColor! = conf[46]!
        fortyeight.backgroundColor! = conf[47]!
        fortynine.backgroundColor! = conf[48]!
        fifty.backgroundColor! = conf[49]!
        fiftyone.backgroundColor! = conf[50]!
        fiftytwo.backgroundColor! = conf[51]!
        fiftythree.backgroundColor! = conf[52]!
        fiftyfour.backgroundColor! = conf[53]!
    }
    
    
    
    @IBAction func apply(_ sender: UIButton) {
        c += 1
        if transformation.selectedRow(inComponent: 0) == 0 {T1()}
        if transformation.selectedRow(inComponent: 0) == 1 {T2()}
        if transformation.selectedRow(inComponent: 0) == 2 {T3()}
        if transformation.selectedRow(inComponent: 0) == 3 {T4()}
        if transformation.selectedRow(inComponent: 0) == 4 {T5()}
        if transformation.selectedRow(inComponent: 0) == 5 {T6()}
        if transformation.selectedRow(inComponent: 0) == 6 {T7()}
        if transformation.selectedRow(inComponent: 0) == 7 {T8()}
        if transformation.selectedRow(inComponent: 0) == 8 {T9()}
    }
    
    @IBAction func applym(_ sender: UIButton) {
        custmacro()
    }
    
    
    func confcreate(){
        for _ in 1 ... 54{
            conf += [UIColor.blue]
    }
    }
    func confset(){
        let conf1: UIColor = one.backgroundColor!
        conf[0] = conf1
        let conf2: UIColor = two.backgroundColor!
        conf[1] = conf2
        let conf3: UIColor = three.backgroundColor!
        conf[2] = conf3
        let conf4: UIColor = four.backgroundColor!
        conf[3] = conf4
        let conf5: UIColor = five.backgroundColor!
        conf[4] = conf5
        let conf6: UIColor = six.backgroundColor!
        conf[5] = conf6
        let conf7: UIColor = seven.backgroundColor!
        conf[6] = conf7
        let conf8: UIColor = eight.backgroundColor!
        conf[7] = conf8
        let conf9: UIColor = nine.backgroundColor!
        conf[8] = conf9
        let conf10: UIColor = ten.backgroundColor!
        conf[9] = conf10
        let conf11: UIColor = eleven.backgroundColor!
        conf[10] = conf11
        let conf12: UIColor = twelve.backgroundColor!
        conf[11] = conf12
        let conf13: UIColor = thirteen.backgroundColor!
        conf[12] = conf13
        let conf14: UIColor = fourteen.backgroundColor!
        conf[13] = conf14
        let conf15: UIColor = fifteen.backgroundColor!
        conf[14] = conf15
        let conf16: UIColor = sixteen.backgroundColor!
        conf[15] = conf16
        let conf17: UIColor = seventeen.backgroundColor!
        conf[16] = conf17
        let conf18: UIColor = eighteen.backgroundColor!
        conf[17] = conf18
        let conf19: UIColor = nineteen.backgroundColor!
        conf[18] = conf19
        let conf20: UIColor = twenty.backgroundColor!
        conf[19] = conf20
        let conf21: UIColor = twentyone.backgroundColor!
        conf[20] = conf21
        let conf22: UIColor = twentytwo.backgroundColor!
        conf[21] = conf22
        let conf23: UIColor = twentythree.backgroundColor!
        conf[22] = conf23
        let conf24: UIColor = twentyfour.backgroundColor!
        conf[23] = conf24
        let conf25: UIColor = twentyfive.backgroundColor!
        conf[24] = conf25
        let conf26: UIColor = twentysix.backgroundColor!
        conf[25] = conf26
        let conf27: UIColor = twentyseven.backgroundColor!
        conf[26] = conf27
        let conf28: UIColor = twentyeight.backgroundColor!
        conf[27] = conf28
        let conf29: UIColor = twentynine.backgroundColor!
        conf[28] = conf29
        let conf30: UIColor = thirty.backgroundColor!
        conf[29] = conf30
        let conf31: UIColor = thirtyone.backgroundColor!
        conf[30] = conf31
        let conf32: UIColor = thirtytwo.backgroundColor!
        conf[31] = conf32
        let conf33: UIColor = thirtythree.backgroundColor!
        conf[32] = conf33
        let conf34: UIColor = thirtyfour.backgroundColor!
        conf[33] = conf34
        let conf35: UIColor = thirtyfive.backgroundColor!
        conf[34] = conf35
        let conf36: UIColor = thirtysix.backgroundColor!
        conf[35] = conf36
        let conf37: UIColor = thirtyseven.backgroundColor!
        conf[36] = conf37
        let conf38: UIColor = thirtyeight.backgroundColor!
        conf[37] = conf38
        let conf39: UIColor = thirtynine.backgroundColor!
        conf[38] = conf39
        let conf40: UIColor = forty.backgroundColor!
        conf[39] = conf40
        let conf41: UIColor = fortyone.backgroundColor!
        conf[40] = conf41
        let conf42: UIColor = fortytwo.backgroundColor!
        conf[41] = conf42
        let conf43: UIColor = fortythree.backgroundColor!
        conf[42] = conf43
        let conf44: UIColor = fortyfour.backgroundColor!
        conf[43] = conf44
        let conf45: UIColor = fortyfive.backgroundColor!
        conf[44] = conf45
        let conf46: UIColor = fortysix.backgroundColor!
        conf[45] = conf46
        let conf47: UIColor = fortyseven.backgroundColor!
        conf[46] = conf47
        let conf48: UIColor = fortyeight.backgroundColor!
        conf[47] = conf48
        let conf49: UIColor = fortynine.backgroundColor!
        conf[48] = conf49
        let conf50: UIColor = fifty.backgroundColor!
        conf[49] = conf50
        let conf51: UIColor = fiftyone.backgroundColor!
        conf[50] = conf51
        let conf52: UIColor = fiftytwo.backgroundColor!
        conf[51] = conf52
        let conf53: UIColor = fiftythree.backgroundColor!
        conf[52] = conf53
        let conf54: UIColor = fiftyfour.backgroundColor!
        conf[53] = conf54
        
    }
    
    
    func iconfcreate(){
        confset()
        for j in 0 ... 53{
            iconf += [conf[j]!]
        }
    }
        
    
    

    
    func T1(){
        self.confset()
        let bgc1: UIColor = one.backgroundColor!
        one.backgroundColor = twentyeight.backgroundColor
        let bgc2: UIColor = four.backgroundColor!
        four.backgroundColor = thirtyone.backgroundColor
        let bgc3: UIColor = seven.backgroundColor!
        seven.backgroundColor = thirtyfour.backgroundColor!
        let bgc4: UIColor = ten.backgroundColor!
        ten.backgroundColor = bgc1
        let bgc5: UIColor = thirteen.backgroundColor!
        thirteen.backgroundColor = bgc2
        let bgc6: UIColor = sixteen.backgroundColor!
        sixteen.backgroundColor = bgc3
        let bgc7: UIColor = nineteen.backgroundColor!
        nineteen.backgroundColor = bgc4
        let bgc8: UIColor = twentytwo.backgroundColor!
        twentytwo.backgroundColor = bgc5
        let bgc9: UIColor = twentyfive.backgroundColor!
        twentyfive.backgroundColor = bgc6
        twentyeight.backgroundColor = bgc7
        thirtyone.backgroundColor = bgc8
        thirtyfour.backgroundColor = bgc9
        let bgc13: UIColor = fiftytwo.backgroundColor!
        let bgc14: UIColor = fiftythree.backgroundColor!
        let bgc15: UIColor = fiftyfour.backgroundColor!
        fiftyfour.backgroundColor = bgc13
        let bgc16: UIColor = fiftyone.backgroundColor!
        fiftyone.backgroundColor = bgc14
        let bgc17: UIColor = fortyeight.backgroundColor!
        fortyeight.backgroundColor = bgc15
        let bgc18: UIColor = fortyseven.backgroundColor!
        fortyseven.backgroundColor = bgc16
        let bgc19: UIColor = fortysix.backgroundColor!
        fortysix.backgroundColor = bgc17
        let bgc20: UIColor = fortynine.backgroundColor!

        fortynine.backgroundColor = bgc18
        fiftythree.backgroundColor = bgc20
        fiftytwo.backgroundColor = bgc19
        
        
        //updating the hist arrray
        hist += [1]
    }
    
    
    //Similarly for T2 we have:
    func T2(){
        self.confset()
        let bgc1: UIColor = two.backgroundColor!
        let bgc2: UIColor = five.backgroundColor!
        let bgc3: UIColor = eight.backgroundColor!
        let bgc4: UIColor = eleven.backgroundColor!
        let bgc5: UIColor = fourteen.backgroundColor!
        let bgc6: UIColor = seventeen.backgroundColor!
        let bgc7: UIColor = twenty.backgroundColor!
        let bgc8: UIColor = twentythree.backgroundColor!
        let bgc9: UIColor = twentysix.backgroundColor!
        let bgc10: UIColor = twentynine.backgroundColor!
        let bgc11: UIColor = thirtytwo.backgroundColor!
        let bgc12: UIColor = thirtyfive.backgroundColor!
        two.backgroundColor = bgc10
        five.backgroundColor = bgc11
        eight.backgroundColor = bgc12
        eleven.backgroundColor = bgc1
        fourteen.backgroundColor = bgc2
        seventeen.backgroundColor = bgc3
        twenty.backgroundColor = bgc4
        twentythree.backgroundColor = bgc5
        twentysix.backgroundColor = bgc6
        twentynine.backgroundColor = bgc7
        thirtytwo.backgroundColor = bgc8
        thirtyfive.backgroundColor = bgc9
        hist += [2]
        
    }
    
    func T3(){
        self.confset()
        twelve.backgroundColor! = conf[2]!
        twentyone.backgroundColor! = conf[11]!
        thirty.backgroundColor! = conf[20]!
        three.backgroundColor! = conf[29]!
        six.backgroundColor! = conf[32]!
        fifteen.backgroundColor! = conf[5]!
        twentyfour.backgroundColor! = conf[14]!
        thirtythree.backgroundColor! = conf[23]!
        nine.backgroundColor! = conf[35]!
        eighteen.backgroundColor! = conf[8]!
        twentyseven.backgroundColor! = conf[17]!
        thirtysix.backgroundColor! = conf[26]!
        thirtynine.backgroundColor! = conf[36]!
        thirtyeight.backgroundColor! = conf[39]!
        thirtyseven.backgroundColor! = conf[42]!
        fortytwo.backgroundColor! = conf[37]!
        forty.backgroundColor! = conf[43]!
        fortyfive.backgroundColor! = conf[38]!
        fortyfour.backgroundColor! = conf[41]!
        fortythree.backgroundColor! = conf[44]!
        
        //updating the hist array
        hist += [3]
    }
    
    
    func T4(){
        self.confset()
        //fortythree -> forty
        forty.backgroundColor! = conf[34]!
        //forty -> thirtyseven
        thirtyseven.backgroundColor! = conf[35]!
        //thirtyseven -> twelve
        twelve.backgroundColor! = conf[42]!
        //twelve -> eleven
        eleven.backgroundColor! = conf[39]!
        //eleven -> ten
        ten.backgroundColor! = conf[36]!
        //ten -> fiftytwo
        fiftytwo.backgroundColor! = conf[11]!
        //fiftytwo -> fortynine
        fortynine.backgroundColor! = conf[10]!
        //fortynine -> fortysix (fourtysix)
        fortysix.backgroundColor! = conf[9]!
        //fortysix -> thirtyfour
        thirtyfour.backgroundColor! = conf[51]!
        //thirtyfour -> thirtyfive
        thirtyfive.backgroundColor! = conf[48]!
        //thirtyfive -> thirtysix
        thirtysix.backgroundColor! = conf[45]!
        //thirtysix -> fortythree
        fortythree.backgroundColor! = conf[33]!
        
        //need to add the side face as well
        //three -> nine
        nine.backgroundColor! = conf[2]!
        //six -> eight
        eight.backgroundColor! = conf[5]!
        //nine -> seven
        seven.backgroundColor! = conf[8]!
        //eight -> four
        four.backgroundColor! = conf[7]!
        //seven -> one
        one.backgroundColor! = conf[6]!
        //one -> three
        three.backgroundColor! = conf[0]!
        //four -> two
        two.backgroundColor! = conf[3]!
        //two -> six
        six.backgroundColor! = conf[1]!
        
        //updating the hist array
        hist += [4]
    
    }
    
    func T5(){
        self.confset()
        //fortyfour -> fifteen
        fifteen.backgroundColor! = conf[43]!
        //fortyone -> fourteen
        fourteen.backgroundColor! = conf[40]!
        //thirtyeight -> thirteen
        thirteen.backgroundColor! = conf[37]!
        //fifteen -> fiftythree
        fiftythree.backgroundColor! = conf[14]!
        //fourteen -> fifty
        fifty.backgroundColor! = conf[13]!
        //thirteen -> fortyseven
        fortyseven.backgroundColor! = conf[12]!
        //fiftythree -> thirtyone
        thirtyone.backgroundColor! = conf[52]!
        //fifty -> thirtytwo
        thirtytwo.backgroundColor! = conf[49]!
        //fortyseven -> thirtythree
        thirtythree.backgroundColor! = conf[46]!
        //thirtyone -> fortyfour
        fortyfour.backgroundColor! = conf[30]!
        //thirtytwo -> fortyone
        fortyone.backgroundColor! = conf[31]!
        //thirtythree -> thirtyeight
        thirtyeight.backgroundColor! = conf[32]!
        
        
        
        //updating the hist array
        hist += [5]
        
    }
    
    func T6(){
        self.confset()
        //fortyfive -> eighteen
        eighteen.backgroundColor! = conf[44]!
        //fortytwo -> seventeen
        seventeen.backgroundColor! = conf[41]!
        //thirtynine -> sixteen
        sixteen.backgroundColor! = conf[38]!
        //eighteen -> fiftyfour
        fiftyfour.backgroundColor! = conf[17]!
        //seventeen -> fiftyone
        fiftyone.backgroundColor! = conf[16]!
        //sixteen -> fortyeight
        fortyeight.backgroundColor! = conf[15]!
        //fiftyfour -> twentyeight
        twentyeight.backgroundColor! = conf[53]!
        //fiftyone -> twentynine
        twentynine.backgroundColor! = conf[50]!
        //fortyeight -> thirty
        thirty.backgroundColor! = conf[47]!
        //twentyeight -> fortyfive
        fortyfive.backgroundColor! = conf[27]!
        //twentynine -> fortytwo
        fortytwo.backgroundColor! = conf[28]!
        //thirty -> thirtynine
        thirtynine.backgroundColor! = conf[29]!
        
        //need to add the side face as well.
        //twenty seven -> twenty one
        twentyone.backgroundColor! = conf[26]!
        //twenty four -> twenty
        twenty.backgroundColor! = conf[23]!
        //twenty one -> nineteen
        nineteen.backgroundColor! = conf[20]!
        //twenty -> twenty two
        twentytwo.backgroundColor! = conf[19]!
        //nineteen -> twenty five
        twentyfive.backgroundColor! = conf[18]!
        //twenty two -> twenty six
        twentysix.backgroundColor! = conf[21]!
        //twenty five -> twenty seven
        twentyseven.backgroundColor! = conf[24]!
        //twenty six -> twenty four
        twentyfour.backgroundColor! = conf[25]!
        
        
        //updating the hist array
        hist += [6]
    }
    
    
    
    func T7(){
        self.confset()
        //nine -> thirty nine
        thirtynine.backgroundColor! = conf[8]!
        //eight -> thirty eight
        thirtyeight.backgroundColor! = conf[7]!
        //seven -> thirty seven
        thirtyseven.backgroundColor! = conf[6]!
        //thirty seven -> twenty one
        twentyone.backgroundColor! = conf[36]!
        //thirty eight -> twenty
        twenty.backgroundColor! = conf[37]!
        //thirty nine -> nineteen
        nineteen.backgroundColor! = conf[38]!
        //twenty one -> fifty four
        fiftyfour.backgroundColor! = conf[20]!
        //twenty -> fifty three
        fiftythree.backgroundColor! = conf[19]!
        //nineteen -> fifty two
        fiftytwo.backgroundColor! = conf[18]!
        //fifty four -> seven
        seven.backgroundColor! = conf[53]!
        //fifty three -> eight
        eight.backgroundColor! = conf[52]!
        //fifty two -> nine
        nine.backgroundColor! = conf[51]!
        //ten -> twelve
        twelve.backgroundColor! = conf[9]!
        //eleven -> fifteen
        fifteen.backgroundColor! = conf[10]!
        //twelve -> eighteen
        eighteen.backgroundColor! = conf[11]!
        //fifteen -> seventeen
        seventeen.backgroundColor! = conf[14]!
        //eighteen -> sixteen
        sixteen.backgroundColor! = conf[17]!
        //seventeen -> thirteen
        thirteen.backgroundColor! = conf[16]!
        //sixteen -> ten
        ten.backgroundColor! = conf[15]!
        //thirteen -> eleven
        eleven.backgroundColor! = conf[12]!
        
        
        //updating the hist array
        hist += [7]
    
    }
    
    func T8(){
        self.confset()
        //fiftyone -> four
        four.backgroundColor! = conf[50]!
        //fifty -> five
        five.backgroundColor! = conf[49]!
        //fortynine -> six
        six.backgroundColor! = conf[48]!
        //four -> forty
        forty.backgroundColor! = conf[3]!
        //five -> forty one
        fortyone.backgroundColor! = conf[4]!
        //six -> forty two
        fortytwo.backgroundColor! = conf[5]!
        //forty -> twenty four
        twentyfour.backgroundColor! = conf[39]!
        //forty one -> twenty three
        twentythree.backgroundColor! = conf[40]!
        //forty two -> twenty two
        twentytwo.backgroundColor! = conf[41]!
        //twenty four -> fifty one
        fiftyone.backgroundColor! = conf[23]!
        //twenty three -> fifty
        fifty.backgroundColor! = conf[22]!
        //twenty two -> fortynine
        fortynine.backgroundColor! = conf[21]!
        
        
        
        //updating the hist array
        hist += [8]
    }
    
    
    
    func
        T9(){
        self.confset()
        //one -> forty three
        fortythree.backgroundColor! = conf[0]!
        //two -> fortyfour
        fortyfour.backgroundColor! = conf[1]!
        //three -> forty five
        fortyfive.backgroundColor! = conf[2]!
        //forty three -> twenty seven
        twentyseven.backgroundColor! = conf[42]!
        //forty four -> twenty six
        twentysix.backgroundColor! = conf[43]!
        //forty five -> twenty five
        twentyfive.backgroundColor! = conf[44]!
        //twenty seven -> forty eight
        fortyeight.backgroundColor! = conf[26]!
        //twenty six -> forty seven
        fortyseven.backgroundColor! = conf[25]!
        //twenty five -> forty six
        fortysix.backgroundColor! = conf[24]!
        //forty eight -> one
        one.backgroundColor! = conf[47]!
        //forty seven -> two
        two.backgroundColor! = conf[46]!
        //forty six -> three
        three.backgroundColor! = conf[45]!
        //thirty six -> thirty
        thirty.backgroundColor! = conf[35]!
        //thirty -> twenty eight
        twentyeight.backgroundColor! = conf[29]!
        //twenty eight -> thirty four
        thirtyfour.backgroundColor! = conf[27]!
        //thirty four -> thirty six
        thirtysix.backgroundColor! = conf[33]!
        //thirty three -> twenty nine
        twentynine.backgroundColor! = conf[32]!
        //twenty nine -> thirty one
        thirtyone.backgroundColor! = conf[28]!
        //thirty one -> thirty five
        thirtyfive.backgroundColor! = conf[30]!
        //thirty five ->thirty three
        thirtythree.backgroundColor! = conf[34]!
        
        
        //updating the hist array
        hist += [9]
    }
    
    @IBAction func macrorecord(_ sender: UIButton) {
        if isrecording! == false {
            isrecording = true
            record += [0]
            record += [2]
            record[0]! = hist.count
            contentarray += [hist.count]
        }
        else {
            isrecording = false
            record[1]! = hist.count
            contentarray += [hist.count]
            rows += 1
            shift+=[0]
            viewDidLoad()
            print(contentarray)
        }
    }
    
    func custmacro(){
        var j: Int = transformation.selectedRow(inComponent: 1)
        for k in contentarray[2*(j+shift[j]!)]! ... contentarray[2*(j+shift[j]!)+1]!{
            transformationapply(hist[k]!)
        }
    }
    
    
    func transformationapply(_ j:  Int){
    //  configuration->transformj(configuration):
      if j==1 {T1()}
      if j==2 {T2()}
      if j==3 {T3()}
      if j==4 {T4()}
      if j==5 {T5()}
      if j==6 {T6()}
      if j==7 {T7()}
      if j==8 {T8()}
      if j==9 {T9()}
    }

}

