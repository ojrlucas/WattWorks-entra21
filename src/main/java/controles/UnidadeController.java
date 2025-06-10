package controles;

import java.sql.SQLException;
import java.util.List;

import dao.UnidadeDao;
import modelos.Unidade;

public class UnidadeController {
	public void salvarUnidade(Unidade uni) throws SQLException {
		UnidadeDao.salvarUnidade(uni);
	}
	 
	public Unidade getById(int id) throws SQLException {
		return UnidadeDao.getById(id);
	}
	
	public List<Unidade> getByEntidadeId(int entidadeId) throws SQLException {
		System.out.print("chegou no controller");
		return UnidadeDao.getByEntidadeId(entidadeId);
	} 
}