

import UIKit

class CustomDatePickerVC: UIViewController {

    static var isStartDate = true
    static var isEndDate = false
    static var selectedDate = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        print("sfsdjhfdsj")
    }
    

    let mainView : UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .init(white: 0.95, alpha: 1)
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
        return $0
    }(UIView())

    let selectedDateLabel : UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Selected Date"
        $0.textAlignment = .center
        $0.backgroundColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        $0.textColor = .white
        $0.font = UIFont(name: "Futura", size: 18)
        return $0
    }(UILabel())
    
    let datePicker : UIDatePicker = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.datePickerMode = .dateAndTime
        $0.addTarget(self, action: #selector(dateChange), for: .valueChanged)
        return $0
    }(UIDatePicker())
    
    @objc func dateChange() {
       
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy hh:mm aa"
        CustomDatePickerVC.selectedDate = dateFormatter.string(from: datePicker.date)
        selectedDateLabel.text = CustomDatePickerVC.selectedDate
    }
    
    lazy var doneButton : UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = #colorLiteral(red: 0, green: 0.6779200435, blue: 0.7319224477, alpha: 1)
        $0.tintColor = .white
        $0.setTitle("Done", for: .normal)
        $0.titleLabel?.font = UIFont(name: "Futura", size: 18)
        $0.addTarget(self, action: #selector(dimissDatePicker), for: .touchUpInside)
        return $0
    }(UIButton(type: .system))
    
    @objc func dimissDatePicker() {
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "setDate"), object: nil, userInfo: nil)
        
        self.dismiss(animated: true)
    }
    
    
    
}

extension CustomDatePickerVC {
    
    func setupUI() {
        
        view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        
        view.addSubview(mainView)
        mainView.addSubview(selectedDateLabel)
        mainView.addSubview(datePicker)
        mainView.addSubview(doneButton)
        
        NSLayoutConstraint.activate([
        
            mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35),
            mainView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -60),
            
            selectedDateLabel.topAnchor.constraint(equalTo: mainView.topAnchor),
            selectedDateLabel.leftAnchor.constraint(equalTo: mainView.leftAnchor),
            selectedDateLabel.rightAnchor.constraint(equalTo: mainView.rightAnchor),
            selectedDateLabel.heightAnchor.constraint(equalToConstant: 40),
            
            datePicker.topAnchor.constraint(equalTo: mainView.topAnchor),
            datePicker.leftAnchor.constraint(equalTo: mainView.leftAnchor),
            datePicker.rightAnchor.constraint(equalTo: view.rightAnchor),
            datePicker.bottomAnchor.constraint(equalTo: doneButton.topAnchor),
            
            doneButton.topAnchor.constraint(equalTo: datePicker.bottomAnchor),
            doneButton.leftAnchor.constraint(equalTo: mainView.leftAnchor),
            doneButton.rightAnchor.constraint(equalTo: mainView.rightAnchor),
            doneButton.bottomAnchor.constraint(equalTo: mainView.bottomAnchor),
            doneButton.heightAnchor.constraint(equalToConstant: 45)
        
        ])
    }
}


extension CustomDatePickerVC : UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerView.delegate = self
        print("Hala Wallah")
    }
}
