module DateTimeHelper

  def date_time_helper(datetime)
    datetime.strftime("%A %B %e, %Y at %l:%M %P")
  end

end

