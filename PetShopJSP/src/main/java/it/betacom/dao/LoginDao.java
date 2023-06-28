package it.betacom.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import it.betacom.bean.Login;
import it.betacom.bean.Utente;

public class LoginDao {
	
	public static Connection getConnection(){
		Connection con=null;
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/petshop","root","Ciccio1968");
		} catch (Exception e) {
			System.out.println(e);
		}
		return con;
	}
	

    public String validate(Login login) {
    	
        String role=null;
        try {
        	Connection connection=getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement("select * from psuser where email = ? and pass = ?"); 
            preparedStatement.setString(1, login.getUsername());
            preparedStatement.setString(2, login.getPassword());

            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) role=rs.getString("role");    

        } catch (Exception e) {
            e.printStackTrace();
        }
        return role;
    }
    
    public String returnStatus (Login login) {
    	
    	String status=null;
        try {
        	Connection connection=getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement("select * from psuser where email = ?"); 
            preparedStatement.setString(1, login.getUsername());

            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) status=rs.getString("status");
            
            System.out.println(status);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    
    public void updateStatus (Login login, String s) {
    	
    	resetCounter(login);
    	try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/petshop", "root", "mannaiaalporco96");

            PreparedStatement preparedStatement = connection.prepareStatement("update psuser set status=? where email=?"); 
            preparedStatement.setString(1, s);
            preparedStatement.setString(2, login.getUsername());

            System.out.println(preparedStatement);
            
            preparedStatement.execute();
            System.out.println(s);

        } catch (Exception e) {
            e.printStackTrace();
        }
    	
    }
    
    public static int getCounter(Login login) {
		
		int counter=0;
		try{
			Connection connection=getConnection();
			PreparedStatement ps=connection.prepareStatement("select counter from psuser where email=?");
			
			ps.setString(1,login.getUsername());
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				counter=rs.getInt("counter");
			}
	
			connection.close();
			
		} catch (Exception e) {
			System.out.println(e);
		}	
		
		return counter;
	}
    
    public static String returnStatusPWD (Login login) {
    	
    	String status=null;
        try {
        	Connection connection=getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement("select changepwd from psuser where email = ?"); 
            preparedStatement.setString(1, login.getUsername());

            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            rs.next();
            status=rs.getString("changepwd");
            System.out.println(status);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    
	public static int changePWD (Login login){
		
		int status=0;
		try{
			Connection connection=getConnection();
			PreparedStatement ps=connection.prepareStatement("update psuser set pass=? where email=?");
			ps.setString(1, login.getPassword());
			ps.setString(2, login.getUsername());
			System.out.println(ps);
			status=ps.executeUpdate();
			
			ps=connection.prepareStatement("update psuser set changepwd='N' where email=?");
			ps.setString(1, login.getUsername());
			System.out.println(ps);
			status=ps.executeUpdate();
			
			connection.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static void counterUp (Login login) {
		
		int counter=getCounter(login);
		try{
			Connection connection=getConnection();
			PreparedStatement ps=connection.prepareStatement("update psuser set counter=? where email=?");
			
			ps.setInt(1,++counter);
			ps.setString(2, login.getUsername());
			ps.execute();
			
	
			connection.close();
			
		} catch (Exception e) {
			System.out.println(e);
		}	
		
	}
	
	public static void resetCounter (Login login) {
		
		try{
			Connection connection=getConnection();
			PreparedStatement ps=connection.prepareStatement("update psuser set counter=? where email=?");
			
			ps.setInt(1, 0);
			ps.setString(2, login.getUsername());
			ps.execute();
			
	
			connection.close();
			
		} catch (Exception e) {
			System.out.println(e);
		}	
		
	}

    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}