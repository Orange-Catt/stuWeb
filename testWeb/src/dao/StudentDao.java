package dao;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;

import entity.student;

public class StudentDao {
    public List<student> searchAll(){
    	List<student> list=new ArrayList<student>();

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/school", "root", "123456");
			Statement stat = conn.createStatement();
			ResultSet rs = stat.executeQuery("select*from student");
		     
			while (rs.next()){
				
				student stu=new student();
				stu.setId(rs.getInt("id"));
		        stu.setName(rs.getString("name"));
		        stu.setSex(rs.getString("sex"));
		        stu.setAge(rs.getInt("age"));
		        list.add(stu);
			}
		
		
		
		
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
    	
    	
    	return list;
    }

}
