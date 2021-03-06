module Tgios
  class NSDateHelper
    def self.to_nsdate(date_string)
      if date_string.is_a?(String)
        date_string = date_string.gsub(/\.\d*/, '') # remove mini-seconds
        @formatter ||= (
        @formatter = NSDateFormatter.new
        @formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        @formatter.timeZone = NSTimeZone.timeZoneForSecondsFromGMT(0)
        @formatter
        )
        date = @formatter.dateFromString(date_string)
        if date.nil?
          @formatter2 ||= (
          @formatter2 = NSDateFormatter.new
          @formatter2.dateFormat = "yyyy-MM-dd HH:mm:ss"
          @formatter2.timeZone = NSTimeZone.timeZoneForSecondsFromGMT(0)
          @formatter2
          )
          date = @formatter2.dateFromString(date_string).utc
        end
        date
      else
        date.utc
      end
    end
  end
end