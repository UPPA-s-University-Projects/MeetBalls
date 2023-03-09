package fr.pau.univ.meetballs.dao.impl.bdd;

import java.util.List;

import javax.persistence.TypedQuery;

import fr.pau.univ.meetballs.dao.interfaces.IUserDao;
import fr.pau.univ.meetballs.exception.DaoException;
import fr.pau.univ.meetballs.model.User;

public class UserDao implements IUserDao {
	private final DaoBddHelper bdd;

	/**
	 * Le constructeur de notre classe.
	 * Essaye de récupérer une instance de la classe DaoBddHelper.
	 * 
	 * @throws DaoException
	 */
	public UserDao() throws DaoException {
		this.bdd = DaoBddHelper.getInstance();
	}

	@Override
	public User getUserById(int id) throws DaoException {
		final TypedQuery<User> query = this.bdd.getEm().createNamedQuery("Usr.findById", User.class);
		query.setParameter("id", id);
		
		
		final List<User> ret = query.getResultList();
		
		
		if (ret.size() > 0) {
			return ret.get(0);
		}
		return null;
	}

	@Override
	public List getUsersByFavCookType(List ct) throws DaoException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List getUsersByMatchedUser(User u) throws DaoException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List getUsersByMatchedUsers(User u) throws DaoException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User createUser(User u, boolean useTransac) throws DaoException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User updateUser(User u, boolean useTransac) throws DaoException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User deleteUser(User u, boolean useTransac) throws DaoException {
		// TODO Auto-generated method stub
		return null;
	}

}
