package it.betacom.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import it.betacom.bean.User;

public class UserDao {
	
//	static Logger log = LogManager.getLogger(UserDao.class);
	
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
	
	public static int save(User c){
		int status = 0;
		
		try{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("insert into cliente(username,nome,cognome,email,password,cellulare,data_di_nascita) values(?,?,?,?,?,?,?)");
			
			String username = createUsername(c);
			
//			String username = c.getNome().substring(0,2) + c.getCognome().substring(0,2) + c.getData_di_nascita().substring(0,4);
			
			ps.setString(1,username);
			ps.setString(2,c.getNome());
			ps.setString(3,c.getCognome());
			ps.setString(4,c.getEmail());
			ps.setString(5,c.getPassword());
			ps.setString(6,c.getCellulare());
			ps.setString(7,c.getData_di_nascita());
			
			status=ps.executeUpdate();
		}catch(Exception e){System.out.println(e);}
		
//		if(status == 1) log.info("Registrazione utente");
//		else log.info("Errore registrazione utente");
		
		return status;
	}
	
	public static List<User> getAllRecords(){
		List<User> list = new ArrayList<User>();
		
		try{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from cliente");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				User c = new User();
				
				c.setId(rs.getInt("id"));
				c.setUsername(rs.getString("username"));
				c.setNome(rs.getString("nome"));
				c.setCognome(rs.getString("cognome"));
				c.setEmail(rs.getString("email"));
				c.setPassword(rs.getString("password"));
				c.setCellulare(rs.getString("cellulare"));
				c.setData_di_nascita(rs.getString("data_di_nascita"));
				c.setRuolo(rs.getString("ruolo"));
				c.setStato(rs.getString("stato"));
				
				list.add(c);
			}
		}catch(Exception e){System.out.println(e);}
		
		return list;
	}
	
	public static User getRecordByUsername(String username){
		User c = null;
		
		try{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from cliente where username=?");
			ps.setString(1,username);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				c = new User();
				c.setId(rs.getInt("id"));
				c.setUsername(rs.getString("username"));
				c.setNome(rs.getString("nome"));
				c.setCognome(rs.getString("cognome"));
				c.setEmail(rs.getString("email"));
				c.setPassword(rs.getString("password"));
				c.setCellulare(rs.getString("cellulare"));
				c.setData_di_nascita(rs.getString("data_di_nascita"));
				c.setRuolo(rs.getString("ruolo"));
				c.setStato(rs.getString("stato"));
			}
		}catch(Exception e){System.out.println(e);}
		
		return c;
	}
	
	public static User getRecordById(int id){
		User c = null;
		
		try{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from cliente where id=?");
			ps.setInt(1,id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				c = new User();
				c.setId(rs.getInt("id"));
				c.setUsername(rs.getString("username"));
				c.setNome(rs.getString("nome"));
				c.setCognome(rs.getString("cognome"));
				c.setEmail(rs.getString("email"));
				c.setPassword(rs.getString("password"));
				c.setCellulare(rs.getString("cellulare"));
				c.setData_di_nascita(rs.getString("data_di_nascita"));
				c.setRuolo(rs.getString("ruolo"));
				c.setStato(rs.getString("stato"));
			}
		}catch(Exception e){System.out.println(e);}
		
		return c;
	}
	
	public static int update(User c){
		int status = 0;
		
		try{
			Connection con = getConnection();
			PreparedStatement ps=con.prepareStatement("update cliente set username=?, nome=?, cognome=?, email=?, password=?, cellulare=?, data_di_nascita=?, ruolo=?, stato=? where id=?");
			ps.setString(1,c.getUsername());
			ps.setString(2,c.getNome());
			ps.setString(3,c.getCognome());
			ps.setString(4,c.getEmail());
			ps.setString(5,c.getPassword());
			ps.setString(6,c.getCellulare());
			ps.setString(7,c.getData_di_nascita());
			ps.setString(8,c.getRuolo());
			ps.setString(9,c.getStato());
			ps.setInt(10,c.getId());
			status = ps.executeUpdate();
		}catch(Exception e){System.out.println(e);}
		
//		if(status == 1) log.info("Aggiornamento utente");
//		else log.info("Errore aggiornamento utente");
		
		return status;
	}
	
	public static int delete(User c){
		int status = 0;
		
		try{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("delete from cliente where id=?");
			ps.setInt(1,c.getId());
			status = ps.executeUpdate();
		}catch(Exception e){System.out.println(e);}
		
//		if(status == 1) log.info("Eliminazione utente");
//		else log.info("Errore eliminazione utente");

		return status;
	}
	
	public static int login(User c) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from cliente where username=? and password=?");
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
	
	public static int changePassword(String username, String password) {
		int status = 0;
		
		try{
			Connection con = getConnection();
			PreparedStatement ps=con.prepareStatement("update cliente set password=? where username=?");
			ps.setString(1,username);
			ps.setString(2, password);
			status = ps.executeUpdate();
		}catch(Exception e){System.out.println(e);}
		
		return status;
	}
	
	public static void disabilita(User c) {
		try{
			Connection con = getConnection();
			PreparedStatement ps=con.prepareStatement("update cliente set stato='D' where id=?");
			ps.setInt(1,c.getId());
			ps.executeUpdate();
		}catch(Exception e){System.out.println(e);}
	}
	
	public static String createUsername(User utente) {
        UserDao utenteDao = new UserDao();
        String nome = utente.getNome().substring(0, 2);
        String cognome = utente.getCognome().substring(0, 2);
        String anno = utente.getData_di_nascita().substring(0,4);

        String username = nome + cognome + anno;
        int i = 1;
        while (true) {
            User u = utenteDao.getRecordByUsername(username);
            if(u == null) {
                return username;
            } else {
                username = nome + cognome + anno + "_" + i;
                i++;
            }
        }
    }
	
	
}
