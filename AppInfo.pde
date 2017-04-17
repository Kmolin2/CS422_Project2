//This file is for putting the information in the apps for the widget information
String[] appNames = {"weather", "music"};

boolean farenheit = true;

void processWidgetInfo(Widget w){
  //weather is on a widget
  if(w.name.equals("weather")){
    //not expanded
    if(w.sizeY == 150){
      fill(0);
      textSize(40);
      textAlign(LEFT);
      //TODO: Account for Celsius or Farenheit choice!!
      if(farenheit){
        if (language.equals("Español")){
         text(currentWeatherInfoSpanish[0][0], w.x+50, w.y+70);
         text(currentWeatherInfoSpanish[1][0], w.x+50, w.y+110);
         text(currentWeatherInfoSpanish[2][0], w.x+450, w.y+90);
         }
        else{
         text(currentWeatherInfo[0][0], w.x+50, w.y+70);
         text(currentWeatherInfo[1][0], w.x+50, w.y+110);
         text(currentWeatherInfo[2][0], w.x+450, w.y+90);
        }
      }
      else{
        if (language.equals("Español")){
         text(currentWeatherInfoSpanish[0][1], w.x+50, w.y+70);
         text(currentWeatherInfoSpanish[1][1], w.x+50, w.y+110);
         text(currentWeatherInfoSpanish[2][1], w.x+450, w.y+90);
        }
        else{
         text(currentWeatherInfo[0][1], w.x+50, w.y+70);
         text(currentWeatherInfo[1][1], w.x+50, w.y+110);
         text(currentWeatherInfo[2][1], w.x+450, w.y+90);          
        }
      }
      sunny.resize(120,120);
      image(sunny, w.x+300, w.y+20);
      fill(0, 255, 123);  
    }
    //expanded weather widget
    else{
      fill(0);
      textSize(35);
      textAlign(LEFT);
      //TODO: Account for Celsius or Farenheit choice!!
      if(farenheit){
        if (language.equals("Español")){
         text(currentWeatherInfoSpanish[0][0], w.x+50, w.y+40);
         text(currentWeatherInfoSpanish[1][0], w.x+50, w.y+80);
         text(currentWeatherInfoSpanish[2][0], w.x+450, w.y+60);
        }
        else{
         text(currentWeatherInfo[0][0], w.x+50, w.y+40);
         text(currentWeatherInfo[1][0], w.x+50, w.y+80);
         text(currentWeatherInfo[2][0], w.x+450, w.y+60);          
        }
      }
      else{
        if (language.equals("Español")){
         text(currentWeatherInfoSpanish[0][1], w.x+50, w.y+40);
         text(currentWeatherInfoSpanish[1][1], w.x+50, w.y+80);
         text(currentWeatherInfoSpanish[2][1], w.x+450, w.y+60);
        }
        else{
         text(currentWeatherInfo[0][1], w.x+50, w.y+40);
         text(currentWeatherInfo[1][1], w.x+50, w.y+80);
         text(currentWeatherInfo[2][1], w.x+450, w.y+60);          
        }
      }
      sunny.resize(100,100);
      image(sunny, w.x+300, w.y);
      textAlign(CENTER);
      for(int i = 0; i < 4; i++){
        dayOfWeek++;
        if(dayOfWeek == 7)
          dayOfWeek = 0;
        
        cloudy.resize(90,90);
        image(cloudy, w.x+70+(i*200), w.y+130);
        
        if (language.equals("Español")){
         text(dayNameSpanish[dayOfWeek], w.x+100+(i*200), w.y+130);
        }
        else{
          text(dayName[dayOfWeek], w.x+100+(i*200), w.y+130);
        }
       
        if(farenheit){
          if (language.equals("Español")){
           text(expandedWeatherInfoSpanish[i][0], w.x+110+(i*200), w.y+240);
          }
          else{
           text(expandedWeatherInfo[i][0], w.x+110+(i*200), w.y+240);            
          }
         }
        else{
          if (language.equals("Español")){
           text(expandedWeatherInfoSpanish[i][1], w.x+110+(i*200), w.y+240);
          }
          else{
           text(expandedWeatherInfo[i][1], w.x+110+(i*200), w.y+240);
          }
        }
      }
      fill(0, 255, 123);
    }
  }
  //music on widget
  else if(w.name.equals("music")){
    musicFlag = 1;
    if(w.sizeY == 150){
      fill(0);
      textSize(40);
      textAlign(LEFT);
      
      backward.resize(60,60);
      image(backward, w.x+20, w.y+50);
      
      if(playFlag == 0){
        play.resize(60,60);
        image(play, w.x+100, w.y+50);
      }
      else{
        pause.resize(60,60);
        image(pause, w.x+100, w.y+50);
      }
      
      forward.resize(60,60);
      image(forward, w.x+180, w.y+50);
      
      text(musicNames[musicIndex], w.x+300, w.y+90);
    }
    //expand music
    else{
      fill(0);
      textSize(40);
      textAlign(LEFT);
      
      backward.resize(60,60);
      image(backward, w.x+20, w.y+50);
      
      if(playFlag == 0){
        play.resize(60,60);
        image(play, w.x+100, w.y+50);
      }
      else{
        pause.resize(60,60);
        image(pause, w.x+100, w.y+50);
      }
      
      forward.resize(60,60);
      image(forward, w.x+180, w.y+50);
      
      text(musicNames[musicIndex], w.x+300, w.y+90);
      
      text("Album:" + albumTitle[musicIndex], w.x+300, w.y+150);
      
      if(musicIndex == 0){
       amandaCover.resize(160, 160);
       image(amandaCover, w.x+50, w.y+130);
       if(playFlag == 1){
         String timeString = "";
         int seconds = (int) ((millis() - playSecond) / 1000) % 60 ;
         String sec = "";
         if(seconds < 10)
           sec += "0";
         sec += str(seconds);
         int minutes = (int) (((millis() - playSecond) / (1000*60)) % 60);
         timeString += str(minutes)+":"+ sec + "/";
         seconds = (int) ((musicMillis[musicIndex]) / 1000) % 60 ;
         minutes = (int) (((musicMillis[musicIndex]) / (1000*60)) % 60);
         timeString += str(minutes)+":"+str(seconds)+"0";
         text(timeString, w.x+300, w.y+230);
       }
       else{
        String timeString = "0:00/";
        int seconds = (int) ((musicMillis[musicIndex]) / 1000) % 60 ;
        int minutes = (int) (((musicMillis[musicIndex]) / (1000*60)) % 60);
        timeString += str(minutes)+":"+str(seconds)+"0";
        text(timeString, w.x+300, w.y+230);
       }
      }
      else{
       sadCover.resize(160, 160);
       image(sadCover, w.x+50, w.y+130);
       if(playFlag == 1){
         String timeString = "";
         int seconds = (int) ((millis() - playSecond) / 1000) % 60 ;
         String sec = "";
         if(seconds < 10)
           sec += "0";
         sec += str(seconds);
         int minutes = (int) (((millis() - playSecond) / (1000*60)) % 60);
         timeString += str(minutes)+":"+ sec +"/";
         seconds = (int) ((musicMillis[musicIndex]) / 1000) % 60 ;
         minutes = (int) (((musicMillis[musicIndex]) / (1000*60)) % 60);
         timeString += str(minutes)+":"+str(seconds);
         text(timeString, w.x+300, w.y+230);
       }
       else{
        String timeString = "0:00/";
        int seconds = (int) ((musicMillis[musicIndex]) / 1000) % 60 ;
        int minutes = (int) (((musicMillis[musicIndex]) / (1000*60)) % 60);
        timeString += str(minutes)+":"+str(seconds);
        text(timeString, w.x+300, w.y+230);
       }
      }
    }
  }
  else if(w.name.equals("health")){
   if(w.sizeY == 150){
     fill(0);
     textSize(40);
     textAlign(LEFT);
      
     weight.resize(120,120);
     image(weight, w.x+80, w.y+20);
     
     if (language.equals("Español")){
      text("Hoy: 130 lbs", w.x+250, w.y+60);
      text("Mes Pasado: 135 lbs", w.x+250, w.y+120);
     }
     else{
      text("Today: 130 lbs", w.x+250, w.y+60);
      text("Last Month: 135 lbs", w.x+250, w.y+120);       
     }
   }
   else{
     fill(0);
     textSize(30);
     textAlign(LEFT);
     
     if (language.equals("Español")){     
      text("Hoy:", w.x+20, w.y+200);
      textSize(27);
      text("Promedio Mes:", w.x+20, w.y+260);
      textSize(30);
     }
     else{
      text("Today:", w.x+20, w.y+200);
      text("Avg Month:", w.x+20, w.y+260);       
     }
     
     weight.resize(120,120);
     image(weight, w.x+400, w.y+20);
     
     text("130 lbs", w.x+400, w.y+200);
     text("135 lbs", w.x+400, w.y+260);
     
     steps.resize(120,120);
     image(steps, w.x+200, w.y+20);
     
     if (language.equals("Español")){ 
      text("8123 pasos", w.x+200, w.y+200);
      text("7815 pasos", w.x+200, w.y+260);
     }
      else{
      text("8123 steps", w.x+200, w.y+200);
      text("7815 steps", w.x+200, w.y+260);
     }
     
     sleep.resize(120,120);
     image(sleep, w.x+600, w.y+20);
     
      text("7h 29m", w.x+600, w.y+200);
      text("7h 20m", w.x+600, w.y+260);

   }
  }
  //TODO
  else if(w.name.equals("calendar")){
    if(w.sizeY == 150){
      if(currentProfile.emailLog.equals("None")){
        textSize(40);
        fill(0);
        textAlign(CENTER);
        
        if (language.equals("Español")){ 
         text("Inicia sesión en Gmail primero en Configuración.", w.x+(w.sizeX/2), w.y+(w.sizeY/2));
        }
        else{
         text("Log into Gmail first in Settings.", w.x+(w.sizeX/2), w.y+(w.sizeY/2));          
        }
      }
      else{
        textSize(40);
        fill(0);
        textAlign(LEFT);
        
        if (language.equals("Español")){
         text(calendarInfo[0], w.x+50, w.y+40);
         text(calendarInfo[1], w.x+50, w.y+90);
         text("...", w.x+50, w.y+130);
        }
        else{
         text(calendarInfo[0], w.x+50, w.y+40);
         text(calendarInfo[1], w.x+50, w.y+90);
         text("...", w.x+50, w.y+130);       
        }
      }
    }
    else{
      if(currentProfile.emailLog.equals("None")){
        textSize(40);
        fill(0);
        textAlign(CENTER);
        
        if (language.equals("Español")){         
         text("Inicia sesión en Gmail primero en Configuración.", w.x+(w.sizeX/2), w.y+(w.sizeY/2));
        }
        else{
         text("Log into Gmail first in Settings", w.x+(w.sizeX/2), w.y+(w.sizeY/2));        
        }
      }
      else{
        textSize(40);
        fill(0);
        textAlign(LEFT);
        text(calendarInfo[0], w.x+50, w.y+40);
        text(calendarInfo[1], w.x+50, w.y+90);
        text(calendarInfo[2], w.x+50, w.y+140);
        text(calendarInfo[3], w.x+50, w.y+190);
        calendarImage.resize(300,280);
        image(calendarImage, w.x+(w.sizeX - 310), w.y+10);
      }
    }
  }
  else if(w.name.equals("news")){
    strokeWeight(1);
    stroke(0);
    if(w.sizeY == 150){
      if(currentProfile.newsSelected.equals("None")){
        newsExist = true;
        cnnIcon.resize(90, 90);
        image(cnnIcon, w.x+50, w.y+10);
        
        reutersIcon.resize(90, 90);
        image(reutersIcon, w.x+320, w.y+10);
        
        googleNewsIcon.resize(90, 90);
        image(googleNewsIcon, w.x+590, w.y+10);
      }
      else{
        fill(255, 255, 0);
        if(currentProfile.newsSelected.equals("cnn")){
         rect(w.x+40, w.y, 110, 110); 
        }
        else if(currentProfile.newsSelected.equals("reuters")){
         rect(w.x+310, w.y, 110, 110); 
        }
        else if(currentProfile.newsSelected.equals("google")){
         rect(w.x+580, w.y, 110, 110); 
        }
        
        newsExist = true;
        cnnIcon.resize(90, 90);
        image(cnnIcon, w.x+50, w.y+10);
        
        reutersIcon.resize(90, 90);
        image(reutersIcon, w.x+320, w.y+10);
        
        googleNewsIcon.resize(90, 90);
        image(googleNewsIcon, w.x+590, w.y+10);
      }
    }
    else{
      if(currentProfile.newsSelected.equals("None")){
        newsExist = true;
        cnnIcon.resize(90, 90);
        image(cnnIcon, w.x+50, w.y+10);
        
        reutersIcon.resize(90, 90);
        image(reutersIcon, w.x+320, w.y+10);
        
        googleNewsIcon.resize(90, 90);
        image(googleNewsIcon, w.x+590, w.y+10);
        
      }
      else{
        int newsSelected = 0;
        fill(255, 255, 0);
        if(currentProfile.newsSelected.equals("cnn")){
         rect(w.x+40, w.y, 110, 110); 
        }
        else if(currentProfile.newsSelected.equals("reuters")){
         newsSelected = 1;
         rect(w.x+310, w.y, 110, 110); 
        }
        else if(currentProfile.newsSelected.equals("google")){
         newsSelected = 2;
         rect(w.x+580, w.y, 110, 110); 
        }
        
        newsExist = true;
        cnnIcon.resize(90, 90);
        image(cnnIcon, w.x+50, w.y+10);
        
        reutersIcon.resize(90, 90);
        image(reutersIcon, w.x+320, w.y+10);
        
        googleNewsIcon.resize(90, 90);
        image(googleNewsIcon, w.x+590, w.y+10);
        
        fill(0);
        if(currentProfile.newsIndex != 2)
          triangle(w.x+760, w.y+(w.sizeY - 10), w.x+740, w.y+(w.sizeY - 50), w.x+780, w.y+(w.sizeY - 50));
        if(currentProfile.newsIndex != 0)
          triangle(w.x+760, w.y+130, w.x+740, w.y+170, w.x+780, w.y+170);
        
        
        textSize(35);
        textAlign(LEFT);
        text(newsHeadline[newsSelected][currentProfile.newsIndex], w.x+20, w.y+140);
        
        textSize(25);
        
        int index = 0;
        if(newsSelected == 0){
          for(String str : cnnNewsText[currentProfile.newsIndex]){
            text(str, w.x+20, w.y+180+(25*index));
            index++;
          }
        }
        else if(newsSelected == 1){
          for(String str : reutersNewsText[currentProfile.newsIndex]){
            text(str, w.x+20, w.y+180+(25*index));
            index++;
          }
        }
        else if(newsSelected == 2){
          for(String str : googleNewsText[currentProfile.newsIndex]){
            text(str, w.x+20, w.y+180+(25*index));
            index++;
          }
        }
      }
    }
  }
  else if(w.name.equals("timer")){
    if(timerStart){
      if((millis() - timerSecond) > 1000){
        timerSecond = millis();
        if(timerSec == 0){
         timerMin-=1;
         timerSec = 59;
        }
        else
          timerSec -= 1;
       } 
    }
    timerExist = true;
    if(w.sizeY == 150){
      fill(0);
      stroke(0);
      triangle(w.x+50, w.y+30, w.x+30, w.y+70, w.x+70, w.y+70);
      triangle(w.x+50, w.y+(w.sizeY - 30), w.x+30, w.y+(w.sizeY - 70), w.x+70, w.y+(w.sizeY - 70));
      
      String timerVal = str(timerMin);
      if(timerMin < 10)
        timerVal = "0" + timerVal;
      textSize(50);
      textAlign(LEFT);
      text(timerVal + " min", w.x+90, w.y+(w.sizeY/2)+20);
      
      
      triangle(w.x+280, w.y+30, w.x+260, w.y+70, w.x+300, w.y+70);
      triangle(w.x+280, w.y+(w.sizeY - 30), w.x+260, w.y+(w.sizeY - 70), w.x+300, w.y+(w.sizeY - 70));
      
      timerVal = str(timerSec);
      if(timerSec < 10)
        timerVal = "0" + timerVal;
      
      text(timerVal + " sec", w.x+320, w.y+(w.sizeY/2)+20);
      
      fill(0,0);
      rect(w.x+540, w.y+40, rectSize[0], rectSize[1], 10);
      fill(0);
      textAlign(CENTER);
      if(timerStart){
        fill(255, 50, 50);
        text("Pause", w.x+630, w.y+90);
      }
      else{
        fill(50, 255, 50);
        text("Start", w.x+630, w.y+90);
      }
    }
    else{
      fill(0);
      stroke(0);
      triangle(w.x+50, w.y+30, w.x+30, w.y+70, w.x+70, w.y+70);
      triangle(w.x+50, w.y+(w.sizeY - 30), w.x+30, w.y+(w.sizeY - 70), w.x+70, w.y+(w.sizeY - 70));
      
      String timerVal = str(timerMin);
      if(timerMin < 10)
        timerVal = "0" + timerVal;
      textSize(50);
      textAlign(LEFT);
      text(timerVal + " min", w.x+10, w.y+(w.sizeY/2)+20);
      
      
      triangle(w.x+280, w.y+30, w.x+260, w.y+70, w.x+300, w.y+70);
      triangle(w.x+280, w.y+(w.sizeY - 30), w.x+260, w.y+(w.sizeY - 70), w.x+300, w.y+(w.sizeY - 70));
      
      timerVal = str(timerSec);
      if(timerSec < 10)
        timerVal = "0" + timerVal;
      
      text(timerVal + " sec", w.x+240, w.y+(w.sizeY/2)+20);
      
      fill(0,0);
      rect(w.x+540, w.y+40, rectSize[0], rectSize[1], 10);

      textAlign(CENTER);
      if(timerStart){
        fill(255, 50, 50);
        text("Pause", w.x+630, w.y+90);
      }
      else{
        fill(50, 255, 50);
        text("Start", w.x+630, w.y+90);
      }
      
      fill(0,0);
      rect(w.x+540, w.y+140, rectSize[0], rectSize[1], 10);
      fill(0);
      text("Cancel", w.x+630, w.y+190);
      
      
    }
  }
  
  else if(w.name.equals("stopwatch")){
    if(stopwatchStart){
      if((millis() - stopwatchBegin) > 1000){
        stopwatchBegin = millis();
        if(timerSec == 59){
         stopwatchMin+=1;
         stopwatchSec = 0;
        }
        else
          stopwatchSec += 1;
       } 
    }
    stopwatchExist = true;
    String stopwatchVal = str(stopwatchMin);
    if(stopwatchMin < 10)
      stopwatchVal = "0" + stopwatchVal;
    textSize(50);
    fill(0);
    textAlign(LEFT);
    text(stopwatchVal + " min", w.x+30, w.y+(w.sizeY/2)+20);
    
    stopwatchVal = str(stopwatchSec);
    if(stopwatchSec < 10)
      stopwatchVal = "0" + stopwatchVal;
      
    text(stopwatchVal + " sec", w.x+200, w.y+(w.sizeY/2)+20);
    
     stroke(0);
    fill(0,0);
    rect(w.x+370, w.y+(w.sizeY/2)-40, rectSize[0], rectSize[1], 10);
    textAlign(CENTER);
    if(stopwatchStart){
      fill(255, 50, 50);
      text("Pause", w.x+460,  w.y+(w.sizeY/2)+20);
    }
    else{
      fill(50, 255, 50);
      text("Start", w.x+460, w.y+(w.sizeY/2)+20);
    }
    
    fill(0,0);
    rect(w.x+580,  w.y+(w.sizeY/2)-40, rectSize[0], rectSize[1], 10);
    fill(0);
    text("Clear", w.x+670,  w.y+(w.sizeY/2)+20);
    
    if(w.sizeY == 150){
    }
    else{
    }
  }
  else if(w.name.equals("note")){
    noteExist = true;
    fill(0);
    textAlign(LEFT);
    textSize(50);
    if(currentProfile.noteList.size() <= currentProfile.noteIndex){
      text("No note", w.x+60, w.y+(w.sizeY/2)+20);
      
      stroke(0);
      fill(0,0);
      rect(w.x+540,  w.y+(w.sizeY/2)-40, rectSize[0], rectSize[1], 10);
      fill(0);
      textAlign(CENTER);
      textSize(40);
      text("Add Note", w.x+635, w.y+(w.sizeY/2)+20);
      
      if(currentProfile.noteIndex < currentProfile.noteList.size())
        triangle(w.x+760, w.y+(w.sizeY - 10), w.x+740, w.y+(w.sizeY - 50), w.x+780, w.y+(w.sizeY - 50));
      if(currentProfile.noteIndex != 0)
        triangle(w.x+760, w.y+10, w.x+740, w.y+50, w.x+780, w.y+50);
    }
    else{
      stroke(0);
      fill(0,0);
      rect(w.x+340,  w.y+(w.sizeY/2)-40, rectSize[0], rectSize[1], 10);
      rect(w.x+540,  w.y+(w.sizeY/2)-40, rectSize[0], rectSize[1], 10);
      fill(0);
      textAlign(CENTER);
      textSize(40);
      text("Edit", w.x+435, w.y+(w.sizeY/2)+20);
      text("Delete", w.x+635, w.y+(w.sizeY/2)+20);
      fill(0);
      textAlign(LEFT);
      textSize(40);
      
      if(currentProfile.noteIndex < currentProfile.noteList.size())
        triangle(w.x+760, w.y+(w.sizeY - 10), w.x+740, w.y+(w.sizeY - 50), w.x+780, w.y+(w.sizeY - 50));
      if(currentProfile.noteIndex != 0)
        triangle(w.x+760, w.y+10, w.x+740, w.y+50, w.x+780, w.y+50);
      
      if(w.sizeY == 150){
        String str = currentProfile.getNote();
        if(str.length() > 10)
          str = str.substring(0, 10) + "...";
        text(str, w.x+60, w.y+(w.sizeY/2)+20);
      }
      else{
        String str = currentProfile.getNote();
        str = str.replaceAll("(.{10})", "$1\n");
        int lines = str.split("\n").length;
        text(str, w.x+60, w.y+(w.sizeY/2)-(10*lines)+20);
      }
    }
  }
  else if(w.name.equals("email")){
    emailExist = true;
    if(currentProfile.emailLog.equals("None")){
      textSize(40);
      fill(0);
      textAlign(CENTER);
      text("Log into Gmail first in Settings", w.x+(w.sizeX/2), w.y+(w.sizeY/2));
    }
    else{
      fill(0);
      stroke(0);
      if(emailIndex < 2)
        triangle(w.x+760, w.y+(w.sizeY - 10), w.x+740, w.y+(w.sizeY - 50), w.x+780, w.y+(w.sizeY - 50));
      if(emailIndex != 0)
        triangle(w.x+760, w.y+10, w.x+740, w.y+50, w.x+780, w.y+50);
       if(w.sizeY == 150){
         textSize(40);
         textAlign(CENTER);
         text(emails[emailIndex][0], w.x+(w.sizeX/2), w.y+(w.sizeY/2));
       }
       else{
         textSize(40);
         textAlign(CENTER);
         text(emails[emailIndex][0], w.x+(w.sizeX/2), w.y+(150/2));
         stroke(0);
         strokeWeight(4);
         line(w.x+10, w.y+(150/2)+20, w.x+w.sizeX-10, w.y+(150/2)+20);
         strokeWeight(1);
         
         textSize(30);
         textAlign(LEFT);
         text(emails[emailIndex][1], w.x+30, w.y+(150/2)+60);
         
         text(emails[emailIndex][2], w.x+30, w.y+(150/2)+120);
       }
    }
  }
  else if(w.name.equals("twitter")){
    twitterExist = true;
    if(currentProfile.getMedia(0).equals("None")){
      textSize(40);
      fill(0);
      textAlign(CENTER);
      text("Log into Twitter first in Settings", w.x+(w.sizeX/2), w.y+(w.sizeY/2));
    }
    else{
      fill(0);
      stroke(0);
      if(tweetIndex < 2)
        triangle(w.x+760, w.y+(w.sizeY - 10), w.x+740, w.y+(w.sizeY - 50), w.x+780, w.y+(w.sizeY - 50));
      if(tweetIndex != 0)
        triangle(w.x+760, w.y+10, w.x+740, w.y+50, w.x+780, w.y+50);
     if(w.sizeY == 150){
       textSize(40);
       textAlign(CENTER);
       text(twitterInfo[tweetIndex][0], w.x+(w.sizeX/2), w.y+(w.sizeY/2));
     }
     else{
       textSize(40);
       textAlign(CENTER);
       text(twitterInfo[tweetIndex][0], w.x+(w.sizeX/2), w.y+(150/2));
       stroke(0);
       strokeWeight(4);
       line(w.x+10, w.y+(150/2)+20, w.x+w.sizeX-10, w.y+(150/2)+20);
       strokeWeight(1);
       
       textSize(30);
       textAlign(CENTER);
       text(twitterInfo[tweetIndex][1], w.x+(w.sizeX/2), w.y+(150/2)+60);
     }
    }
  }
  else if(w.name.equals("instagram")){
    instagramExist = true;
    if(currentProfile.getMedia(1).equals("None")){
      textSize(40);
      fill(0);
      textAlign(CENTER);
      text("Log into Instagram first in Settings", w.x+(w.sizeX/2), w.y+(w.sizeY/2));
    }
    else{
      fill(0);
      stroke(0);
      if(instaIndex < 2)
        triangle(w.x+760, w.y+(w.sizeY - 10), w.x+740, w.y+(w.sizeY - 50), w.x+780, w.y+(w.sizeY - 50));
      if(instaIndex != 0)
        triangle(w.x+760, w.y+10, w.x+740, w.y+50, w.x+780, w.y+50);
     if(w.sizeY == 150){
       textSize(40);
       textAlign(CENTER);
       text(instagramInfo[instaIndex][0], w.x+(w.sizeX/2), w.y+(w.sizeY/2));
     }
     else{
       textSize(40);
       textAlign(CENTER);
       text(instagramInfo[instaIndex][0], w.x+(w.sizeX/2), w.y+(150/2));
       stroke(0);
       strokeWeight(4);
       line(w.x+10, w.y+(150/2)+20, w.x+w.sizeX-10, w.y+(150/2)+20);
       strokeWeight(1);
       
       textSize(30);
       textAlign(LEFT);
       text(instagramInfo[instaIndex][1], w.x+30, w.y+(150/2)+60);
       
       instagramImages[instaIndex].resize(180,180);
       image(instagramImages[instaIndex], w.x+450, w.y+(150/2)+30);
     }
    }
  }
  else if(w.name.equals("facebook")){
    facebookExist = true;
    if(currentProfile.getMedia(2).equals("None")){
      textSize(40);
      fill(0);
      textAlign(CENTER);
      text("Log into Facebook first in Settings", w.x+(w.sizeX/2), w.y+(w.sizeY/2));
    }
    else{
      fill(0);
      stroke(0);
      if(faceIndex < 2)
        triangle(w.x+760, w.y+(w.sizeY - 10), w.x+740, w.y+(w.sizeY - 50), w.x+780, w.y+(w.sizeY - 50));
      if(faceIndex != 0)
        triangle(w.x+760, w.y+10, w.x+740, w.y+50, w.x+780, w.y+50);
     if(w.sizeY == 150){
       textSize(40);
       textAlign(CENTER);
       text(facebookInfo[faceIndex][0], w.x+(w.sizeX/2), w.y+(w.sizeY/2));
     }
     else{
       textSize(40);
       textAlign(CENTER);
       text(facebookInfo[faceIndex][0], w.x+(w.sizeX/2), w.y+(150/2));
       stroke(0);
       strokeWeight(4);
       line(w.x+10, w.y+(150/2)+20, w.x+w.sizeX-10, w.y+(150/2)+20);
       strokeWeight(1);
       
       textSize(30);
       textAlign(LEFT);
       text(facebookInfo[faceIndex][1], w.x+30, w.y+(150/2)+60);
     }
    }
  }
}

//Weather Info
String[][] currentWeatherInfo = {{"Hi: 50°F", "Hi: 10°C"}, {"Low: 32°F", "Low: 0°C"}, {"Current: 45°F", "Current: 7.2°C"}};
String[][] currentWeatherInfoSpanish = {{"Alto: 50°F", "Alto: 10°C"}, {"Bajo: 32°F", "Bajo: 0°C"}, {"Corriente: 45°F", "Corriente: 7.2°C"}};
String[][] expandedWeatherInfo = {{"Hi: 52°F\nLow:32°F", "Hi: 11.1°C\nLow:0°C"}, {"Hi: 54°F\nLow:34°F", "Hi: 12.2°C\nLow:1.1°C"}, {"Hi: 61°F\nLow:45°F", "Hi: 16.1°C\nLow:7.2°C"}, {"Hi: 63°F\nLow:50°F", "Hi: 17.2°C\nLow:10°C"}};
String[][] expandedWeatherInfoSpanish = {{"Alto: 52°F\nBajo:32°F", "Alto: 11.1°C\nBajo:0°C"}, {"Alto: 54°F\nBajo:34°F", "Alto: 12.2°C\nBajo:1.1°C"}, {"Alto: 61°F\nBajo:45°F", "Alto: 16.1°C\nBajo:7.2°C"}, {"Alto: 63°F\nBajo:50°F", "Alto: 17.2°C\nBajo:10°C"}};
PImage sunny;
PImage cloudy;


//Music Info
String[] musicNames = {"Varisty - Amanda", "Varisty - So Sad, So Sad"};
String[] albumTitle = {"VARISTY", "Cult of Personality"};
int[] musicMillis = {240000, 232000};
PImage play;
//https://thenounproject.com/term/play/10681/
PImage forward;
PImage backward;
//http://www.flaticon.com/free-icon/step-forward-control-button-symbol-of-triangular-right-arrow-pointing-a-vertical-line_37075
PImage pause;
//https://www.iconfinder.com/search/?q=pause
PImage amandaCover;
PImage sadCover;
int playFlag = 0;
int playSecond = millis();
int musicIndex = 0;


//Health Info
PImage weight;
//http://www.freeiconspng.com/icons/scale-icon
PImage steps;
//https://thenounproject.com/term/walking/35091/
PImage sleep;
//https://www.iconfinder.com/icons/573088/apple_disturb_good_moon_night_sleep_stars_icon


//Calendar info... for later...
String[] calendarInfo = {"April 22 - Earth Day", "April 23 - Bob's Birthday", "April 28 - Arbor Day", "April 29 - Party WooO"};
String[] calendarInfoSpanish = {"22 de Abril - día de la Tierra", "23 de Abril - Cumpleaños de Bob", "28 de Abril- Dia del arbol", "29 de Abril- Fiesto WooO"};
PImage calendarImage;

//News
PImage cnnIcon;
PImage reutersIcon;
PImage googleNewsIcon;
boolean newsExist = false;
String[][] newsHeadline = {{"Kim Jong-un orders 600,000 out of Pyongyang", "His name is Albus, not Young Dumbledore", "Dog found after 20 minutes of being missing"}, 
                           {"Comedian Charlie Murphy Dies at 57", "Cosmopolitan magazine: ‘Cancer is a diet plan’", "Boy, 8, drives sister, 4, to McDonald's"}, 
                           {"Trump lifts ban on hunting hibernating bears", "Staff accidentally shoots self at NRA headquarters", "Hacker sets off 156 emergency sirens in Dallas"}};

String[][] newsHeadlineSpanish = {{"Kim Jong-un ordena 600.000 de Pyongyang.", "Su nombre es Albus, no Young Dumbledore.", "Perro encontrado después de 20 minutos de estar desaparecido."}, 
                           {"El comediante Charlie Murphy muere a los 57 años.", "Cosmopolitan magazine: 'El cáncer es un plan de dieta'", "niño de 8, Conduce a hermana, 4, a McDonald's"}, 
                           {"Trump levanta la prohibición de cazar osos en hibernación.", "El personal se dispara accidentalmente en la sede de la NRA", "Hacker dispara 156 sirenas de emergencia en Dallas"}};

String[][] cnnNewsText = {
                        //http://koreajoongangdaily.joins.com/news/article/article.aspx?aid=3032113
                        {"North Korean leader Kim Jong-un recently ordered the deportation of", "nearly 600,000 Pyongyang residents to the suburbs, a local source", "told the JoongAng Ilbo Monday. The deportation represents one-", "fourth of Pyongyang’s current population of 2.6 million. It ", "is not known when they will be forced to move or to where. "},
                        //http://ew.com/movies/2017/04/12/harry-potter-dumbledore-jude-law/
                        {"By now you’ve heard the news of the ‘Alohomora’ of casting", "decisions— Jude Law is playing a young Albus Dumbledore in the next", "Fantastic Beasts and Where to Find Them film, which presently has", "no name and no plot but two A-list movie stars onboard to play", "juvenile versions of two iconic characters from Harry Potter."}, 
                        {"A brave dog named Sparks was found 20 minutes after his", "disappearance from a local home in Chicago. The family was very", "gracious that he came back so quickly, \"He's a good boy\"", "stated the owner. Sparks received many treats."}};

String[][] cnnNewsTextSpanish = {
                        //http://koreajoongangdaily.joins.com/news/article/article.aspx?aid=3032113
                        {"El líder norcoreano Kim Jong-un ordenó recientemente la deportación de casi 600.000 residentes de Pyongyang a los suburbios, dijo una fuente local el lunes a JoongAng Ilbo. La deportación representa una cuarta parte de la población actual de Pyongyang de 2.6 millones. No se sabe cuándo se verán obligados a moverse oa dónde."},
                        //http://ew.com/movies/2017/04/12/harry-potter-dumbledore-jude-law/
                        {"A estas alturas ya has escuchado la noticia de la 'Alohomora' de decisiones de casting- Jude Law está interpretando a un joven Albus Dumbledore en la próxima película Fantastic Beasts y Where to Find Them, que actualmente no tiene nombre ni argumento, sino dos A-list Estrellas de cine a bordo para jugar versiones juveniles de dos personajes icónicos de Harry Potter."}, 
                        {"Un valiente perro llamado Sparks fue encontrado 20 minutos después de su desaparición de una casa local en Chicago. La familia fue muy amable que regresó tan rápidamente. Es un buen perro declaró el propietario. Sparks recibió muchas golosinas."}};

String[][] reutersNewsText = {
                              //http://www.hollywoodreporter.com/news/charlie-murphy-dead-comedian-was-57-993220
                              {"Charlie Murphy, the former Chappelle's Show star", "and Eddie Murphy's older brother, has died, publicist", "Domenick Nati told The Hollywood Reporter. He was 57.", "Murphy died from leukemia on Wednesday, said Nati. "},
                              //https://www.washingtonpost.com/news/morning-mix/wp/2017/04/12/dear-cosmopolitan-magazine-cancer-is-not-a-diet-plan/
                              {"Readers who clicked on the link to find out about", "an astonishing weight loss secret were taken aback by", "the story of a woman who lost 44 pounds after being diagnosed with","a rare cancer. The story’s focus on slimming", "down infuriated them."},
                              //http://www.sfgate.com/national/article/Boy-8-drives-sister-4-to-McDonald-s-for-a-11068868.php
                              {"Witnesses in other vehicles spotted the underage driver", "and called police. They reported he obeyed traffic rules, stopped at", "red lights, adhered to the speed limit and didn't sideswipe a single", "garbage can. After reaching the drive-thru at the fast-food restaurant, ", "the boy paid for the cheeseburgers with money from his piggy bank."}};
                              
String[][] reutersNewsTextSpanish = {
                              //http://www.hollywoodreporter.com/news/charlie-murphy-dead-comedian-was-57-993220
                              {"Charlie Murphy, ex estrella de Chappelle's Show y hermano mayor de Eddie Murphy ha muerto el publicista Domenick Nati le dijo a The Hollywood Reporter. El tenia 57 años. Murphy murió de leucemia el miércoles, dijo Nati."},
                              //https://www.washingtonpost.com/news/morning-mix/wp/2017/04/12/dear-cosmopolitan-magazine-cancer-is-not-a-diet-plan/
                              {"Los lectores que hicieron clic en el enlace para averiguar sobre un sorprendente secreto de pérdida de peso fueron sorprendidos por la historia de una mujer que perdió 44 libras después de ser diagnosticado con un cáncer raro. El énfasis de la historia en adelgazar los enfureció."},
                              //http://www.sfgate.com/national/article/Boy-8-drives-sister-4-to-McDonald-s-for-a-11068868.php
                              {"Testigos en otros vehículos descubrieron al conductor menor de edad y llamaron a la policía. Informaron que obedeció las reglas de tránsito, se detuvo en las luces rojas, siguió el límite de velocidad y no recorrió una sola cubeta de basura. Después de llegar al drive-thru en el restaurante de comida rápida, el chico pagó por los cheeseburgers con dinero de su alcancía."}};
                              
String[][] googleNewsText = {
                              //https://www.theweathernetwork.com/news/articles/trump-rids-ban-on-hunting-bears-and-wolves-in-alaska-refuges/81051/
                              {"A joint bill from the U.S. House and Senate, signed off by President", "Donald Trump on Monday, revokes an Obama-era rule that bans ", "'predator control' hunting on Alaska's refuges. The ban protected", "hibernating bears from being hunted, along with wolf cubs in", "dens."},
                              //https://www.usatoday.com/story/news/2017/04/07/employee-accidentally-shoots-hurts-self-nra-museum/100192128/
                              {"An employee of a Fairfax, Va., museum representing the nation's", "largest gun rights organization accidentally shot himself on Friday,", "police said. The staffer at the National Firearms Museum, a site run", "by the National Rifle Association out of its headquarters, suffered", "a minor wound to the lower body."},
                              //https://www.usatoday.com/story/news/2017/04/08/hacker-triggers-all-156-emergency-sirens-dallas/100212412/
                              {"Dallas city officials said Saturday that a hacker is to blame for", "setting off all the city's 156 emergency outdoor sirens, which wailed", "for an hour and half overnight. Rocky Vaz, director of the city's Office", "of Emergency Management, said engineers determined an", "unidentified hacker somewhere in the Dallas area was responsible."}
                            };
                            
String[][] googleNewsTextSpanish = {
                              //https://www.theweathernetwork.com/news/articles/trump-rids-ban-on-hunting-bears-and-wolves-in-alaska-refuges/81051/
                              {"Un proyecto de ley conjunto de la Cámara de los Estados Unidos y el Senado, firmado por el Presidente. Donald Trump el lunes, revoca una regla de la era Obama que prohíbe. ", "'Control depredador' Caza en los refugios de Alaska. La prohibición protegía a los osos hibernando de ser cazados, junto con los cachorros de lobo en las guaridas."},
                              //https://www.usatoday.com/story/news/2017/04/07/employee-accidentally-shoots-hurts-self-nra-museum/100192128/
                              {"Un empleado de un museo de Fairfax, Virginia, que representa a la organización de derechos de armas más grande de la nación, se suicidó accidentalmente Dijo la policía el viernes. El funcionario del Museo Nacional de Armas de Fuego, un sitio dirigido por la Asociación Nacional de Rifle fuera de su sede, sufrió una pequeña herida en la parte inferior del cuerpo."},
                              //https://www.usatoday.com/story/news/2017/04/08/hacker-triggers-all-156-emergency-sirens-dallas/100212412/
                              {"Funcionarios de la ciudad de Dallas dijeron el sábado que un hacker es culpable de haber puesto en marcha todas las sirenas exteriores de emergencia de la ciudad, que se lamentaron durante una hora y media durante la noche. Rocky Vaz, director de la Oficina de Administración de Emergencias de la ciudad, dijo que los ingenieros determinaron que un hacker no identificado en algún lugar del área de Dallas era responsable."}
                            };
                            
boolean timerStart = false;
int timerBegin = 0;
int timerSec = 0;
int timerMin = 0;
int timerSecond = 0;
int timerMillisTotal = 0;
int[] rectSize = {190, 80};
boolean timerExist = false;

boolean stopwatchStart = false;
int stopwatchBegin = 0;
int stopwatchSec = 0;
int stopwatchMin = 0;
boolean stopwatchExist = false;

boolean noteExist = false;

boolean emailExist = false;
int emailIndex = 0;
String[][] emails = {
                      {"Call me NOW - mom@gmail.com", "to: me", "You haven't spoke to me in half a day. \nAre you alive???"},
                      {"[MASSMAIL]Email 593 - massmail@uic.edu", "to: MASSMAIL_STUDENT", "Email relevant to you!"},
                      {"Bring cake! - bob@gmail.com", "to: me", "You better bring cake to my party."}
                    };
          
String[][] emailsSpanish = {
                      {"Llámame AHORA - mom@gmail.com", "A: yo", "No me has hablado en medio día. ¿estás vivo?"},
                      {"[MASSMAIL] Correo electrónico 593 - massmail@uic.edu", "A: MASSMAIL_STUDENT", "Correo electrónico relevante para usted!"},
                      {"Trae pastel! - bob@gmail.com", "A: yo", "You better bring cake to my party."}
                    };
          
int tweetIndex = 0;
boolean twitterExist = false;
String[][] twitterInfo = {
                          {"CNN - @CNN", "Know your rights: Here's what to do if your \nflight is overbooked http://cnn.it/2o7yWin "},
                          {"Bob the Builder - @Builder", "Can we fix it?\nYes we can!"},
                          {"Ethan Klein - @h3h3productions","thanks for the meme minerdigger from /r/h3h3productions,\n but sadly we will need to re-accommodate you"}
                        };
                        
String[][] twitterInfoSpanish = {
                          {"CNN - @CNN", "Conoce tus derechos: Esto es lo que debe hacer si su vuelo está lleno http://cnn.it/2o7yWin "},
                          {"Bob the Builder - @Builder", "Podemos arreglarlo? Si podemos!"},
                          {"Ethan Klein - @h3h3productions","Gracias por el meme minerdigger from /r/h3h3productions, Pero lamentablemente vamos a tener que volver a acomodar a usted"}
                        };
            
int instaIndex = 0;
boolean instagramExist = false;
String[][] instagramInfo = {
                            {"foodphotographer512", "Had a great lunch today!<3\n#blessed#yummy"},
                            {"edmluvr","Zedd concert!!\n#edm"},
                            {"treelover123","Nature at its finest.\n#peace#love#happiness"}
                           };
               
String[][] instagramInfoSpanish = {
                            {"foodphotographer512", "Tuve un gran almuerzo hoy!<3\n#bendito#sabroso"},
                            {"edmluvr","concierto de Zedd!!\n#edm"},
                            {"treelover123","La naturaleza en su mejor.\n#paz#amor#felicidad"}
                           };
PImage[] instagramImages;
//1: http://blog.instagram.com/post/27128108925/the-scoop-on-food-photography-want-to-see-more
//2: http://68.media.tumblr.com/211ebcb3e7761aa53eb02da02644ac55/tumblr_mrfnzdT6lI1qj08ewo1_1280.jpg
//3: http://blog.instagram.com/post/79690139772/locallensbelohorizonte
int faceIndex = 0;
boolean facebookExist = false;
String[][] facebookInfo = {
                            {"Bob Joe", "I love the spring!\nIt is so warm out right now!"},
                            {"Billy Bob", "I love my dogs, my cats, and\nmy hamster"},
                            {"Bob Joey", "Party at my place on April 28th! Don't miss it!"}
                           };
               
String[][] facebookInfoSpanish = {
              {"Bob Joe", "Yo amo la primavera! Es tan caliente ahora!"},
              {"Billy Bob", "Yo amo a mis perros, gatos, y mi hámster."},
              {"Bob Joey", "Fiesta en mi casa el 28 de abril! No te lo pierdas!"}
               };              
