<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Weather App</title>
    <link rel="stylesheet" href="Style.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
</head>
<body>

    <div class="mainContainer">
        <form action="MyServlet" method="post" class="searchInput">
            <input type="text" placeholder="Enter City Name" id="searchInput" value="loni kalbhor" name="userinput" />
            <button id="searchButton" type="submit" onClick="whatherapp()"><i class="fa-solid fa-magnifying-glass"></i></button>
        </form>
        <div class="weatherDetails">
            <div class="weatherIcon">
                <img src="icon1.png" alt="Weather Icon" id="weather-icon">
                <h2>${temperature} °C</h2>
                <input type="hidden" value="${WhatherCondition}" id="wc"/>
            </div>
            
            <div class="cityDetails">        
                <div class="desc"><strong>${city}</strong></div>
                <div class="date">${date}</div>
            </div>
            <div class="windDetails">
                <div class="humidityBox">
                    <img src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhgr7XehXJkOPXbZr8xL42sZEFYlS-1fQcvUMsS2HrrV8pcj3GDFaYmYmeb3vXfMrjGXpViEDVfvLcqI7pJ03pKb_9ldQm-Cj9SlGW2Op8rxArgIhlD6oSLGQQKH9IqH1urPpQ4EAMCs3KOwbzLu57FDKv01PioBJBdR6pqlaxZTJr3HwxOUlFhC9EFyw/s320/thermometer.png" alt="Humidity">
                    <div class="humidity">
                        <span>Humidity </span>
                        <h2>${humidity}% </h2>
                    </div>
                </div> 
               
                <div class="windSpeed">
                    <img src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiyaIguDPkbBMnUDQkGp3wLRj_kvd_GIQ4RHQar7a32mUGtwg3wHLIe0ejKqryX8dnJu-gqU6CBnDo47O7BlzCMCwRbB7u0Pj0CbtGwtyhd8Y8cgEMaSuZKrw5-62etXwo7UoY509umLmndsRmEqqO0FKocqTqjzHvJFC2AEEYjUax9tc1JMWxIWAQR4g/s320/wind.png" alt="Wind Speed">
                    <div class="wind">
                        <span>Wind Speed</span>
                        <h2>${windSpeed} km/h</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
    
	var weatherIcon = document.getElementById("weather-icon");
	var val = document.getElementById("wc").value;
	  switch (val) {
      case 'Clouds':
          weatherIcon.src = "https://cdn-icons-png.flaticon.com/128/1163/1163661.png";
          break;
      case 'Clear':
          weatherIcon.src = "https://cdn-icons-png.flaticon.com/128/6402/6402939.png";
          break;
      case 'Rain':
          weatherIcon.src = "https://cdn-icons-png.flaticon.com/128/1146/1146860.png";
          break;
      case 'Mist':
          weatherIcon.src = "https://cdn-icons-png.flaticon.com/128/2930/2930095.png";
          break;
      case 'Snow':
          weatherIcon.src = "https://cdn-icons-png.flaticon.com/128/1409/1409305.png";
          break;
      case 'Haze':
          weatherIcon.src = "https://cdn-icons-png.flaticon.com/128/5243/5243833.png";
          break;
  }

	  </script>
</body>

</html>
