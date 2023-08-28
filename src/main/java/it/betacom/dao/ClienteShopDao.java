package it.betacom.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import it.betacom.bean.ClienteShop;

public class ClienteShopDao {
	
//	static Logger log = LogManager.getLogger(ClienteShopDao.class);
	
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
	
	public static int save(ClienteShop c){
		int status = 0;
		
		try{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("insert into clienteshop(nome,cognome,citta,telefono,indirizzo) values(?,?,?,?,?)");
						
			ps.setString(1,c.getNome());
			ps.setString(2,c.getCognome());
			ps.setString(3,c.getCitta());
			ps.setString(4,c.getTelefono());
			ps.setString(5,c.getIndirizzo());
			
			status=ps.executeUpdate();
		}catch(Exception e){System.out.println(e);}
		
//		if(status == 1) log.info("Registrazione cliente");
//		else log.info("Errore registrazione cliente");
		
		return status;
	}
	
	public static List<ClienteShop> getAllRecords(){
		List<ClienteShop> list = new ArrayList<ClienteShop>();
		
		try{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from clienteshop");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				ClienteShop c = new ClienteShop();
				
				c.setIdCliente(rs.getInt("id_cliente"));
				c.setNome(rs.getString("nome"));
				c.setCognome(rs.getString("cognome"));
				c.setCitta(rs.getString("citta"));
				c.setTelefono(rs.getString("telefono"));
				c.setIndirizzo(rs.getString("indirizzo"));
				
				list.add(c);
			}
		}catch(Exception e){System.out.println(e);}
		
		return list;
	}
	
	public static ClienteShop getRecordById(int id){
		ClienteShop c = null;
		
		try{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from clienteshop where id_cliente=?");
			ps.setInt(1,id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				c = new ClienteShop();
				c.setIdCliente(rs.getInt("id_cliente"));
				c.setNome(rs.getString("nome"));
				c.setCognome(rs.getString("cognome"));
				c.setCitta(rs.getString("citta"));
				c.setTelefono(rs.getString("telefono"));
				c.setIndirizzo(rs.getString("indirizzo"));
			}
		}catch(Exception e){System.out.println(e);}
		
		return c;
	}
	
	public static int update(ClienteShop c){
		int status = 0;
		
		try{
			Connection con = getConnection();
			PreparedStatement ps=con.prepareStatement("update clienteshop set nome=?, cognome=?, citta=?, telefono=?, indirizzo=? where id_cliente=?");
			ps.setString(1,c.getNome());
			ps.setString(2,c.getCognome());
			ps.setString(3,c.getCitta());
			ps.setString(4,c.getTelefono());
			ps.setString(5,c.getIndirizzo());
			ps.setInt(6,c.getIdCliente());
			status = ps.executeUpdate();
		}catch(Exception e){System.out.println(e);}
		
//		if(status == 1) log.info("Aggiornamento cliente");
//		else log.info("Errore aggiornamento cliente");
		
		return status;
	}
	
	public static int delete(ClienteShop c){
		int status = 0;
		
		try{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("delete from clienteshop where id_cliente=?");
			ps.setInt(1,c.getIdCliente());
			status = ps.executeUpdate();
		}catch(Exception e){System.out.println(e);}

//		if(status == 1) log.info("Eliminazione cliente");
//		else log.info("Errore eliminazione cliente");
		
		return status;
	}
	
	public static int signup(ClienteShop c){
		int status = 0;
		
		try{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("insert into clienteshop(nome,cognome,citta,telefono,indirizzo,username,password,data_di_nascita,email) values(?,?,?,?,?,?,?,?,?)");
			
			String username = createUsername(c);
			
			ps.setString(1,c.getNome());
			ps.setString(2,c.getCognome());
			ps.setString(3,c.getCitta());
			ps.setString(4,c.getTelefono());
			ps.setString(5,c.getIndirizzo());
			ps.setString(6,username);
			ps.setString(7,c.getPassword());
			ps.setString(8,c.getData_di_nascita());
			ps.setString(9,c.getEmail());
			
			status=ps.executeUpdate();
		}catch(Exception e){System.out.println(e);}
		
//		if(status == 1) log.info("Registrazione cliente");
//		else log.info("Errore registrazione cliente");
		
		return status;
	}
	
	public static int login(ClienteShop c) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from clienteshop where username=? and password=?");
			ps.setString(1, c.getUsername());
			ps.setString(2, c.getPassword());
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				status = 1;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static ClienteShop getRecordByUsername(String username){
		ClienteShop c = null;
		
		try{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from clienteshop where username=?");
			ps.setString(1,username);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				c = new ClienteShop();
				c.setIdCliente(rs.getInt("id_cliente"));
				c.setUsername(rs.getString("username"));
				c.setNome(rs.getString("nome"));
				c.setCognome(rs.getString("cognome"));
				c.setEmail(rs.getString("email"));
				c.setPassword(rs.getString("password"));
				c.setTelefono(rs.getString("telefono"));
				c.setData_di_nascita(rs.getString("data_di_nascita"));
				c.setCitta(rs.getString("citta"));
				c.setIndirizzo(rs.getString("indirizzo"));
			}
		}catch(Exception e){System.out.println(e);}
		
		return c;
	}
	
	public static String createUsername(ClienteShop utente) {
        ClienteShopDao clienteDao = new ClienteShopDao();
        String nome = utente.getNome().substring(0, 2);
        String cognome = utente.getCognome().substring(0, 2);
        String anno = utente.getData_di_nascita().substring(0,4);

        String username = nome + cognome + anno;
        int i = 1;
        while (true) {
            ClienteShop u = clienteDao.getRecordByUsername(username);
            if(u == null) {
                return username;
            } else {
                username = nome + cognome + anno + "_" + i;
                i++;
            }
        }
    }
}
