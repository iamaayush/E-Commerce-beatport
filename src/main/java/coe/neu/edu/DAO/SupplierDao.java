package coe.neu.edu.DAO;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import coe.neu.edu.model.Genre;
import coe.neu.edu.model.Music;

public class SupplierDao extends DAO{
	
	public List getListOfGenre() throws Exception{

		
		try {
        	
//        	begin();
            Session session = getSession();
            session.beginTransaction();
            
            Query q = session.createQuery("from Genre");
            
            List<Genre> genreList = new ArrayList<Genre>();
            genreList=q.list();
            
            
            session.getTransaction().commit();
            session.close();
    		return genreList;
            
//            commit();
        } catch (HibernateException e) {
        	
            rollback();
            throw new Exception("Could not....supp!");
        }

		

		
	}
	
	

	public void addMusicToDb(Music music) throws Exception{
		
		try {
        	
//        	begin();
            Session session = getSession();
            session.beginTransaction();
            
//            Query q = session.createQuery("from Genre where name = :genrename");
//            q.setString("genrename", selectedGenre);
//            Genre genreObj = (Genre)q.list().get(0);

//            music.setGenre(genreObj);
            
//            Music music = new Music();
//    		music.setName(musicMap.get("name"));
//    		music.setPrice(Float.parseFloat(musicMap.get("price")));
//    		music.setQuantity(Integer.parseInt(musicMap.get("quantity")));
//    		music.setDescription(musicMap.get("desc"));
//    		//set fileuploadPath//


//    		music.setName(name);
//    		music.setPrice(price);
//    		music.setQuantity(quantity);
//    		music.setDescription(desc);
//    		music.setPath(path);
//    		music.setSample(sample);
    		//set fileuploadPath//
    		
    		
//    		CommonsMultipartFile commonsFile = music.getImage();
//            CommonsMultipartFile commonsFile2 = music.getSampleMusic();
//            
//            File destFileImage = new File("E:\\uploads\\images\\", commonsFile.getOriginalFilename());
//            File destFileSampleMusic = new File("E:\\uploads\\sample\\", commonsFile2.getOriginalFilename());
//            
//            music.getImage().transferTo(destFileImage);
//            music.getSampleMusic().transferTo(destFileSampleMusic);
//    		
//            music.setImagePath("E:\\uploads\\images\\+commonsFile.getOriginalFilename()");
//            music.setSamplePath("E:\\uploads\\sample\\commonsFile2.getOriginalFilename()");

            
//            music.setGenre(genreObj);
            
            session.save(music);
            
            session.getTransaction().commit();
			session.close();
            
//            commit();
        } catch (HibernateException e) {
        	
            rollback();
            throw new Exception(e);
        }

		
	}
	
}
