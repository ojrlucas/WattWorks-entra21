package controles;

import java.sql.SQLException;

import dao.EntidadeDao;
import dao.UsuarioDao;
import dto.EntidadeDTO;
import modelos.Entidade;
import modelos.Usuario;
 
public class EntidadeController {
	private EntidadeDTO entDTO = null;
	
	public void salvarEntidadeEUsuario(Entidade ent, Usuario user) throws SQLException {
		entDTO = new EntidadeDTO(ent, user);
		EntidadeDao.salvarEntidadeEUsuario(entDTO);
	}
	 
	public void editarEntidadeEUsuario(Entidade ent, Usuario user) throws SQLException {
		entDTO = new EntidadeDTO(ent, user);
		EntidadeDao.salvarEntidadeEUsuario(entDTO);
	}
	
	public Entidade getById(int id) throws SQLException {
		return EntidadeDao.getById(id);
	}
	
	public EntidadeDTO getEntDtoById(int id) throws SQLException {
		Entidade ent = EntidadeDao.getById(id);
		Usuario user = UsuarioDao.getById(ent.getUsuarioId());
		entDTO = new EntidadeDTO(ent, user);
		return entDTO;
	}
	
	public Entidade getEntidadeByUserId(int id) throws SQLException {
		return EntidadeDao.getEntidadeByUserId(id);
	}
}
