package madu_classs;

import java.sql.*;
class Demo{

	public static void main(String args[]){

		try{
			Class.forName("com.mysql.jdbc.Driver"); //

		}
		catch(ClassNotFoundException e){
			System.out.println("Driver Not found");
		

		}

		try{
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/Company","root","");
			Statement stm=conn.createStatement();
			stm.executeUpdate("Insert into Customer Values('C888','Danapala1','Panadura',3000)");
		}catch(SQLException e){
			System.out.println(e);

		}
	}
}