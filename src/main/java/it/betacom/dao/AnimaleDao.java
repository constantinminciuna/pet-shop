package it.betacom.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import it.betacom.bean.Animale;

public class AnimaleDao {
	
//	static Logger log = LogManager.getLogger(AnimaleDao.class);
	
	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/petshopweb","root","qwerty");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	public static int save(Animale a){
		int status = 0;
		
		try{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("insert into animale(matricola,tipo_animale,nome_animale,data_acquisto,prezzo,id_cliente) values(?,?,?,?,?,?)");
			
			ps.setInt(1,a.getMatricola());
			ps.setString(2,a.getTipoAnimale());
			ps.setString(3,a.getNomeAnimale());
			ps.setString(4,a.getDataAcquisto());
			ps.setInt(5,a.getPrezzo());
			ps.setInt(6,a.getClienteShop());
			
			status=ps.executeUpdate();
		}catch(Exception e){System.out.println(e);}
		
//		if(status == 1) log.info("Registrazione animale");
//		else log.info("Errore registrazione animale");
		
		return status;
	}
	
	public static List<Animale> getAllRecords(){
		List<Animale> list = new ArrayList<Animale>();
		
		try{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from animale");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				Animale a = new Animale();
				
				a.setMatricola(rs.getInt("matricola"));
				a.setTipoAnimale(rs.getString("tipo_animale"));
				a.setNomeAnimale(rs.getString("nome_animale"));
				a.setDataAcquisto(rs.getString("data_acquisto"));
				a.setPrezzo(rs.getInt("prezzo"));
				a.setClienteShop(rs.getInt("id_cliente"));
				
				list.add(a);
			}
		}catch(Exception e){System.out.println(e);}
		
		return list;
	}
	
	public static List<Animale> getRecordsByCliente(int id_cliente){
		List<Animale> list = new ArrayList<Animale>();
		
		try{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from animale where id_cliente = ?");
			ps.setInt(1,id_cliente);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				Animale a = new Animale();
				
				a.setMatricola(rs.getInt("matricola"));
				a.setTipoAnimale(rs.getString("tipo_animale"));
				a.setNomeAnimale(rs.getString("nome_animale"));
				a.setDataAcquisto(rs.getString("data_acquisto"));
				a.setPrezzo(rs.getInt("prezzo"));
				a.setClienteShop(rs.getInt("id_cliente"));
				
				list.add(a);
			}
		}catch(Exception e){System.out.println(e);}
		
		return list;
	}
	
	public static Animale getRecordByMatricola(int matricola){
		Animale a = null;
		
		try{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from animale where matricola=?");
			ps.setInt(1,matricola);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				a = new Animale();
				a.setMatricola(rs.getInt("matricola"));
				a.setTipoAnimale(rs.getString("tipo_animale"));
				a.setNomeAnimale(rs.getString("nome_animale"));
				a.setDataAcquisto(rs.getString("data_acquisto"));
				a.setPrezzo(rs.getInt("prezzo"));
				a.setClienteShop(rs.getInt("id_cliente"));
			}
		}catch(Exception e){System.out.println(e);}
		
		return a;
	}
	
	public static int update(Animale a){
		int status = 0;
		
		try{
			Connection con = getConnection();
			PreparedStatement ps=con.prepareStatement("update animale set tipo_animale=?, nome_animale=?, data_acquisto=?, prezzo=?, id_cliente=? where matricola=?");
			
			ps.setString(1,a.getTipoAnimale());
			ps.setString(2,a.getNomeAnimale());
			ps.setString(3,a.getDataAcquisto());
			ps.setInt(4,a.getPrezzo());
			ps.setInt(5,a.getClienteShop());
			
			ps.setInt(6,a.getMatricola());
			
			status = ps.executeUpdate();
		}catch(Exception e){System.out.println(e);}
		
//		if(status == 1) log.info("Aggiornamento animale");
//		else log.info("Errore aggiornamento animale");
		
		return status;
	}
	
	public static int delete(Animale a){
		int status = 0;
		
		try{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("delete from animale where matricola=?");
			ps.setInt(1,a.getMatricola());
			status = ps.executeUpdate();
		}catch(Exception e){System.out.println(e);}

//		if(status == 1) log.info("Eliminazione animale");
//		else log.info("Errore eliminazione animale");
		
		return status;
	}
	
	public static List<Animale> getBuyableRecords(){
		List<Animale> list = new ArrayList<Animale>();
		
		try{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from animale where id_cliente is null and data_acquisto is null");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				Animale a = new Animale();
				
				a.setMatricola(rs.getInt("matricola"));
				a.setTipoAnimale(rs.getString("tipo_animale"));
				a.setNomeAnimale(rs.getString("nome_animale"));
				a.setDataAcquisto(rs.getString("data_acquisto"));
				a.setPrezzo(rs.getInt("prezzo"));
				a.setClienteShop(rs.getInt("id_cliente"));
				
				list.add(a);
			}
		}catch(Exception e){System.out.println(e);}
		
		return list;
	}
	
	public static int acquista(int matricola, int id_cliente){
		int status = 0;
		
		try{
			Connection con = getConnection();
			PreparedStatement ps=con.prepareStatement("update animale set id_cliente=?, data_acquisto=? where matricola=?");
			
			LocalDateTime ldt = LocalDateTime.now();
	        String data_acquisto = DateTimeFormatter.ofPattern("yyyy-MM-dd").format(ldt);
			
			ps.setInt(1,id_cliente);
			ps.setString(2,data_acquisto);
			ps.setInt(3,matricola);
			
			status = ps.executeUpdate();
		}catch(Exception e){System.out.println(e);}
		
//		if(status == 1) log.info("Aggiornamento animale");
//		else log.info("Errore aggiornamento animale");
		
		return status;
	}
}
