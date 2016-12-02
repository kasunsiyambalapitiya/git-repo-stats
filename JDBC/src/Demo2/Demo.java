package Demo2;
import java.sql.*;
import javax.swing.JOptionPane;

public class Demo {
	public static void main(String[] args) {
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch(ClassNotFoundException e){
			System.out.println("Driver not found");
		}

		String sql="Select * From Customer";
		try{

			Connection con=DriverManager.getConnection("jdbc:mysql://localhost/Company","root","");
			Statement stmt=con.createStatement();
			
			int res=stmt.executeUpdate(sql);
			/*Returns:
	 either (1) the row count for SQL Data Manipulation Language (DML) statements or (2) 0 
	  for SQL statements that return nothing
			 */

			if (res>0){
				JOptionPane.showMessageDialog(null,"Deleted"+res);

			}
			else{
				JOptionPane.showMessageDialog(null,"Not deleted");
			}

		}
		catch(SQLException e){
			System.out.println(e);
		}

	}

}
