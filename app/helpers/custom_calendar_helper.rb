# -*- coding: utf-8 -*-
include CalendarHelper

module CustomCalendarHelper
  def navigation_back(args)
    month_names = ["","Tammikuu","Helmikuu","Maaliskuu","Huhtikuu","Toukokuu","Kesäkuu","Heinäkuu","Elokuu","Syyskuu","Lokakuu","Marraskuu","Joulukuu"]
    ret = ""
    3.downto(1) { |i|
      if @date.month - i < 1
        previous_month = @date.month - i + 12
      else
        previous_month = @date.month - i
      end

      if @date.month - i < 0
        this_month = @date.month + 13 - i
        previous_year = -1
      else
        this_month = @date.month-(i-1)
        previous_year = 0
      end
      ret += "<li>#{link_to "«« " + month_names[previous_month], :controller => 'occasions', :action => args[:view], :direction => 'back', :year => @date.year+previous_year, :month => this_month}</li>"

    }
    return ret.html_safe
  end

  def navigation_forward(args)
    month_names = ["","Tammikuu","Helmikuu","Maaliskuu","Huhtikuu","Toukokuu","Kesäkuu","Heinäkuu","Elokuu","Syyskuu","Lokakuu","Marraskuu","Joulukuu"]
    ret = ""

    for i in (1..3)
      if @date.month + i > 12
        next_month = @date.month + i - 12
      else
        next_month = @date.month + i
      end
      if @date.month + i > 13
        this_month = @date.month+(i-13)
        next_year = 1
      else
        this_month = @date.month+(i-1)
        next_year = 0
      end

      ret += "<li>#{link_to month_names[next_month] + " »»", :controller => 'occasions', :action => args[:view], :direction => 'forward', :year => @date.year + next_year, :month => this_month}</li>"
    end
    
    return ret.html_safe
  end
  
  def holiday(date)
    if date.month == 1 && date.mday == 1
      return " Uudenv.pv."
    end
    if date.month == 1 && date.mday == 6
      return " Loppiainen"
    end
    if date.month == 5 && date.mday == 1
      return " Vappu"
    end
    if date.month == 5 && date.mday >= 8 && date.mday <= 14 && date.wday == 0
      return " Äitienpv."
    end
    if date.month == 6 && date.mday >= 19 && date.mday <= 25 && date.wday == 5
      return " Juh. aatto"
    end
    if date.month == 6 && date.mday >= 20 && date.mday <= 26 && date.wday == 6
      return " Juhannuspv."
    end
    if date.month == 10 && date.mday == 31 && date.wday == 6
      return " Pyhäinpäivä"
    end
    if date.month == 11 && date.mday >= 1 && date.mday <= 6 && date.wday == 6
      return " Pyhäinpäivä"
    end
    if date.month == 12 && date.mday == 6
      return " Itsenäisyyspv."
    end
    if date.month == 12 && date.mday == 24
      return " Jouluaatto"
    end
    if date.month == 12 && date.mday == 25
      return " Joulupäivä"
    end
    if date.month == 12 && date.mday == 26
      return " Tapaninpv."
    end
    if date.month == 12 && date.mday == 31
      return " Uud.v.aatto"
    end
    
    # Calculate date of Easter and other holidays depending on it

    aY = date.year

    a = aY % 19;
    b = (aY / 100).floor;
    c = aY % 100;
    d = (b / 4).floor;
    e = b % 4;
    f = ((b + 8) / 25).floor;
    g = ((b - f + 1) / 3).floor;
    h = (19 * a + b - d - g + 15) % 30;
    i = (c / 4).floor;
    k = c % 4;
    l = (32 + 2 * e + 2 * i - h - k) % 7;
    m = ((a + 11 * h + 22 * l) / 451).floor;
    n = ((h + l - 7 * m + 114) / 31).floor;
    o = (h + l - 7 * m + 114) % 31;

    if date.month == n && date.mday == o + 1
      return " Pääsiäinen"
    end
    eDate = Date.civil(aY, n, o + 1)
    #           return eDate.strftime()
    if date.month == (eDate-49).month && date.mday == (eDate-49).mday
      return " Laskiaissunn."
    end
    if date.month == (eDate-47).month && date.mday == (eDate-47).mday
      return " Lask.tiistai"
    end
    if date.month == (eDate-2).month && date.mday == (eDate-2).mday
      return " Pitkäperjantai"
    end
    if date.month == (eDate-7).month && date.mday == (eDate-7).mday
      return " Palmusunnuntai"
    end
    if date.month == (eDate+1).month && date.mday == (eDate+1).mday
      return " 2. Pääs.pv."
    end
    if date.month == (eDate+39).month && date.mday == (eDate+39).mday
      return " Helatorstai"
    end
    if date.month == (eDate+49).month && date.mday == (eDate+49).mday
      return " Helluntai"
    end

    return ""
  end
end 
