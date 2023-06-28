package it.betacom.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import it.betacom.bean.Animale;
import it.betacom.bean.Cliente;

public class ClienteDao {
	
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
	
	public static List<Cliente> getAllRecords(){
		
		List<Cliente> list=new ArrayList<Cliente>();
		try{
			Connection connection=getConnection();
			PreparedStatement ps=connection.prepareStatement("select * from cliente");
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				Cliente c=new Cliente();
				c.setIdC(rs.getInt("idc"));
				c.setNome(rs.getString("nome"));
				c.setCognome(rs.getString("cognome"));
				c.setCitta(rs.getString("citta"));
				c.setTelefono(rs.getString("telefono"));
				c.setIndirizzo(rs.getString("indirizzo"));
				list.add(c);
			}
			connection.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}
	
	public static Cliente getRecordById(int id){
		Cliente c=null;
		try{
			Connection connection=getConnection();
			PreparedStatement ps=connection.prepareStatement("select * from cliente where idc=?");
			ps.setInt(1,id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				c=new Cliente();
				c.setIdC(rs.getInt("idc"));
				c.setNome(rs.getString("nome"));
				c.setCognome(rs.getString("cognome"));
				c.setCitta(rs.getString("citta"));
				c.setTelefono(rs.getString("telefono"));
				c.setIndirizzo(rs.getString("indirizzo"));
			}
			connection.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return c;
	}
	
	public static int save(Cliente c){
		
		int status=0;
		try{
			Connection connection=getConnection();
			PreparedStatement ps=connection.prepareStatement("insert into cliente(nome,cognome,citta,indirizzo,telefono) values(?,?,?,?,?)");
			ps.setString(1,c.getNome());
			ps.setString(2,c.getCognome());
			ps.setString(3,c.getCitta());
			ps.setString(4,c.getIndirizzo());
			ps.setString(5,c.getTelefono());
			status=ps.executeUpdate();
			connection.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int update(Cliente c){
		
		int status=0;
		try{
			Connection connection=getConnection();
			PreparedStatement ps=connection.prepareStatement("update cliente set nome=?, cognome=?, citta=?, indirizzo=?, telefono=? where idc=?");
			ps.setString(1,c.getNome());
			ps.setString(2,c.getCognome());
			ps.setString(3,c.getCitta());
			ps.setString(4,c.getIndirizzo());
			ps.setString(5,c.getTelefono());
			ps.setInt(6,c.getIdC());
			status=ps.executeUpdate();
			connection.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int delete(Cliente c){
		
		int status=0;
		try{
			Connection connection=getConnection();
			PreparedStatement ps=connection.prepareStatement("delete from cliente where idc=?");
			ps.setInt(1,c.getIdC());
			status=ps.executeUpdate();
			connection.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static List<Animale> getAnimali(Cliente c){
		
		List<Animale> list=new ArrayList<Animale>();
		try{
			Connection connection=getConnection();
			PreparedStatement ps=connection.prepareStatement("select * from animale where cliente_idc=?");
			ps.setInt(1,c.getIdC());
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
	
}
