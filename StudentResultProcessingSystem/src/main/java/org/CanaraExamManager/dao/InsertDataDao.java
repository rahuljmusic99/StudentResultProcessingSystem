package org.CanaraExamManager.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import org.CanaraExamManager.bean.ProgrammeCourseClassBean;
import org.CanaraExamManager.bean.StudentStaffDataBean;
import org.CanaraExamManager.util.DBConnection;

public class InsertDataDao {
	
//	Method for inserting Student Data
	
	public String insertStudentData(StudentStaffDataBean studentDataBean) {
		
		Connection con = null;
		String query = "";
		PreparedStatement preparedStatement = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		String programmeId = "";
		String classId = "";
		
		try {
			
			con = DBConnection.createConnection();
			statement = con.createStatement();
			resultSet = statement.executeQuery("SELECT A.programme_id,B.class_id FROM (programme A "
											+ "INNER JOIN class B ON A.programme_id = B.programme_id) "
											+ "WHERE A.programme_name = "+studentDataBean.getProgramme()+" "
											+ "AND B.class_name = "+studentDataBean.getclass()+" "
											+ "AND B.class_year = "+studentDataBean.getYear()+" ");
				while (resultSet.next()) {
					
					programmeId = resultSet.getString("programme_id");
					classId = resultSet.getString("class_id");
				}
				
					if(programmeId!="" && classId!="") {
						
						resultSet = null;
						resultSet = statement.executeQuery("SELECT * FROM student WHERE reg_no =  "+studentDataBean.getRegNo()+"");
						
						if(resultSet.next() == false) { //check whether student with that register number already exists
							
							query = "INSERT INTO student(reg_no,first_name,last_name,gender,dob,email,phone,address,"
									+ "blood_group,birth_place,birth_district,birth_state,pincode,password,programme_id,class_id,"
									+ "joining_year,semester,status)"
									+ "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
							preparedStatement = con.prepareStatement(query);
							
							preparedStatement.setString(1,studentDataBean.getRegNo());//1
							preparedStatement.setString(2,studentDataBean.getfirstName());//2
							preparedStatement.setString(3,studentDataBean.getLastName());//3
							preparedStatement.setString(4,studentDataBean.getGender());//4
							preparedStatement.setString(5,studentDataBean.getDOB());//5
							preparedStatement.setString(6,studentDataBean.getEmail());//6
							preparedStatement.setString(7,studentDataBean.getPhone());//7
							preparedStatement.setString(8,studentDataBean.getAddress());//8
							preparedStatement.setString(9,studentDataBean.getBloodGroup());//9
							preparedStatement.setString(10,studentDataBean.getCity());//10
							preparedStatement.setString(11,studentDataBean.getDistrict());//11
							preparedStatement.setString(12,studentDataBean.getState());//12
							preparedStatement.setString(13,studentDataBean.getPinCode());//13
							preparedStatement.setString(14,studentDataBean.getPassword());//14
							preparedStatement.setString(15,programmeId);//15
							preparedStatement.setString(16,classId);//16
							preparedStatement.setString(17,studentDataBean.getYear());//17
							preparedStatement.setString(18,studentDataBean.getCurrentSemester());//18
							preparedStatement.setString(19,"true");//18
							
							preparedStatement.execute();
							
						}else {
							
							return "Student with the Register Number "+studentDataBean.getRegNo()+" Already Exists";
						}
					
					}else {
						
						return "No such Programme/Class Found";
					}
				
		} catch (Exception e) {
			return e.getLocalizedMessage();
		}
		
		
		return "SUCCESS";
	}
	
	
	
//	Method for inserting Staff Data
	
	public String insertStaffData(StudentStaffDataBean staffDataBean) {
		
		Connection con = null;
		String query = "";
		PreparedStatement preparedStatement = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		
		try {
			
			con = DBConnection.createConnection();
			statement = con.createStatement();
			resultSet = statement.executeQuery("SELECT * FROM staff WHERE staff_id = "+staffDataBean.getStaffId()+"");
			if(resultSet.next() == false) {//check whether staff with that staff id already exists
				
				query = "INSERT INTO staff(staff_id,first_name,last_name,gender,dob,email,phone,address,blood_group,"
						+ "password,staff_status)"
						+ "VALUES(?,?,?,?,?,?,?,?,?,?,?)";
				preparedStatement = con.prepareStatement(query);
				
				preparedStatement.setString(1, staffDataBean.getStaffId());//1
				preparedStatement.setString(2, staffDataBean.getfirstName());//2
				preparedStatement.setString(3, staffDataBean.getLastName());//3
				preparedStatement.setString(4, staffDataBean.getGender());//4
				preparedStatement.setString(5, staffDataBean.getDOB());//5
				preparedStatement.setString(6, staffDataBean.getEmail());//6
				preparedStatement.setString(7, staffDataBean.getPhone());//7
				preparedStatement.setString(8, staffDataBean.getAddress());//8
				preparedStatement.setString(9, staffDataBean.getBloodGroup());//9
				preparedStatement.setString(10, staffDataBean.getPassword());//10
				preparedStatement.setString(11, "true");//11
				
				preparedStatement.execute();
					
				
			}else {
				
				return "Staff with Staff.ID "+staffDataBean.getStaffId()+" Already Exists";
				
			}
					
		} catch (Exception e) {
			return e.getLocalizedMessage();
		}
		
		
		return "SUCCESS";
	}
	
	
	
	
//	Method for inserting Programme Data	
	
public String insertProgrammeData(ProgrammeCourseClassBean programmeDataBean) {
		
		Connection con = null;
		String query = "";
		PreparedStatement preparedStatement = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			
			con = DBConnection.createConnection();
			statement = con.createStatement();
			resultSet = statement.executeQuery("SELECT * FROM programme WHERE programme_id = "+programmeDataBean.getProgrammeId()+"");
			if(resultSet.next() == false) {//check whether programme with that programme id already exists
				
				resultSet = null;
				resultSet = statement.executeQuery("SELECT * FROM programme WHERE programme_name = '"+programmeDataBean.getProgrammeName().toUpperCase()+"'");
				
				if(resultSet.next() == false) {
					
					query = "INSERT INTO programme(programme_id,programme_name,programme_duration,programme_sem)"
							+"VALUES(?,?,?,?)";
					preparedStatement = con.prepareStatement(query);
					
					preparedStatement.setString(1, programmeDataBean.getProgrammeId());//1
					preparedStatement.setString(2, programmeDataBean.getProgrammeName().toUpperCase());
					preparedStatement.setString(3, programmeDataBean.getProgrammeDuration());
					preparedStatement.setString(4, programmeDataBean.getSemester());
					
					preparedStatement.execute();
					
				}else {
					System.out.println(programmeDataBean.getProgrammeName());
					return "Programme with Programme Name "+programmeDataBean.getProgrammeName().toUpperCase()+" Already Exists";
					
				}
				
			}else {
				
				return "Programme with Programme.ID "+programmeDataBean.getProgrammeId()+" Already Exists";
			}
					
		} catch (Exception e) {
			return e.getLocalizedMessage();
		}
		
		
		return "SUCCESS";
	}




//Method for inserting Course Data

	public String insertCourseData(ProgrammeCourseClassBean courseDataBean) {
		
		Connection con = null;
		String query = "";
		PreparedStatement preparedStatement = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		try {
			
			con = DBConnection.createConnection();
			statement = con.createStatement();	
				
				resultSet = statement.executeQuery("SELECT * FROM course WHERE course_code =  '"+courseDataBean.getCourseCode()+"'");

					if(resultSet.next() == false) { //check whether course with that courseCode already exists
							
							query = "INSERT INTO course(course_code,course_name,course_type,course_group,course_sem,max_marks,"
									+ "min_marks,max_IA,programme_id)"
									+ "VALUES(?,?,?,?,?,?,?,?,?)";
							preparedStatement = con.prepareStatement(query);
							
							preparedStatement.setString(1, courseDataBean.getCourseCode().toUpperCase());
							preparedStatement.setString(2, courseDataBean.getCourseName().toUpperCase());
							preparedStatement.setString(3, courseDataBean.getCourseType());
							preparedStatement.setString(4, courseDataBean.getCourseGroup());
							preparedStatement.setString(5, courseDataBean.getSemester());
							preparedStatement.setString(6, courseDataBean.getMaxMarks());
							preparedStatement.setString(7, courseDataBean.getMinMarks());
							preparedStatement.setString(8, courseDataBean.getMaxIA());
							preparedStatement.setString(9, courseDataBean.getProgrammeId());
							
							preparedStatement.execute();
						
					}else {
						
						return "Course with the Course Code "+courseDataBean.getCourseCode()+" Already Exists";
					}
			
		} catch (Exception e) {
			return e.getLocalizedMessage();
		}
		
		
		return "SUCCESS";
	}
	

	
	
	
//Method for inserting class data
	
	public String insertClassData(ProgrammeCourseClassBean classDataBean) {
		
		Connection con = null;
		String query = "";
		PreparedStatement preparedStatement = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
		String programmeId = "";
		
		try {
			
			con = DBConnection.createConnection();
			statement = con.createStatement();
			resultSet = statement.executeQuery("SELECT * FROM programme WHERE programme_name = '"+classDataBean.getProgrammeName().toUpperCase()+"'");
				
				System.out.println(classDataBean.getProgrammeName());
				while (resultSet.next()) {
					
					programmeId = resultSet.getString("programme_id");
				}
				if(programmeId != "") {
					
					resultSet = null;
					resultSet = statement.executeQuery("SELECT * FROM class WHERE class_id =  "+classDataBean.getClassId()+"");
					
					
					if(resultSet.next()==false) { //check whether class with that class ID already exists
							
							resultSet = null;
							resultSet = statement.executeQuery("SELECT * FROM class WHERE class_name = '"+classDataBean.getClassName().toUpperCase()+"' "
															+ "AND class_year = "+classDataBean.getClassYear()+"");
							
							if(resultSet.next()==false) {
								
								query = "INSERT INTO class(class_id,class_name,programme_id,class_year)"
										+ "VALUES(?,?,?,?)";
								preparedStatement = con.prepareStatement(query);
								
								preparedStatement.setString(1, classDataBean.getClassId());
								preparedStatement.setString(2, classDataBean.getClassName().toUpperCase());
								preparedStatement.setString(3, programmeId);
								preparedStatement.setString(4, classDataBean.getClassYear());
							
								preparedStatement.execute();
							}else {
								
								return "Class "+classDataBean.getClassName()+" "+classDataBean.getClassYear()+" Year Already Exists";
								
							}
							
						}else {
							
							return "Class with the Class.ID "+classDataBean.getClassId()+" Already Exists";
						}
					
					
				}else {
					
					return "No Such Programme Exists";
					
				}
				
			
		} catch (Exception e) {
			return e.getLocalizedMessage();
		}
		
		
		return "SUCCESS";
	}
	
	
}
