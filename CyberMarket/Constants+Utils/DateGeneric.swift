
import Foundation

enum DateFormatApp {
    case isoFull

    case DayHour24
    case DayHour12
    
    case dateFormat
    case weekDayName

    var text:String{
        
        switch self {
        case .isoFull:
            return "yyyy-MM-dd'T'HH:mm:ssZ"
        case .dateFormat:
            return "dd MMM yyyy, HH:mm"
        case .DayHour24:
            return "HH:mm"
        case .DayHour12:
            return "hh:mm a"
        case .weekDayName:
            return "EEEE"
        }
    }
}
struct DateApp {
    
    static func date(fromString stringDate:String ,withFormat format:DateFormatApp) -> Date? {
        
        let formatter = DateFormatter()
        formatter.dateFormat = format.text
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(abbreviation:"UTC")
        
        if let date = formatter.date(from: stringDate){
            return date
        }
        return nil
    }
    
    static func dateLocal(fromString stringDate:String ,withFormat format:DateFormatApp) -> Date? {
        
        let formatter = DateFormatter()
        formatter.dateFormat = format.text
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone.current 
        
        if let date = formatter.date(from: stringDate){
            return date
        }
        return nil
    }
    
    static func string(fromDate date:Date, withFormat format:DateFormatApp) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format.text
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(abbreviation:"UTC")
        return formatter.string(from: date)
    }
    
    static func stringWithLocalTime(fromDate date:Date, withFormat format:DateFormatApp) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format.text
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone.current
        return formatter.string(from: date)
    }
    
}
