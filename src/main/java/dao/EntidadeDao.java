package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import dto.EntidadeDTO;
import modelos.Entidade;
import utils.ConexaoDB;

public class EntidadeDao {
	private static Connection con;
	
	public static void salvarEntidadeEUsuario(EntidadeDTO dto) throws SQLException {
        try {
        	con = ConexaoDB.getConexao();
            PreparedStatement stm = con.prepareStatement("CALL sp_insert_entidade_usuario (?,?,?,?,?,?)");
         
            stm.setString(1, dto.getNome());
            stm.setString(2, dto.getEmail());
            stm.setString(3, dto.getFone());
            stm.setString(4, dto.getCnpj());
            stm.setObject(5, dto.getDataCadastro());
            stm.setString(6, dto.getSenhaHash());
            stm.execute();
            stm.close();
		}
		catch (SQLException e) {
			throw new SQLException(e.getMessage());
		}
	}
	
	public static Entidade getById(int id) throws SQLException {
		Entidade entidade = null;
		try {
        	con = ConexaoDB.getConexao();
            PreparedStatement stm = con.prepareStatement("SELECT * FROM tb_entidades WHERE id = ?");
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();	

            if (rs.next()) {       
            	Date dataSql = rs.getDate("cadastrado_em");
            	LocalDate dataCadastro = (dataSql != null) ? dataSql.toLocalDate() : null;
            	
	        	entidade = new Entidade(rs.getInt("id"), rs.getString("nome"), rs.getString("cnpj"), rs.getString("fone"), dataCadastro, rs.getInt("usuario_id"));
            	return entidade;
			}
		}
		catch (SQLException e) {
			throw new SQLException(e.getMessage());
		}
		return entidade;
	}
	
	public static Entidade getEntidadeByUserId(int id) throws SQLException {
		Entidade entidade = null;
		try {
        	con = ConexaoDB.getConexao();
            PreparedStatement stm = con.prepareStatement("SELECT * FROM tb_entidades WHERE usuario_id = ?");
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();	

            if (rs.next()) {       
            	Date dataSql = rs.getDate("cadastrado_em");
            	LocalDate dataCadastro = (dataSql != null) ? dataSql.toLocalDate() : null;
            	
	        	entidade = new Entidade(rs.getInt("id"), rs.getString("nome"), rs.getString("cnpj"), rs.getString("fone"), dataCadastro, rs.getInt("usuario_id"));
            	return entidade;
			}
		}
		catch (SQLException e) {
			throw new SQLException(e.getMessage());
		}
		return entidade;
	}
}
