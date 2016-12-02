package demo3;
import java.sql.*;

public class Demo{
	public static void main(String[] args) {
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch(ClassNotFoundException e){
			System.out.println("Driver not found");
		}
		
		String sql="Select * from Customer";
			
		try{
		Connection conn= DriverManager.getConnection("jdbc:mysql://localhost/Company", "root","");
		Statement stmt= conn.createStatement();
		ResultSet res=stmt.executeQuery(sql);
		
		while(res.next()){
			String id=res.getString(1);
			String name= res.getString(2);
			String address=res.getString(3);
			double salary=res.getDouble(4);
			System.out.println(id+"\t\t"+name+"\t\t"+address+"\t\t"+salary);
		}
		
		
		
		}
		catch(SQLException e){
			System.out.println(e);
		}
		
	}
}