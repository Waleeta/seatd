module DateTimeHelper

  def date_time_helper(datetime)
    datetime.strftime("%l:%M %P")
  end

  def month
    month = Date::MONTHNAMES[Date.today.month]
    # returns current month
  end

  def month_and_date(date)
    date = Date::MONTHNAMES[date.month] + " " + date.day.to_s
  end

  def yesterday_date
    yesterday = Date.today.prev_day
    yesterday.day.to_s #returns day as number
  end

  def today_date
    today = Date.today
    today.day.to_s #returns day as number
  end

  def tomorrow_date
    tomorrow = today_date.next
    tomorrow
  end

  def day_after_tomorrow
    day_after = tomorrow_date.to_i+1
    p day_after
    day_after
  end

  def full_day
    month.to_s+" "+today_date.to_s
  end

end

