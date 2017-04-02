
class DateTimeItem {
  private Point locTime;
  private Point locDate;
  public boolean militaryTime;
  public boolean monthDayYear;
  String[] months = {"January", "February", "March", "April", "May", "June", "July",
    "August", "September", "October", "November", "December"};
  
  DateTimeItem(Point locTime, Point locDate) {
    this.locTime = locTime;
    this.locDate = locDate;
    this.militaryTime = false;
    this.monthDayYear = true;
  }
  
  private String constructTimeString() {
    if(militaryTime)
      return hour() + ":" + minute() + ":" + second();
    else {
      String timeString = "2";
      String minuteString = "";
      int hour1 = hour();
      int minute1 = minute();
      int second1 = second();
      boolean isAM = true;
      if(hour1 > 12) { hour1 -= 12; isAM = false; }
      else if(hour1 == 0) hour1 = 12;
      minuteString = str(minute1);
      if(minute1 < 10) minuteString = "0" + minuteString;
      if(isAM)
        timeString = hour1 + ":" + minuteString + ":" + second1 + " AM";
      else
        timeString = hour1 + ":" + minuteString + ":" + second1 + " PM";
      return timeString;
    }
  }
  
  private String constructDateString() {
    if(monthDayYear == true){
      return months[month()-1] + " " + day() + ", " + year(); 
    }
    else{
      return day() + " " + months[month()] + ", " + year(); 
    }
  }
  
  public void drawDateTime() {
    textFont(f);
    textAlign(CENTER);
    fill(0);
    
    String timeString = constructTimeString();
    String dateString = constructDateString();
  
    textSize(80);
    text(timeString, locTime.x, locTime.y);
  
    textSize(50);
    text(dateString, locDate.x, locDate.y);
  }
}