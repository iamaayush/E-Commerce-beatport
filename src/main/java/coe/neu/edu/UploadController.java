package coe.neu.edu;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import coe.neu.edu.DAO.MusicDao;
import coe.neu.edu.DAO.SupplierDao;
//import coe.neu.edu.model.FileUpload;
import coe.neu.edu.model.Genre;
import coe.neu.edu.model.Music;
import coe.neu.edu.model.UserAccount;

@Controller
public class UploadController{

	
//	@Autowired
//	@Qualifier("musicValidator")
//	private Validator validator2;

	
	@Autowired
	private SupplierDao supplierDao;
	
	@Autowired
	private MusicDao musicDao;
	
	
//	@InitBinder
//	private void initBinder (WebDataBinder binder){
//		binder.setValidator(validator2);
//	}
////	
//	

/*////	@RequestMapping(value="addMusicToCategory.do", method=RequestMethod.POST)
////    protected ModelAndView doSubmitAction(Model model, Object command, HttpServletRequest request) throws Exception {
////        Music music = (Music) command;
////        
//////        CommonsMultipartFile commonsFile = music.getImage();
//////        CommonsMultipartFile commonsFile2 = music.getSampleMusic();
////        
//////        File destFileImage = new File("E:\\uploads\\images\\", commonsFile.getOriginalFilename());
//////        File destFileSampleMusic = new File("E:\\uploads\\sample\\", commonsFile2.getOriginalFilename());
////        
//////        music.getImage().transferTo(destFileImage);
//////        music.getSampleMusic().transferTo(destFileSampleMusic);
////        
//////        String imagePath = "E:\\uploads\\images\\"+commonsFile.getOriginalFilename();
//////        String samplePath = "E:\\uploads\\sample\\"+commonsFile2.getOriginalFilename();
////        
//////        music.setImagePath(imagePath);
//////        music.setSamplePath(samplePath);
////
////        //hibernateSession.save(user);
////        String selectedGenre = request.getParameter("selectedGenre");
////        
////        model.addAttribute("music", music);
////        
////        supplierDao.addMusicToDb(music, selectedGenre);
////        
////        return new ModelAndView(getSuccessView(), "music", music);
        
//		return "musicAdded";
		
	}
//    //Use onSubmit instead of doSubmitAction 
//    //when you need access to the Request, Response, or BindException objects
//    /*
//     * @Override protected ModelAndView onSubmit( HttpServletRequest request,
//     * HttpServletResponse response, Object command, BindException errors)
//     * throws Exception { ModelAndView mv = new ModelAndView(getSuccessView());
//     * //Do something... return mv; }
//     */
//	
//
//	
//
	@RequestMapping(value="addMusicToCategory.do", method=RequestMethod.POST)
    protected String doSubmitAction(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
        
		UserAccount user = (UserAccount)session.getAttribute("user");
		if(user==null){
			return "403";
		}
		if(!user.getRole().equals("supplier")){
			return "403";
		}		
        //hibernateSession.save(user);
        Music music = new Music();
		
		String selectedGenre = request.getParameter("selectedGenre");
        music.setDescription(request.getParameter("description"));
        music.setName(request.getParameter("name"));
        music.setSupplierName(request.getParameter("supplierName"));
        music.setPrice(Float.parseFloat(request.getParameter("price")));
        music.setQuantity(Integer.parseInt(request.getParameter("quantity")));
        
        music.setImagePath(request.getParameter("putImage"));
        music.setSamplePath(request.getParameter("putSample"));
//        music.setSupplierName(request.getParameter("supplierName"));
        
        Genre genre = musicDao.getGenreObj(selectedGenre);
        music.setGenre(genre);
                
        supplierDao.addMusicToDb(music);
        
		return "musicAdded";
		
	}
	
	
	
//	@RequestMapping(value="addMusicToCategory.do", method = RequestMethod.POST)
////    public @ResponseBody
//    public String uploadMultipleFileHandler(@RequestParam("file") MultipartFile file, HttpServletRequest request) throws Exception {
// 
////        if (files.length != names.length)
////            return "Mandatory information missing";
// 
////        String message = "";
//
//		
//        Music music = new Music();
//		
//		String selectedGenre = request.getParameter("selectedGenre");
//        music.setDescription(request.getParameter("description"));
//        music.setName(request.getParameter("name"));
//        music.setPrice(Float.parseFloat(request.getParameter("price")));
//        music.setQuantity(Integer.parseInt(request.getParameter("quantity")));
//        
//      music.setImagePath("imagePath");
////        music.setImagePath(request.getParameter("image"));
////        music.setSamplePath(request.getParameter("sample"));
//        
//        Genre genre = musicDao.getGenreObj(selectedGenre);
//        music.setGenre(genre);
//
//		
//		
////		for (int i = 0; i < files.length; i++) {
////            MultipartFile file = files[i];
////            String name = names[i];
//            try {
//                byte[] bytes = file.getBytes();
// 
//                // Creating the directory to store file
//                String rootPath = System.getProperty("catalina.home");
//                File dir = new File(rootPath + File.separator + "tmpFiles");
//                if (!dir.exists())
//                {
//                	dir.mkdirs();
//                }
// 
//                // Create the file on server
//                File serverFile = new File(dir.getAbsolutePath());
//                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
//                stream.write(bytes);
//                stream.close();
// 
//                
//                
//                
//                
//                String fileLocation = serverFile.getAbsolutePath();
//                          
////                if(file.getName().equals("*.img"))
//                music.setImagePath(fileLocation);
////                music.setSamplePath(request.getParameter("sample"));
//
//                
//                logger.info("Server File Location="
//                        + serverFile.getAbsolutePath());
//                
//                
//                
////                message = message + "You successfully uploaded file=" + name
////                        + "<br />";
//            } catch (Exception e) {
//                return "You failed to upload "+ e.getMessage();
//        }
//        
//        
//        
//        
//                
//        supplierDao.addMusicToDb(music);
//        
////        return new ModelAndView(getSuccessView(), "music", music);
//        
////		return "musicAdded";
//
//        
//        
//        return "musicAdded";
//    }
	
 
//	@RequestMapping(value="aMTC.do", method=RequestMethod.POST)
//	protected ModelAndView onSubmit(HttpServletRequest request,
//		HttpServletResponse response, @Validated FileUpload fileUpload,BindingResult result, BindException errors, Object command)
//		throws Exception {
// 
//		
// 
//		
//		MultipartFile multipartFile = fileUpload.getImage();
// 
//		String fileName="";
// 
//		if(multipartFile!=null){
//			fileName = multipartFile.getOriginalFilename();
//			
////			BufferedImage src = ImageIO.read(new ByteArrayInputStream(file.getBytes()));
////			 File destination = new File("File directory with file name") // something like C:/Users/tom/Documents/nameBasedOnSomeId.png
////			 ImageIO.write(src, "png", destination);
//			
//			
//			byte[] bytes = multipartFile.getBytes();
//			
//			String rootPath = System.getProperty("catalina.home");
//            File dir = new File(rootPath + File.separator + "tmpFiles");
//            if (!dir.exists())
//                dir.mkdirs();
//
//            // Create the file on server
//            File serverFile = new File(dir.getAbsolutePath()
//                    + File.separator + fileName);
//            BufferedOutputStream stream = new BufferedOutputStream(
//                    new FileOutputStream(serverFile));
//            stream.write(bytes);
//            stream.close();
//
////            logger.info("Server File Location="
////                    + serverFile.getAbsolutePath());
//			
//			
//			//do whatever you want
//		}
// 
//		ModelAndView mv = new ModelAndView();
////		mv.addObject("music", music);
//		mv.addObject("fileName", fileName);
//		
//		mv.setViewName("musicAdded");
//		return mv;
////		return new ModelAndView("musicAdded","fileName",fileName);
//	}
	
	
}

