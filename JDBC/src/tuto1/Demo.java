package tuto1;
import java.sql.*;


public class Demo{
	public static void main(String[] args) {
		
		String dbConn= "jdbc:mysql://localhost:3306/jdbcTesting";
		String uName="root";
		String pass="";

		try{
			Class.forName("com.mysql.jdbc.Driver");
//			driverClassName=com.mysql.jdbc.Driver;

//		creating a connection 
		Connection conn= DriverManager.getConnection(dbConn,uName,pass);
//		Class.forName("com.mysql.jdbc.Driver");
//		 Class.forName("com.mysql.jdbc.Driver");
		

		
		/*Creates a Statement object for sending SQL statements to the database. SQL statements without 
		 * parameters are normally executed using Statement objects. If the same SQL statement is executed 
		 * many times, it may be more efficient to use a PreparedStatement object.
		 * 
		 */
		Statement stmt= conn.createStatement();
		
		ResultSet myRs= stmt.executeQuery("select * from Demo");
		//	Executes the given SQL statement, which returns a single ResultSet object.
		
//		printing the content in the table
		while(myRs.next()){
			/*result set is initially at the first row
			 * next() will move forward one row, and return true if there are other rows in it
			 * 
			 */
			
//			we can retreive content from the result set through column names or column index
			System.out.println("First Name "+myRs.getString("firstName"));
			System.out.println("Last Name "+myRs.getString("lastName"));
			System.out.println("Age "+myRs.getInt("Age"));

			/*  
			 * Retrieves the value of the designated column in the current row of this ResultSet
			 *  object as a String in the Java programming language.
			 * 
			 */
			
		}

		}
		catch(Exception e){
			e.printStackTrace();
		}
		
	}
}