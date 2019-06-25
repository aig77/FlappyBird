class Timer {

  int currTimeMillis;
  int totalTimeMillis;
  boolean isStarted;

  Timer()
  {
    this(1);
  }

  Timer(int timeInSeconds) 
  {
    setTime(timeInSeconds);
    isStarted = false;
  }
  
  void start() 
  {
    currTimeMillis = millis(); 
    isStarted = true;
  }
  void setTime(int timeInSeconds)
  {
    totalTimeMillis = timeInSeconds * 1000;
  }

  boolean isFinished() 
  { 
    //calculate ellapsed time
    int ellapsed = millis() - currTimeMillis;

    //if the timer was running and enough time has passed, return true
    if (isStarted && ellapsed >= totalTimeMillis)
    {
      isStarted = false;
      return true;
    }
    return false;
  }

  int getTimeSeconds()
  {
    return totalTimeMillis / 1000;
  }
  
  int getTimeMilliseconds()
  {
    return totalTimeMillis;
  }
}