package coe.neu.edu.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import coe.neu.edu.model.Genre;
import coe.neu.edu.model.Music;
import coe.neu.edu.model.Order;

public class CustomerDao extends DAO {

	public List getMusic(String genre, String music) throws Exception {
		try {
			Session session = getSession();
			session.beginTransaction();
			Query q = session.createQuery("from Genre where name = :genreName");
			q.setString("genreName", genre);

			Genre genreDb = (Genre) q.list().get(0);
			long genreId = genreDb.getGenreId();

			Query q1 = session
					.createQuery("from Music where genre =:genreId and name= :music ");
			q1.setString("genreId", String.valueOf(genreId));
			q1.setString("music", music);
			List<Music> musicList = new ArrayList<Music>();
			musicList = q1.list();
			session.close();
			return musicList;

		} catch (HibernateException e) {

			rollback();
			throw new Exception(e);
		}

	}

	public List getMusicList(String genre) throws Exception {
		try {
			Session session = getSession();
			session.beginTransaction();
			Query q = session.createQuery("from Genre where name = :genreName");
			q.setString("genreName", genre);

			Genre genreDb = (Genre) q.list().get(0);
			long genreId = genreDb.getGenreId();

			Query q1 = session.createQuery("from Music where genre =:genreId ");
			q1.setString("genreId", String.valueOf(genreId));
			List<Music> musicList = new ArrayList<Music>();
			musicList = q1.list();
			session.close();
			return musicList;
		}

		catch (HibernateException e) {

			rollback();
			throw new Exception(e);
		}

	}

	public List<Music> quickSearch(String musicName, float priceFrom,
			float priceTo, String supplierName) throws Exception {
		Session session = null;
		try {
			// begin();
			session = getSession();
			session.beginTransaction();
			// long genreId=0;
			// if (genre != "") {
			// Query q = session
			// .createQuery("from Genre where name = :genreName");
			// q.setString("genreName", genre);
			// Genre dbGenre = (Genre) q.list().get(0);
			// genreId = dbGenre.getGenreId();
			// }
			// Criteria cr = session.createCriteria(Chocolate.class);
			// cr.add(Restrictions.like("companyName", companyName + "%"));
			// cr.add(Restrictions.like("category", category + "%"));
			Criteria cr;
			if (musicName.equals("") && priceFrom == 0 && priceTo == 0
					&& supplierName.equals("")) {
				cr = session.createCriteria(Music.class);
			} else {
				cr = session.createCriteria(Music.class);
				if (musicName != "") {
					cr.add(Restrictions.like("name", musicName + "%"));
				}
				// if (category != "") {
				// cr.add(Restrictions.like("category", categoryId));
				// }
				if (supplierName != "") {
					cr.add(Restrictions
							.like("supplierName", supplierName + "%"));
				}
				if (priceFrom == 0 && priceTo == 0) {
					cr.add(Restrictions.gt("price", priceFrom));
				}
				if (priceFrom == 0 && priceTo != 0) {
					cr.add(Restrictions.between("price", priceFrom, priceTo));
				}
			}

			if (priceFrom != 0 && priceTo != 0) {
				cr.add(Restrictions.between("price", priceFrom, priceTo));
			}

			session.getTransaction().commit();
			List<Music> musicList = cr.list();
			return musicList;
		} catch (HibernateException e) {
			// rollback();
			throw new Exception("Problem getting music!", e);
		} finally {
			session.close();
		}
	}

	public List<String> getSupplierList() throws Exception {
		Session session = null;
		try {
			session = getSession();
			session.beginTransaction();
			Query q = session
					.createQuery("select distinct supplierName from Music");
			session.getTransaction().commit();
			return q.list();
		} catch (HibernateException e) {

			rollback();
			throw new Exception(e);
		}

		finally {
			session.close();
		}
	}
	
	public List getMyOrderHistory(String customerId) throws Exception
	{
		Session session = getSession();
		try 
		{
        	session.beginTransaction();
            Query q = session.createQuery("from Order where customer = :customerID");
            q.setString("customerID", customerId);
            List<Order>orderList=q.list();
            session.getTransaction().commit();
            return orderList;
		}
			catch (HibernateException e) 
			{
	
				rollback();
				throw new Exception(e);
			}

		finally 
		{
			session.close();
		}
}

}
