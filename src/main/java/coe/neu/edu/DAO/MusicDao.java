package coe.neu.edu.DAO;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import coe.neu.edu.model.Genre;
import coe.neu.edu.model.Music;

public class MusicDao extends DAO
{
	public Music getSelectedMusic(long musicID) throws Exception
	{
		try 
		{
        	Session session = getSession();
            session.beginTransaction();
            Query q = session.createQuery("from Music where musicId = :musicID");
            q.setString("musicID", String.valueOf(musicID));
            Music selectedMusic=(Music)q.list().get(0);
            session.getTransaction().commit();
            session.close();
            return selectedMusic;
    		
         } 
		catch (HibernateException e) 
		{
        	rollback();
            throw new Exception("Could not....supp!");
        }
		
	}

		
		public Genre getGenreObj(String selectedGenre) throws Exception
		{
			try 
			{
	        	Session session = getSession();
	            session.beginTransaction();
	            Query q = session.createQuery("from Genre where name = :genreName");
	            q.setString("genreName", selectedGenre);
	            Genre genreObj = (Genre)q.list().get(0);
	            session.getTransaction().commit();
	            session.close();
	            return genreObj;
	    		
	         } 
			catch (HibernateException e) 
			{
	        	rollback();
	            throw new Exception(e);
	        }

		
	}
		
		
		public String getQuickMusic(String genre, String musicName){
			
			Session session = getSession();
			session.beginTransaction();
			Query q = session.createQuery("from Genre where name = :genreName");
			q.setString("genreName", genre);
			Genre gen = (Genre)q.uniqueResult();
			
			String genreId = String.valueOf(gen.getGenreId());
			
			Query q1 = session.createQuery("from Music where genre = :genreId and name like '"+musicName+"%'");
			q1.setString("genreId", genreId);
			List<Music> musicList = q1.list();
			String fetchedMusic = "";
			
			for(Music m : musicList){
				
				fetchedMusic = fetchedMusic + m.getName() +"\r\n";
			}
			
			return fetchedMusic;
		}
	

}
