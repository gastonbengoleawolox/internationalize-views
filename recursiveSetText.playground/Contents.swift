import UIKit

let v = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
let w = UIView(frame: CGRect(x: 5, y: 5, width: 290, height: 90))
w.backgroundColor = UIColor.greenColor()
let l = UILabel(frame: CGRect(x: 5, y: 5, width: 150, height: 30))
l.text = "%hello"
l.backgroundColor = UIColor.redColor()
let l2 = UILabel(frame: CGRect(x: 5, y: 40, width: 150, height: 30))
l2.text = "este no se cambia"
l2.backgroundColor = UIColor.blueColor()

w.addSubview(l)
w.addSubview(l2)
v.addSubview(w)

let translation = ["hello" : "hola", "bye" : "chau"]

extension String {
    
    func localize() -> String {
        return translation[self] ?? self
    }
    
}

func changeAll(view: UIView) {
    for view in view.subviews {
        if let textField = view as? UITextField {
            if ((textField.text?.hasPrefix("%")) != nil) {
                let index = textField.text!.startIndex.advancedBy(1)
                textField.text = textField.text!.substringFromIndex(index).localize()
            }
            return
        }
        if let label = view as? UILabel {
            if ((label.text?.hasPrefix("%")) != nil) {
                let index = label.text!.startIndex.advancedBy(1)
                label.text = label.text!.substringFromIndex(index).localize()
            }
            return
        } else {
            changeAll(view)
        }
    }
}

changeAll(v)

v
