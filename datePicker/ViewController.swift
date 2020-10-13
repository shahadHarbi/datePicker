
import UIKit

class ViewController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(true)
          
          NotificationCenter.default.addObserver(self, selector: #selector(setDate), name: NSNotification.Name(rawValue: "setDate"), object: nil)
      }
      
      @objc func setDate() {
          if CustomDatePickerVC.isStartDate {
              labelDate.text = CustomDatePickerVC.selectedDate
          }
          else {
              labelTime.text = CustomDatePickerVC.selectedDate
          }
          
          CustomDatePickerVC.isStartDate = false
          CustomDatePickerVC.isEndDate = false
          
      }
    
    
    @IBOutlet weak var labelDate: UILabel!
    
    @IBOutlet weak var labelTime: UILabel!
    
    @IBAction func buttonActionDate(_ sender: Any) {
        showDatePicker()
        CustomDatePickerVC.isStartDate = true
        CustomDatePickerVC.isEndDate = false
        labelDate.text = CustomDatePickerVC.selectedDate
    }
    @IBAction func tototo(_ sender: Any) {
        showDatePicker()
        CustomDatePickerVC.isStartDate = false
        CustomDatePickerVC.isEndDate = true
        labelTime.text = CustomDatePickerVC.selectedDate
    }
    
    func showDatePicker() {
        let vc = CustomDatePickerVC()
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        DispatchQueue.main.async {
            self.present(vc, animated: true)
            
        }
    }
    @IBOutlet weak var buton: UIButton!
    
    @IBOutlet weak var datePicker: UIDatePicker!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let currentDateTime = Date()
//        let year = currentDateTime.getDayDateMonthYearHourMinuteSecond()._year
//        let month = currentDateTime.getDayDateMonthYearHourMinuteSecond()._month
//        let day = currentDateTime.getDayDateMonthYearHourMinuteSecond()._day
//        let hour = currentDateTime.getDayDateMonthYearHourMinuteSecond()._hour
//        let min = currentDateTime.getDayDateMonthYearHourMinuteSecond()._minute
//        print(Date.calculateDate(day: day, month: month, year: year, hour: hour, minute: min))
        // datePicker?.datePickerMode = .dateAndTime
        
        //get min
        //        datePicker.minimumDate = Date.calculateDate(day: day, month: month, year: year, hour: hour, minute: min)
        
    }
    
//
//    @IBAction func valueChangedUIPicker(_ sender: UIDatePicker) {
//
//        //        sender.date.getDayDateMonthYearHourMinuteSecond()._day
//        //        print(sender.date.getDayDateMonthYearHourMinuteSecond()._day)
//        //           sender.date.getDayDateMonthYearHourMinuteSecond()._month
//        //           sender.date.getDayDateMonthYearHourMinuteSecond()._day
//        //           sender.date.getDayDateMonthYearHourMinuteSecond()._hour
//        //           sender.date.getDayDateMonthYearHourMinuteSecond()._minute
//        //
//        //       labelDate?.text = "day: \(sender.date.getDayDateMonthYearHourMinuteSecond().day),month:\ (sender.date.getDayDateMonthYearHourMinuteSecond().month),"year:\ (sender.date.getDayDateMonthYearHourMinuteSecond().year)"
//
//        labelDate?.text = "التاريخ: \(sender.date.getDayDateMonthYearHourMinuteSecond()._day)/ \(sender.date.getDayDateMonthYearHourMinuteSecond()._month)/ \(sender.date.getDayDateMonthYearHourMinuteSecond()._year)"
//
//
//        labelTime?.text = "الوقت:  \(sender.date.getDayDateMonthYearHourMinuteSecond()._hour): \(sender.date.getDayDateMonthYearHourMinuteSecond()._minute)"
//
//        //        labelTime?.text = "Hour:\ (sender.date.getDayDateMonthYearHourMinuteSecond().hour),minute:\ (sender.date.getDayDateMonthYearHourMinuteSecond().minute)"
//
//    }
//
//}
//
//
//
//
