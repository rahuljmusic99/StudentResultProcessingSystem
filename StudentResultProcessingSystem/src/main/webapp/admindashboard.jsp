<%@page import="jakarta.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.CanaraExamManager.util.DBConnection" %>
<%@page import="org.CanaraExamManager.dao.LoadDataDao" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.Statement" %>

<% 
	
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	
	//In case, if User session is not set, redirect to Login page.
	if((request.getSession(false).getAttribute("admin")== null) )
	{
%> 
<jsp:forward page="/adminlogin.jsp"></jsp:forward>
<%}%>

<%
	LoadDataDao loadData = new LoadDataDao(); 
	ResultSet programmeResultSet = loadData.loadProgrammeData();
	 
%>

    
<!DOCTYPE html5>
<html>
    <head>
        <title>Admin Dashboard</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/admindashbord.css"> 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;600&display=swap" rel="stylesheet">
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/dashboard.js"></script>
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="js/popup.js"></script>
    </head> 
    <body>
        <div class="tabs">
            <div class="tabs__sidebar">
                <div class="space"><img src="css/images/education.png" class="edu"></div>
                <div class="space2"><i class="fa fa-angle-left"></i></div>
                <button class="tabs__button" data-for-tab="1"><i class="fa fa-graduation-cap"></i>Dashboard</button>
                <button class="tabs__button" data-for-tab="2"><i class="fa fa-graduation-cap"></i>Student Details</button>
                <button class="tabs__button" data-for-tab="3"><i class="fa fa-graduation-cap"></i>Staff Details</button>
                <button class="tabs__button" data-for-tab="4"><i class="fa fa-bar-chart"></i>Programme and courses</button>
                <button class="tabs__button" data-for-tab="5"><i class="fa fa-bar-chart"></i>classes</button>
                <button class="tabs__button" data-for-tab="6"><i class="fa fa-bullseye"></i>Student Result</button>
                <button class="tabs__button" onclick="logoutConfirm();" ><i class="fa fa-power-off"></i>Logout</button>
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
                <div class="protab"> 
                    
                    
                    <button class="refresh" id="ref" onclick="myFunction()">Refresh page</button>
                    <h4>Student Details Management</h4>
                    <div class="inner__protab">
                        
                    <div class="inner1">
                        <h6 class="left">Students list</h6>
                        <div id="add2" class="add" title="Add programme" onclick="myFunction9()">
                        <i class="fa fa-plus" title="Add programme"></i></div></div>
                    <table border="1" class="tb1" cellspacing="0" padding="10" rules="all">
                        <tr >
                            <th>Programme Name</th>
                            <th>Class</th>
                            <th>Student Name</th>
                            <th>Register Number</th>
                            <th>View Student Details</th>
                            <th>Action</th>
                        </tr>
                        <tr>
                            <td class="td1"></td>   <!--Programme name-->
                            <td class="td2"></td>   <!--Semseter-->
                            <td></td>   <!--Course-->
                            <td></td>
                            <td class="td2"><button class="btn__edit" id="btn-edit2" onclick="myFunction10()"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><br>View</button></td> <!--Edit course-->
                            <td class="td3"><div class="circle1" title="Edit Programme" id="edit1" onclick="myFunction11()"><i class="fa fa-pencil" aria-hidden="true"></i></div><div class="circle2" title="Delete Programme"><i class="fa fa-times" aria-hidden="true"></i></div></td> <!--Action-->
                        </tr>
                    </table>
                    </div>
                </div>
            
                
                <div class="bg-model6">
                    <div class="model-content6">
                        <div class="close6" id="close" >+</div>
                        <div class="header6">
                            <h1>Add Student Data</h1></div>
                             <img class="student" src="images/studenticon.svg">
                            <form action="" >
                                <input type="text" placeholder="First Name" class="merge1">
                                <input type="text" placeholder="Last Name" class="merge1">
                                <select class="merge2">
                                <option value="" disabled selected hidden>Gender</option>
                                <option>Male</option>
                                <option>Female</option>
                                <option>Other</option>
                                </select>
                                <input type="text" placeholder="Date of Birth" class="merge2">
                                <input type="text" placeholder="Email" class="merge1">
                                <input type="text" placeholder="Mobile Number" class="merge1">
                                <input type="text" placeholder="Address" class="merge1">
                                <input type="text" placeholder="Pincode" class="merge1">
                                <input type="text" placeholder="city" class="merge3">
                                <input type="text" placeholder="District" class="merge3">
                                <input type="text" placeholder="State" class="merge3">
                                <input type="text" placeholder="Year Of Joining" class="merge2">
                                <select class="merge3">
                                <option value="" disabled selected hidden>Programme</option>
                                <option></option>
                                </select>
                                <select class="merge3">
                                <option value="" disabled selected hidden>class</option>
                                <option></option>
                                </select>
                                <select class="merge3">
                                <option value="" disabled selected hidden>Class Year</option>
                                <option>Adimale</option>
                                </select>
                                <select class="merge2">
                                <option value="" disabled selected hidden>Current Sem</option>
                                <option></option>
                                </select>
                                
                                
                                <input type="text" placeholder="Register Number" class="merge1">
                                <input type="text" placeholder="Password" class="merge1">
                                <button id="button6" >ADD</button>
                                
                            
                        </form>
                    </div>
                </div>
                
                <div class="bg-model7">
                    <div class="model-content7">
                        <div class="close7" id="close" >+</div>
                        <div class="header7">
                            <h1>Student Details</h1></div>
                             <img class="student" src="images/studenticon.svg">
                            <form action="" >
                                <input type="text" placeholder="First Name" class="merge1">
                                <input type="text" placeholder="Last Name" class="merge1">
                                <select class="merge2">
                                <option value="" disabled selected hidden>Gender</option>
                                <option>Adimale</option>
                                </select>
                                <input type="text" placeholder="Date of Birth" class="merge2">
                                <input type="text" placeholder="Email" class="merge1">
                                <input type="text" placeholder="Mobile Number" class="merge1">
                                <input type="text" placeholder="Address" class="merge1">
                                <input type="text" placeholder="Pincode" class="merge1">
                                <input type="text" placeholder="city" class="merge3">
                                <input type="text" placeholder="District" class="merge3">
                                <input type="text" placeholder="State" class="merge3">
                                <input type="text" placeholder="Year Of Joining" class="merge2">
                                <select class="merge3">
                                <option value="" disabled selected hidden>Programme</option>
                                <option>Adimale</option>
                                </select>
                                <select class="merge3">
                                <option value="" disabled selected hidden>class</option>
                                <option>Adimale</option>
                                </select>
                                <select class="merge3">
                                <option value="" disabled selected hidden>Class Year</option>
                                <option>Adimale</option>
                                </select>
                                <select class="merge2">
                                <option value="" disabled selected hidden>Current Sem</option>
                                <option>Adimale</option>
                                </select>
                                <input type="text" placeholder="Register Number" class="merge1">
                                <input type="text" placeholder="Password" class="merge1">
                        </form>
                    </div>
                </div>
                
                <div class="bg-model8">
                    <div class="model-content8">
                        <div class="close8" id="close" >+</div>
                        <div class="header8">
                            <h1>Edit Student Details</h1></div>
                             <img class="student" src="images/studenticon.svg">
                            <form action="" >
                                <input type="text" placeholder="First Name" class="merge1">
                                <input type="text" placeholder="Last Name" class="merge1">
                                <select class="merge2">
                                <option value="" disabled selected hidden>Gender</option>
                                <option>Adimale</option>
                                </select>
                                <input type="text" placeholder="Date of Birth" class="merge2">
                                <input type="text" placeholder="Email" class="merge1">
                                <input type="text" placeholder="Mobile Number" class="merge1">
                                <input type="text" placeholder="Address" class="merge1">
                                <input type="text" placeholder="Pincode" class="merge1">
                                <input type="text" placeholder="city" class="merge3">
                                <input type="text" placeholder="District" class="merge3">
                                <input type="text" placeholder="State" class="merge3">
                                <input type="text" placeholder="Year Of Joining" class="merge2">
                                <select class="merge3">
                                <option value="" disabled selected hidden>Programme</option>
                                <option>Adimale</option>
                                </select>
                                <select class="merge3">
                                <option value="" disabled selected hidden>class</option>
                                <option>Adimale</option>
                                </select>
                                <select class="merge3">
                                <option value="" disabled selected hidden>Class Year</option>
                                <option>Adimale</option>
                                </select>
                                <select class="merge2">
                                <option value="" disabled selected hidden>Current Sem</option>
                                <option>Adimale</option>
                                </select>
                                
                                
                                <input type="text" placeholder="Register Number" class="merge1">
                                <input type="text" placeholder="Password" class="merge1">
                                <button id="button8" >UPDATE</button>
                        </form>
                    </div>
                </div>
                </div>
            
            
            
            
            
            
            
           
            
            <div class="tabs__content" data-tab="3">
                <div class="protab"> 
                    
                    
                    <button class="refresh" id="ref" onclick="myFunction()">Refresh page</button>
                    <h4>Staff Details Management</h4>
                    <div class="inner__protab">
                        
                    <div class="inner1">
                        <h6 class="left">Staff list</h6>
                        <div id="add3" class="add" title="Add programme" onclick="myFunction12()">
                        <i class="fa fa-plus" title="Add programme"></i></div></div>
                    <table border="1" class="tb1" cellspacing="0" padding="10" rules="all">
                        <tr >
                            <th>Programme Name</th>
                            <th>Class</th>
                            <th>Student Name</th>
                            <th>Register Number</th>
                            <th>View Student Details</th>
                            <th>Action</th>
                        </tr>
                        <tr>
                            <td class="td1"></td>   <!--Programme name-->
                            <td class="td2"></td>   <!--Semseter-->
                            <td></td>   <!--Course-->
                            <td></td>
                            <td class="td2"><button class="btn__edit" id="btn-edit3" onclick="myFunction13()"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><br>View</button></td> <!--Edit course-->
                            <td class="td3"><div class="circle1" title="Edit Programme" id="edit2" onclick="myFunction14()"><i class="fa fa-pencil" aria-hidden="true"></i></div><div class="circle2" title="Delete Programme"><i class="fa fa-times" aria-hidden="true"></i></div></td> <!--Action-->
                        </tr>
                    </table>
                    </div>
                </div>
                
                <div class="bg-model9">
                    <div class="model-content9">
                        <div class="close9" id="close" >+</div>
                        <div class="header9">
                            <h1>Add Staff Details</h1></div>
                             <img class="student" src="images/studenticon.svg">
                            <form action="" >
                                <input type="text" placeholder="First Name" class="merge4">
                                <input type="text" placeholder="Last Name" class="merge4">
                                <select class="merge5">
                                <option value="" disabled selected hidden>Gender</option>
                                <option>Adimale</option>
                                </select>
                                <input type="text" placeholder="Email" class="merge4">
                                <input type="text" placeholder="Mobile Number" class="merge4">
                                <input type="text" placeholder="Address" class="merge5">
                                <input type="text" placeholder="Staff ID(Digits only)" class="merge4">
                                <input type="text" placeholder="Password" class="merge4">
                                <button id="button9" >Add</button>
                        </form>
                    </div>
                </div>
                
                
                <div class="bg-model10">
                    <div class="model-content10">
                        <div class="close10" id="close" >+</div>
                        <div class="header10">
                            <h1>Staff Details</h1></div>
                             <img class="student" src="images/studenticon.svg">
                            <form action="" >
                                <input type="text" placeholder="First Name" class="merge4">
                                <input type="text" placeholder="Last Name" class="merge4">
                                <select class="merge5">
                                <option value="" disabled selected hidden>Gender</option>
                                <option>Adimale</option>
                                </select>
                                <input type="text" placeholder="Email" class="merge4">
                                <input type="text" placeholder="Mobile Number" class="merge4">
                                <input type="text" placeholder="Address" class="merge5">
                                <input type="text" placeholder="Staff ID(Digits only)" class="merge4">
                                <input type="text" placeholder="Password" class="merge4">
                        </form>
                    </div>
                </div>
                
                
                <div class="bg-model11">
                    <div class="model-content11">
                        <div class="close11" id="close" >+</div>
                        <div class="header11">
                            <h1>Edit Staff Details</h1></div>
                             <img class="student" src="images/studenticon.svg">
                            <form action="" >
                                <input type="text" placeholder="First Name" class="merge4">
                                <input type="text" placeholder="Last Name" class="merge4">
                                <select class="merge5">
                                <option value="" disabled selected hidden>Gender</option>
                                <option>Adimale</option>
                                </select>
                                <input type="text" placeholder="Email" class="merge4">
                                <input type="text" placeholder="Mobile Number" class="merge4">
                                <input type="text" placeholder="Address" class="merge5">
                                <input type="text" placeholder="Staff ID(Digits only)" class="merge4">
                                <input type="text" placeholder="Password" class="merge4">
                                <button id="button11" >Update</button>
                        </form>
                    </div>
                </div>
            </div>
            
            
            
            
            
            
            
            
            
            <div class="tabs__content" data-tab="4">
                <div class="protab"> 
                    <button class="refresh" id="refProgramme" onclick="refreshProgramme();">Refresh page</button>
                    <h4>Programme Management</h4>
                    <div class="inner__protab">
                        
                    <div class="inner1"><h6 class="left">Programme list</h6><div id="add" class="add" title="Add programme" onclick="myFunction1()"></div><i class="fa fa-plus" aria-hidden="true" title="Add programme"></i></div>
                   
                    <table border="1" class="tb1" cellspacing="0" padding="10" rules="all">
                        <tr class="tb2">
                            <th>Programme Name</th>
                            <th>Semester</th>
                            <th>Courses (subjects)</th>
                            <th>Add Course<br>(subject)</th>
                            <th>Edit Course<br>(subject)</th>
                            <th>Action</th>
                        </tr>
                        
                        <%
                        	try{
                        		if(programmeResultSet!=null){
                        			int j = 0;
                        			while(programmeResultSet.next()){
                        				
                        				
                        				for(int i=1; i<= programmeResultSet.getInt("programme_sem"); i++){
                        					
                        					Connection con = DBConnection.createConnection();;
                        					Statement statement = con.createStatement();
                        					ResultSet coursesData = statement.executeQuery(""
                        						+"SELECT * FROM course where course_sem = "+Integer.toString(i)+" "
                        						+"AND programme_id = "+programmeResultSet.getString("programme_id")+"");
                        					String coursesString = "";
                        %>
                        <tr>
							<td id = "<%=programmeResultSet.getString("programme_name")%>"class="td1"><%=programmeResultSet.getString("programme_name")%></td>   <!--Programme name-->
                            <td class="td2"><%=Integer.toString(i)%></td>   <!--Semester-->
                            
                            
                            <td><%try{
                            	if(coursesData!=null){
                            		
                            		while(coursesData.next()){
                        				
                            			out.println(coursesData.getString("course_name"));
                            			out.println("<br/>");
                             		}
                            	}
                            	
                            }catch(SQLException e){
                            	e.printStackTrace();
                            	
                            }%>  </td>   <!--Course-->


							<td class="td1"><button class="btn__course" id="btn__course<%=i + j%>>" onclick="insertCourseData<%=i + j%>()"><span style="font-size: 16px;">+</span> Course</button></td>  <!--add course-->
                            <td class="td2"><button class="btn__edit" id="btn-edit4" onclick="myFunction15()"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><br>Edit</button></td> <!--Edit course-->
                            <td class="td3"><div class="circle1" title="Edit Programme"><i class="fa fa-pencil" aria-hidden="true"></i></div><div class="circle2" title="Delete Programme"><i class="fa fa-times" aria-hidden="true"></i></div></td> <!--Action-->
                        </tr>
                        
                        
                        <script type="text/javascript">
	                        document.getElementById("btn__course<%=i + j%>");
	                        function insertCourseData<%=i + j%>(){
	                          document.querySelector('.bg-model1').style.display = 'flex';
                              document.querySelector('.bg-model1').style.position = 'fixed';document.querySelector('.bg-model').style.position = 'fixed';
	                          document.getElementById("programmeNameInCourse").value = "<%=programmeResultSet.getString("programme_name")%>";
	                          document.getElementById("courseSemester").value = "<%=i%>";
	                          document.getElementById("programmeIdInCourse").value = "<%=programmeResultSet.getString("programme_id")%>"
	                        }
                        </script>
                        <%
                        				}
                        				j = j + programmeResultSet.getInt("programme_sem");//increment j for index
                        			}
                        		}
                        	}catch(SQLException e){
                        		e.printStackTrace();
                        		
                        	}	
                           
                        %>
                    </table>
                    </div>
                </div>
                     
                <div class="bg-model">
                    <div class="model-content">
                        <div class="close" id="close" onclick="myFuction()2">+</div>
                        <div class="header">
                            <h1>Add Programme Data</h1></div>
                            <form id="programmeForm" action="InsertDataServlet" method="post">
                            	<input type="hidden" value="programme" name="Data" />
                                <input type="text" placeholder="Programme Id" name="programmeId">
                                <input type="text" placeholder="Programme Name" name="programmeName">
                                <input type="text" placeholder="Duration(In Years)" name="duration">
                                <input type="text" placeholder="Total Semester" name="totalSemester">
                                <button id="button" onclick="insertProgramme();" >ADD</button>
                            
                        </form>
                    </div>
                </div>
                
                
                <div class="bg-model1">
                    <div class="model-content1">
                        <div class="close1" id="close" >+</div>
                        <div class="header1">
                            <h1>Add Course Data</h1></div>
                            <form id="courseForm" action="InsertDataServlet" method="post">
                            	<input type="hidden" value="course" name="Data" />
                            	<input type="hidden" id = "programmeIdInCourse" name="programmeIdInCourse" value=""/>
                                <input type="text" id="programmeNameInCourse" name="programmeNameInCourse" readonly="readonly" value=""/>
                                <input type="text" name="courseCode" placeholder="Course Code">
                                <input type="text" name="courseName" placeholder="Course Name">
                                <input type="text" id="courseSemester" name="courseSemester" readonly="readonly" value=""/>
                                <input type="hidden" id ="courseType" name="courseType"  value=""/>
                                <input type="hidden" id="courseGroup" name="courseGroup" value=""/>
                                
                                <select id="courseTypeD" name="courseTypeD">
                                <option value="" disabled selected hidden>Type</option>
                                <option >Theory</option>
                                <option >Practical</option>
                                </select>
                                
                                <select id="courseGroupD" name="courseGroupD">
                                <option value="" disabled selected hidden>Group</option>
                                <option >Group 1 Core Course</option>
                                <option >Group 2 Elective Course</option>
                                <option >Group 3 a)Compulsary Foundation</option>
                                <option >Group 3 b)Elective Foundation</option>
                                <option >Group 4</option>
                                
                                </select>
                                <input name="maxMarks" type="text" placeholder="Max marks">
                                <input name="minMarks" type="text" placeholder="Min Marks">
                                <input name="maxIA" type="text" placeholder="Max Internal Assesment Marks">
                                <button id="button1" onclick="insertCourse();">ADD</button>
                          </form>
                    </div>
                </div>          
            </div>
                 
                 
                 
                 
                 
                    
             <div class="tabs__content" data-tab="5">
                <div class="protab"> 
                    <button class="refresh" id="ref" onclick="myFunction()">Refresh page</button>
                    <h4>Class Management</h4>
                    <div class="inner__protab">
                        
                    <div class="inner1">
                        <h6 class="left">Class list</h6>
                        <div id="add1" class="add" title="Add programme" onclick="myFunction8()">
                        <i class="fa fa-plus" title="Add programme"></i></div></div>
                    <table border="1" class="tb1" cellspacing="0" padding="10" rules="all">
                        <tr >
                            <th>Programme Name</th>
                            <th>Class Name</th>
                            <th>Class Year</th>
                            <th>Action</th>
                        </tr>
                        
                        <%
                        	try{
                        		Connection con = DBConnection.createConnection();;
    	    					Statement statement = con.createStatement();
    	    					ResultSet classesData = statement.executeQuery(""
    	    						+"SELECT * FROM (class " 
    	    						+"INNER JOIN programme ON class.programme_id = programme.programme_id) "
    	    						+"ORDER BY programme.programme_name ASC");
    	    					
    	    					while(classesData.next()){
    	    			%>		
    	    	
                        <tr>
                            <td class="td1"><%=classesData.getString("programme_name")%></td>   <!--Programme name-->
                            <td class="td2"><%=classesData.getString("class_name")%></td>   <!--Semseter-->
                            <td><%=classesData.getString("class_year")%></td>
                            <td class="td3"><div class="circle1" title="Edit Programme"><i class="fa fa-pencil" aria-hidden="true"></i></div><div class="circle2" title="Delete Programme"><i class="fa fa-times" aria-hidden="true"></i></div></td> <!--Action-->
                        </tr>			

                        <% 	
    	    					}
                        	}catch(SQLException e){
                        		e.printStackTrace();
                        		
                        	}
	                           
	                    %>
                     
                    </table>
                    </div>
                </div>
                 
                 
                 <div class="bg-model5">
                    <div class="model-content5">
                        <div class="close5" id="close" >+</div>
                        <div class="header5">
                            <h1>Add Class Data</h1></div>
                            <form id="classForm" action="InsertDataServlet" method="post">
                            	<input type="hidden" name="Data" value="class"/>
                                <input type="hidden" id="programmeNameInClass" name="programmeNameInClass"/>
                                <select id="programmeNameInClassD">
                                <option value="" disabled selected hidden>Select Programme</option>
                                <%
                                	try{
                                		Connection con = DBConnection.createConnection();
                                		Statement statement = con.createStatement();
                                		ResultSet programmeName = statement.executeQuery("SELECT programme_name FROM programme");
                                		while(programmeName.next()){
                                			
                                %>		
                                            <option><%=programmeName.getString("programme_name")%></option>	
                                <%	
                                	
                                		}
                                	}catch(SQLException e){
                                		e.printStackTrace();
                                	}
                                %>
                                </select>
                                <input name="classId" type="text" placeholder="Class ID">
                                <input name="className" type="text" placeholder="Class Name">
                                <input name="classYear" type="text" placeholder="Class Year (in digits)">
                                <button id="button5" onclick="insertClass();" >ADD</button>
                        </form>
                    </div>
                </div>
            </div>
                    
               
               
               
               
                    
     
            
            <div class="tabs__content" data-tab="6">
            <div class="protab"> 
            <button class="refresh" id="ref" onclick="">Refresh page</button>
            <h4>Student Result Management</h4>
            <div class="inner__protab">
            <div class="inner1"><h6 class="left">Student Result</h6>
            <select class="select2">
            <option value="" disabled selected hidden>Class</option>
            <option>  </option>
            </select>
            <select class="select2"><option value="" disabled selected hidden>Programme</option>
            <option>  </option>      
            </select>
            </div>
            
            
            <form action="ResultServlet" method="post" id="semesterForm">
            	         <input name="semester" type="hidden" value=""/>
            	         <input name="userName" type="hidden" value="">
			</form>
			<form action="InternalServlet" method="post" id=internalForm>
            	         <input name="semester" type="hidden" value=""/>
            	         <input name="userName" type="hidden" value="">
			</form>   
            <table border="1" class="tb1" cellspacing="0" padding="10" rules="all">
            <tr>
                <th>Programme</th>
                <th>Class</th>
                <th>Student Name</th>
                <th>Register Number</th>
                <th>Add Result</th>
                <th>View Result</th>
                <th>Action</th>
            </tr>
              
            <%
            
            	try{
            		
            		Connection con = DBConnection.createConnection();;
					Statement statement = con.createStatement();
					ResultSet studentData = statement.executeQuery(""
						+"SELECT * FROM ((student " 
						+"INNER JOIN programme ON student.programme_id = programme.programme_id) "
						+"INNER JOIN class ON student.class_id = class.class_id)"
						+"ORDER BY programme.programme_name ASC");	
            		
					if(studentData!=null){
						int i = 1;
                		while(studentData.next()){
                			
            %>	       
           <tr>
              <td class="td1"><%=studentData.getString("programme_name")%></td>   <!--Programme -->
              <td class="td2"><%=studentData.getString("class_name")%></td>   <!--class-->
              <td><%=studentData.getString("first_name") +" "+ studentData.getString("last_name")%></td>   <!--Student Name-->
              <td><%=studentData.getString("reg_no")%></td>   <!--Register number-->
              <td class="td1"><button class="btn__course" id="btn__course<%=i%>" onclick="myFunction4()"><span style="font-size: 16px;">+</span> Add</button></td>  <!--Add Result-->
              <td class="td2"><button class="btn__edit" id="btn-edit<%=i%>" onclick="viewResult<%=i%>()"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><br>Result</button></td> <!--View Result-->
              <td class="td3"><div class="circle1" title="Edit Result" id="circle1" onclick="myFunction6()"><i class="fa fa-pencil" aria-hidden="true"></i></div><div class="circle2" title="Delete Result" id="circle2" onclick="myFunction7()"><i class="fa fa-times" aria-hidden="true"></i></div></td> <!--Action-->
            </tr>
            
            
            	<script type="text/javascript">
            	
	            	document.getElementById("btn-edit<%=i%>");
	            	function viewResult<%=i%>(){
	            	    document.querySelector('.bg-model2').style.display = 'flex';
                        document.querySelector('.bg-model2').style.position = 'fixed';
	            	    document.forms['semesterForm']['userName'].value = "<%=studentData.getString("reg_no")%>";
	            	    document.forms['internalForm']['userName'].value = "<%=studentData.getString("reg_no")%>";
	            	}
            	</script>
            
            
            
			<% 		
				i = i + 1;
                	}	
                }	
               	}catch(SQLException e){}
            
            %>     
            </table>
            </div>
            
            </div>
                <div class="bg-model2">
                <div class="model-content2">
                <div class="close2" id="close" >+</div>
                <div class="header2">
                <h1>View Student Result </h1></div>
                    
                <form action="">
                <table border="1" class="tb3" id="viewResultTable">
                  <tr>
                     <th>Semester</th>
                     <th>Internals</th>
                  </tr>
                                    
                     <%
                     
                     	int maxSem = 1;
                     	try{
                     
		                    Connection con = DBConnection.createConnection();;
		 					Statement statement = con.createStatement();
		 					ResultSet programmeSem = statement.executeQuery(""
		 						+"SELECT programme_sem from programme "
		 						+"WHERE programme_sem = (SELECT MAX(programme_sem)FROM programme)LIMIT 1");	
		             		
		 					if(programmeSem!=null){
		                 		while(programmeSem.next()){
									maxSem = programmeSem.getInt("programme_sem");
									
		                 		}
		 					}
                     	}catch(SQLException e){
                     		e.printStackTrace();
                     	}
                     
                     
                     	for(int i = 1 ;i <= maxSem; i++){
                     %>         
                    <tr class="pop-row">
                        <td><div class="pop-div"><div class="pop-inner" onclick="callResultServlet<%=Integer.toString(i)%>()" id="div<%=Integer.toString(i)%>">Semester <%=i%></div></div></td>
                        <td><div class="pop-div"><div class="pop-inner" onclick="callInternalServlet<%=Integer.toString(i)%>()" id="div<%=Integer.toString(i)%>">Semester <%=i%></div></div></td>
                      
                    </tr>
                    <%} %>
                    
                </table>
                </form>
                </div>
                </div>
                
                <div class="bg-model3">
                    <div class="model-content3">
                    <div class="close3" id="close" >+</div>
                    <div class="header3">
                      <h1>Edit Student Results</h1></div>
                        <form action="">
                            <table border="1" class="tb3">
                              <tr>
                                <th>Semester</th>
                              </tr>
                                <%
			                     	for(int i = 1 ;i <= maxSem; i++){
                     			%>     
                               <tr class="pop-row">
                                   <td><div class="pop-div"><div class="pop-inner2">Semester <%=i%></div></div></td>
                                </tr> 
                                 <%} %>     
                            </table> 
                        </form>
                    </div>
                </div>
                 
                <div class="bg-model4">
                    <div class="model-content4">
                        <div class="close4" id="close" >+</div>
                        <div class="header4">
                            <h1>Delete Student Results</h1></div>
                            <form action="">
                                <table border="1" class="tb3">
                                    <tr>
                                    <th>Semester</th>
                                    </tr>
                                    
                                    <tr class="pop-row">
                                        <td><div class="pop-div"><div class="pop-inner2">Semester1</div></div></td>
                                    </tr>  
                                    
                                </table>
                        </form>
                    </div>
                </div>     
            </div>
         </div>
                
                
                
                
                
                
        
                
        <script type="text/javascript">
            let image = document.getElementById("image");
            let images = ['css/images/can1.jpg','css/images/can2.jpg','css/images/can3.jpg','css/images/can4.jpg','css/images/can5.jpg','css/images/can6.jpg','css/images/can7.jpg']
            setInterval(function(){
                let random = Math.floor(Math.random()*7);
                image.src = images[random];
                   
            },2500);
        </script>
                
                <script>
                    document.querySelector('.close').addEventListener('click', function(){
                        document.querySelector('.bg-model').style.display = 'none';
                     });
                </script>
                
                <script>
                    document.querySelector('.close1').addEventListener('click', function(){
                        document.querySelector('.bg-model1').style.display = 'none';
                    });
                </script>
                
                <script>
                    document.querySelector('.close2').addEventListener('click', function(){
                        document.querySelector('.bg-model2').style.display = 'none';
                    })
                </script>
                
                <script>
                    document.querySelector('.close3').addEventListener('click', function(){
                        document.querySelector('.bg-model3').style.display = 'none';
                    })
                </script>
                
                <script>
                    document.querySelector('.close4').addEventListener('click', function(){
                        document.querySelector('.bg-model4').style.display = 'none';
                    })
                
                </script>
                
                <script>
                    document.querySelector('.close5').addEventListener('click', function(){
                       document.querySelector('.bg-model5').style.display = 'none';
                   })
                </script>
                
                <script>
                   document.querySelector('.close6').addEventListener('click', function(){
                      document.querySelector('.bg-model6').style.display = 'none';
                  })
               </script>
                
         
        
        <script>
            document.querySelector('.close7').addEventListener('click', function(){
                document.querySelector('.bg-model7').style.display = 'none';
            })
        </script>
        
        
        
        <script>
            document.querySelector('.close8').addEventListener('click', function(){
                document.querySelector('.bg-model8').style.display = 'none';
            })
        </script>
                
        <script>
             document.querySelector('.close9').addEventListener('click', function(){
             document.querySelector('.bg-model9').style.display = 'none';
            })
        </script>
                
        <script>
              document.querySelector('.close10').addEventListener('click', function(){
              document.querySelector('.bg-model10').style.display = 'none';
            })
        </script>
                
        <script>
               document.querySelector('.close11').addEventListener('click', function(){
                document.querySelector('.bg-model11').style.display = 'none';
            })
        </script>
                
                
                  
    </body>
</html>
    
    
