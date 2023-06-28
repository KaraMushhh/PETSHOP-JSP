package it.betacom.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import it.betacom.bean.Animale;
import it.betacom.bean.Cliente;

public class AnimaleDao {
	
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
	
	public static List<Animale> getAllRecords(){
		
		List<Animale> list=new ArrayList<Animale>();
		try{
			Connection connection=getConnection();
			PreparedStatement ps=connection.prepareStatement("select * from animale");
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				Animale anim=new Animale();
				anim.setIdA(rs.getInt("ida"));
				anim.setNome(rs.getString("nome"));
				anim.setMatricola(rs.getInt("matricola"));
				anim.setDataAcquisto(rs.getDate("dataacquisto"));
				anim.setPrezzo(rs.getDouble("prezzo"));
				anim.setIdT(rs.getInt("catalogo_idanimale"));
				anim.setIdC(rs.getInt("cliente_idc"));
				list.add(anim);
			}
			connection.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}
	
	public static Animale getRecordById(int id){
		Animale a=null;
		try{
			Connection connection=getConnection();
			PreparedStatement ps=connection.prepareStatement("select * from animale where ida=?");
			ps.setInt(1,id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				a=new Animale();
				a.setIdA(rs.getInt("ida"));
				a.setNome(rs.getString("nome"));
				a.setMatricola(rs.getInt("matricola"));
				a.setDataAcquisto(rs.getDate("dataacquisto"));
				a.setPrezzo(rs.getDouble("prezzo"));
				a.setIdT(rs.getInt("catalogo_idanimale"));
				a.setIdC(rs.getInt("cliente_idc"));
			}
			connection.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return a;
	}
	
	public static int save(Animale a){
		
		int status=0;
		try{
			Connection connection=getConnection();
			PreparedStatement ps=connection.prepareStatement("insert into animale(nome,matricola,prezzo,dataacquisto,catalogo_idanimale,cliente_idc) values(?,?,?,?,?,?)");
			ps.setString(1,a.getNome());
			ps.setInt(2,a.getMatricola());
			ps.setDouble(3,a.getPrezzo());
			ps.setDate(4, new java.sql.Date(a.getDataAcquisto().getTime()));
			ps.setInt(5,a.getIdT());
			ps.setInt(6,a.getIdC());
			status=ps.executeUpdate();
			connection.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int update(Animale a){
		
		int status=0;
		try{
			Connection connection=getConnection();
			PreparedStatement ps=connection.prepareStatement("update animale set nome=?, matricola=?, prezzo=?, dataacquisto=?, catalogo_idanimale=?, cliente_idc=? where ida=?");
			ps.setString(1,a.getNome());
			ps.setInt(2,a.getMatricola());
			ps.setDouble(3,a.getPrezzo());
			ps.setDate(4, new java.sql.Date(a.getDataAcquisto().getTime()));
			ps.setInt(5,a.getIdT());
			ps.setInt(6,a.getIdC());
			ps.setInt(7,a.getIdA());
			status=ps.executeUpdate();
			connection.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int delete(Animale a){
		
		int status=0;
		try{
			Connection connection=getConnection();
			PreparedStatement ps=connection.prepareStatement("delete from animale where ida=?");
			ps.setInt(1,a.getIdA());
			status=ps.executeUpdate();
			connection.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
}
