package model;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.time.LocalDate;
public class UserDAO {
	private static DataSource ds;
	static Connection currentCon = null;
	static ResultSet rs = null;
	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			ds = (DataSource) envCtx.lookup("jdbc/tcgmarket");
		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}
	private static final String TABLE_NAME = "utente";
	public static  UserBean doRetrieve(UserBean bean) {
		PreparedStatement preparedStatement = null;
		String username = bean.getUsername();
		String password = bean.getPassword();
		String searchQuery = "select * from " + TABLE_NAME + "where username='" + username + "' AND password='"
				+ password + "'";
		// "System.out.println" prints in the console; Normally used to trace the
		// process
		System.out.println("Your user name is " + username);
		System.out.println("Your password is " + password);
		System.out.println("Query: " + searchQuery);
		// connect to DB
		Connection connection = null;
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(searchQuery);
			rs = preparedStatement.executeQuery(searchQuery);
			boolean more = rs.next();
			if (!more) {
				System.out.println("Sorry, you are not a registered user! Please sign up first");
				bean.setValid(false);
			}
			// if user exists set the isValid variable to true
			else if (more) {
				String firstName = rs.getString("nome");
				String lastName = rs.getString("cognome");
				String email= rs.getString("email");
				String num_tel= rs.getString("num_tel");
				String paese_residenza= rs.getString("paese_residenza");
				LocalDate data_nascita=rs.getDate("data_nascita").toLocalDate();
				System.out.println("Welcome " + firstName);
				bean.setNome(firstName);
				bean.setCognome(lastName);
				bean.setEmail(email);
				bean.setNum_tel(num_tel);
				bean.setPaese_residenza(paese_residenza);
				bean.setData_nascita(data_nascita);
				bean.setValid(true);
			}
		}
		catch (Exception ex) {
			System.out.println("Log In failed: An Exception has occurred! " + ex);
		}
		// some exception handling
		finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception e) {
				}
				rs = null;
			}
			if (preparedStatement != null) {
				try {
					preparedStatement.close();
				} catch (Exception e) {
				}
				preparedStatement = null;
			}
			if (currentCon != null) {
				try {
					currentCon.close();
				} catch (Exception e) {
				}
				currentCon = null;
			}
		}
		return bean;
	}
}