package demo1;
import java.sql.*;

public class Demo {
	public static void main(String[] args) {
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch(ClassNotFoundException e){
			System.out.println("driver not found");
			return;
		}
		
		String sql1="Update Customer set salary=90000 where id='C005'";
		String sql2="Insert into Customer values('C0012','Nuwan','Polonnaruwa','120000')";
		String sql3="Update Customer set id='C012' where name='Nuwan'";
		try{

			Connection con=DriverManager.getConnection("jdbc:mysql://localhost/Company","root","");
			Statement stmt= con.createStatement();	// creates a statement object
			stmt.executeUpdate(sql1);
			stmt.executeUpdate(sql2);
			stmt.executeUpdate(sql3);
			
		}
		catch(SQLException e){
			System.out.println(e);
		}
		
	}

}
