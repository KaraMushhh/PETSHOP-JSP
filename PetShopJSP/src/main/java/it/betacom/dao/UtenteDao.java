package it.betacom.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import it.betacom.bean.Utente;

public class UtenteDao {
	
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
	
	public static List<Utente> getAllRecords(){
		
		List<Utente> list=new ArrayList<Utente>();
		try{
			Connection connection=getConnection();
			PreparedStatement ps=connection.prepareStatement("select * from psuser");
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				Utente u=new Utente();
				u.setId(rs.getInt("id"));
				u.setNome(rs.getString("nome"));
				u.setCognome(rs.getString("cognome"));
				u.setEmail(rs.getString("email"));
				u.setCellulare(rs.getInt("cellulare"));
				u.setPass(rs.getString("pass"));
				u.setRole(rs.getString("role"));
				u.setStatus(rs.getString("status"));
				list.add(u);
			}
			connection.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}
	
	public static Utente getRecordById(int id){
		Utente u=null;
		try{
			Connection connection=getConnection();
			PreparedStatement ps=connection.prepareStatement("select * from psuser where id=?");
			ps.setInt(1,id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				u=new Utente();
				u.setId(rs.getInt("id"));
				u.setNome(rs.getString("nome"));
				u.setCognome(rs.getString("cognome"));
				u.setEmail(rs.getString("email"));
				u.setCellulare(rs.getInt("cellulare"));
				u.setPass(rs.getString("pass"));
				u.setRole(rs.getString("role"));
				u.setStatus(rs.getString("status"));
			}
			connection.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return u;
	}
	
	public static int save(Utente u){
		
		int status=0;
		try{
			Connection connection=getConnection();
			PreparedStatement ps1=connection.prepareStatement("select * from psuser where email=?");
			ps1.setString(1, u.getEmail());
			ResultSet rs=ps1.executeQuery();
			boolean controllo=rs.next();
			if (!controllo) {
				PreparedStatement ps=connection.prepareStatement("insert into psuser(nome,cognome,email,cellulare,pass,role,status,counter,changepwd) values(?,?,?,?,?,?,?,?,?)");
				ps.setString(1, u.getNome());
				ps.setString(2, u.getCognome());
				ps.setString(3, u.getEmail());
				ps.setInt(4, u.getCellulare());
				ps.setString(5, u.getPass());
				ps.setString(6, u.getRole());
				ps.setString(7, u.getStatus());
				ps.setInt(8, 0);
				ps.setString(9, "Y");
				status=ps.executeUpdate();
				System.out.println(status);
			} else {
				status=-2;
				System.out.println(status);
			}
			
			connection.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int update(Utente u){
		
		int status=0;
		try{
			Connection connection=getConnection();
			PreparedStatement ps=connection.prepareStatement("update psuser set nome=?, cognome=? ,email=?, cellulare=?, pass=?, role=?, status=? where id=?");
			ps.setString(1, u.getNome());
			ps.setString(2, u.getCognome());
			ps.setString(3, u.getEmail());
			ps.setInt(4, u.getCellulare());
			ps.setString(5, u.getPass());
			ps.setString(6, u.getRole());
			ps.setString(7, u.getStatus());
			ps.setInt(8, u.getId());
			status=ps.executeUpdate();
			connection.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int delete(Utente u){
		
		int status=0;
		try{
			Connection connection=getConnection();
			PreparedStatement ps=connection.prepareStatement("delete from psuser where id=?");
			ps.setInt(1, u.getId());
			status=ps.executeUpdate();
			connection.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static void changeStatus (Utente utente) {
		
		try{
			Connection connection=getConnection();
			PreparedStatement ps=connection.prepareStatement("update psuser set status=? where id=?");
			
			if (utente.getStatus().equals("A")) ps.setString(1, "D");
			else ps.setString(1, "A");
				
			ps.setInt(2, utente.getId());
			ps.execute();
	
			connection.close();
			
		} catch (Exception e) {
			System.out.println(e);
		}	
	}
	
	

}
