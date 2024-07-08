package MyPackage;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

/**
 * Servlet implementation class MyServlet
 * @param <PrintWriter>
 */
@WebServlet("/MyServlet")
public class MyServlet<PrintWriter> extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String place_name = request.getParameter("userinput");
		System.out.println("Place Name :- "+place_name);
		String apiKey = "12545815b73f560d0bb17554f57ab5a7";
		String apiURL = "https://api.openweathermap.org/data/2.5/weather?q="+place_name+"&appid="+apiKey+"";
		URL url = new URL(apiURL);
		HttpURLConnection conne = (HttpURLConnection)url.openConnection();
		conne.setRequestMethod("GET");
		
		InputStream ins = conne.getInputStream();
		InputStreamReader reader = new InputStreamReader(ins);
		
		StringBuilder responsecontent = new StringBuilder();
		Scanner sc = new Scanner(reader);
		while(sc.hasNext()) {
			responsecontent.append(sc.nextLine());
			
		}
		sc.close();
		
		Gson gson = new Gson();
		JsonObject jo = gson.fromJson(responsecontent.toString(), JsonObject.class);
		System.out.println(jo);
		
		//get the Time
		 long dateTimestamp = jo.get("dt").getAsLong() * 1000;
         String date = new Date(dateTimestamp).toString();
         
        //temperature
         double temperatureKelvin = jo.getAsJsonObject("main").get("temp").getAsDouble();
         int temperatureCelsius = (int) (temperatureKelvin - 273.15);
         
        //humidity
         int humidity= jo.getAsJsonObject("main").get("humidity").getAsInt();
         
        //wind speed
         double WindSpeed = jo.getAsJsonObject("wind").get("speed").getAsDouble();
         
        //WeatherCondition
         String WhatherCondition = jo.getAsJsonArray("weather").get(0).getAsJsonObject().get("main").getAsString();
         
         System.out.println(WhatherCondition);
         
        // Set the data as request attributes (for sending to the jsp page)
         request.setAttribute("date", date);
         request.setAttribute("city", place_name);
         request.setAttribute("temperature",temperatureCelsius);
         request.setAttribute("humidity", humidity);
         request.setAttribute("WindSpeed", WindSpeed);
         request.setAttribute("WhatherCondition", WhatherCondition);
         request.setAttribute("weatherData", response.toString());
         
         conne.disconnect();
         
         request.getRequestDispatcher("index.jsp").forward(request, response);
	}

}
