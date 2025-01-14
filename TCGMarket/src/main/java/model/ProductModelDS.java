package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ProductModelDS implements ProductModel {
	
	private static DataSource ds;
	
	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			
			ds = (DataSource) envCtx.lookup("jdbc/storage");
		}catch (NamingException e) {
			System.out.println("Error: "+e.getMessage());
		}
	}
	
	private static final String TABLE_NAME = "articolo";

	@Override
	public synchronized void doSave(ProductBean product) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String insertSQL = "INSERT INTO " + ProductModelDS.TABLE_NAME
				+ " (id,nome,prezzo, saldo, data_di_uscita,descrizione,quantità ) VALUES (?, ?, ?, ?,?,?,?)";
		
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setLong(1, product.getId());
			preparedStatement.setString(2, product.getNome());
			preparedStatement.setFloat(3, product.getPrezzo());
			preparedStatement.setInt(4, product.getSaldo());
			preparedStatement.setDate(5, Date.valueOf(product.getData_uscita()));
			preparedStatement.setString(6, product.getDescrizione());
			preparedStatement.setInt(7, product.getQuantità());

			preparedStatement.executeUpdate();

			connection.commit();
		}finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
	}

	@Override
	public synchronized ProductBean doRetrieveByKey(int id) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		ProductBean bean = new ProductBean();
		
		String selectSQL = "SELECT * FROM " + ProductModelDS.TABLE_NAME + " WHERE id = ?";
		
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, id);
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				bean.setId(rs.getInt("id"));
				bean.setNome(rs.getString("nome"));
				bean.setPrezzo(rs.getFloat("prezzo"));
				bean.setSaldo(rs.getInt("saldo"));
				bean.setData_uscita(rs.getDate("data_di_uscita").toLocalDate());
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setQuantità(rs.getInt("quantità"));
			}

		}finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return bean;
	}
	
	@Override
	public synchronized boolean doDelete(int id) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM " + ProductModelDS.TABLE_NAME + " WHERE CODE = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, id);

			result = preparedStatement.executeUpdate();

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return (result != 0);
	}

	@Override
	public synchronized Collection<ProductBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<ProductBean> products = new LinkedList<ProductBean>();

		String selectSQL = "SELECT * FROM " + ProductModelDS.TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();

				bean.setId(rs.getInt("id"));
				bean.setNome(rs.getString("nome"));
				bean.setPrezzo(rs.getFloat("prezzo"));
				bean.setSaldo(rs.getInt("saldo"));
				bean.setData_uscita(rs.getDate("data_di_uscita").toLocalDate());
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setQuantità(rs.getInt("quantità"));
				products.add(bean);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return products;
	}

}
