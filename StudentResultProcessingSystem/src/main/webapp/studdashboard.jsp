<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
 
<%
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
 
map = new HashMap<Object,Object>(); map.put("label", "1973"); map.put("y", 1883.96); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "1974"); map.put("y", 1814.907); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "1975"); map.put("y", 1679.773); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "1976"); map.put("y", 1794.96); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "1977"); map.put("y", 1844.13); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "1978"); map.put("y", 1829.944); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "1979"); map.put("y", 1911.103); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "1980"); map.put("y", 1776.497); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "1981"); map.put("y", 1698.761); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "1982"); map.put("y", 1501.657); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "1983"); map.put("y", 1473.308); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "1984"); map.put("y", 1603.901); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "1985"); map.put("y", 1558.17); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "1986"); map.put("y", 1510.808); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "1987"); map.put("y", 1568.088); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "1988"); map.put("y", 1647.77); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "1989"); map.put("y", 1675.294); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "1990"); map.put("y", 1695.454); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "1991"); map.put("y", 1650.595); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "1992"); map.put("y", 1720.721); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "1993"); map.put("y", 1718.338); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "1994"); map.put("y", 1748.211); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "1995"); map.put("y", 1752.434); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "1996"); map.put("y", 1804.221); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "1997"); map.put("y", 1823.662); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "1998"); map.put("y", 1811.003); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "1999"); map.put("y", 1779.849); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2000"); map.put("y", 1787.086); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2001"); map.put("y", 1711.619); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2002"); map.put("y", 1684.157); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2003"); map.put("y", 1693.878); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2004"); map.put("y", 1731.715); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2005"); map.put("y", 1676.595); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2006"); map.put("y", 1664.477); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2007"); map.put("y", 1666.223); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2008"); map.put("y", 1608.085); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2009"); map.put("y", 1399.889); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2010"); map.put("y", 1507.555); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2011"); map.put("y", 1497.764); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2012"); map.put("y", 1487.709); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2013"); map.put("y", 1505.784); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2014"); map.put("y", 1511.255); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2015"); map.put("y", 1457.119); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "2016"); map.put("y", 1424.077); list.add(map);
 
String dataPoints = gsonObj.toJson(list);
%>
    
<!DOCTYPE html5>
<html>
    <head>
        <title>Student dashboard</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/studdashboard.css"> 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;600&display=swap" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
window.onload = function() { 
 
var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	theme: "light2",
	title: {
		text: "Total Industrial Sector CO2 Emissions"
	},
	axisX: {
		crosshair: {
			enabled: true,
			snapToDataPoint: true
		}
	},
	axisY: {
		title: "Emissions (in million metric tons)",
		crosshair: {
			enabled: true,
			snapToDataPoint: true,
			valueFormatString: "##0.00",
		}
	},
	data: [{
		type: "area",
		yValueFormatString: "##0.00 million metric tons",
		dataPoints: <%out.print(dataPoints);%> 
	}]
});
chart.render();
 
}
</script>
    </head> 
    <body>
        <div class="tabs">
            <div class="tabs__sidebar">
                <div class="space"><img src="images/education.png" class="edu"></div>
                <div class="space2"><i class="fa fa-angle-left"></i></div>
                <button class="tabs__button" data-for-tab="1"><i class="fa fa-graduation-cap"></i>Dashboard</button>
                <button class="tabs__button" data-for-tab="2"><i class="fa fa-bullseye"></i>Result</button>
                <button class="tabs__button" data-for-tab="3"><i class="fa fa-bar-chart"></i>Performance</button>
                <button class="tabs__button"><i class="fa fa-power-off"></i>Logout</button>
            </div>
        
            
            
            <div class="tabs__content" data-tab="1">
                <h2>Canara College Mangalore</h2><br>
                <img  src="" id="image">
                <h3>About Canara College</h3><br>
                
                <p class="about">
                 Canara College with its noble vision to prepare educationally strong and culturally vibrant students is a prestigious institute for higher learning, well acclaimed to have its deep rooted existence since 1973 with its moral ideals, rich core values and fusion of cultural ethos; pioneered by a great legendary soul, Late Sri Ammembal Subba Rao Pai. It has a glorious history and legacy in the field of imparting value-based, character building education to its aspirants. True to its motto of “Educating for Righteous Life” and philosophy of commitment towards offering quality education at affordable cost, it is located centrally in the coastal educational hub of Mangaluru city. The institution is governed and managed by Canara High School Association, Mangaluru, reaccredited by NAAC and affiliated to Mangalore University.<br><br><br>

                  It offers undergraduate programmes in Commerce (B.Com.), Bachelor of Commerce Professoinal with Coaching for CA and CS, Bachelor of Science [B.Sc. (PCM, PMC and BZC)], Bachelor of Computer Applications (B.C.A.), Bachelor of Business Administration (B.B.A.) and a post graduate programme in Commerce (M.Com.).
                </p> 
            </div>
            
            <div class="tabs__content" data-tab="2">
                <div class="space3">
                <div class="space4">semester 1</div>
                <div class="space4">semester 2</div>
                <div class="space4">semester 3</div>
                <div class="space4">semester 4</div>
                <div class="space4">semester 5</div>
                <div class="space4">semester 6</div>
                </div> 
            </div>
            
            
            <div class="tabs__content" data-tab="3">
                <div id="chartContainer"></div> 
            </div>
        </div>
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
    
        
        
        <script>
            function setupTabs () {
                document.querySelectorAll(".tabs__button").forEach(button => {
                    
                    button.addEventListener("click", () => {
                        
                       const sideBar = button.parentElement;
                       const tabsContainer = sideBar.parentElement;
                       const tabNumber = button.dataset.forTab;
                       const tabToActivate =tabsContainer.querySelector(`.tabs__content[data-tab ="${tabNumber}"]`);
                        
                        sideBar.querySelectorAll(".tabs__button").forEach(button => { 
                            button.classList.remove("tabs__button--active");
                            
                        });
                        
                        
                        
                        tabsContainer.querySelectorAll(".tabs__content").forEach(tab => { 
                            tab.classList.remove("tabs__content--active");
                            
                        });
                        
                        button.classList.add("tabs__button--active");
                        tabToActivate.classList.add("tabs__content--active");
                        
                    });
                    
                });
                                                                    
             }
            
            document.addEventListener("DOMContentLoaded", () => {
                setupTabs();
                
                
                document.querySelectorAll(".tabs").forEach(tabsContainer =>{
                    tabsContainer.querySelector(".tabs__sidebar .tabs__button").click();
                    
                    
                });
            });
        </script>
        
        <script type="text/javascript">
            let image = document.getElementById("image");
            let images = ['images/can1.jpg','images/can2.jpg','images/can3.jpg','images/can4.jpg','images/can5.jpg','images/can6.jpg','images/can7.jpg']
            setInterval(function(){
                let random = Math.floor(Math.random()*7);
                image.src = images[random];
                
                
            },2500);
        </script>
    </body>
</html>