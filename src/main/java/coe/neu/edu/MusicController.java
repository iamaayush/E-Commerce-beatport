package coe.neu.edu;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import coe.neu.edu.DAO.MusicDao;
import coe.neu.edu.model.Music;
import coe.neu.edu.model.UserAccount;


@Controller
public class MusicController 
{
	@Autowired
	private MusicDao musicDao;
	
	@RequestMapping(value="showMusicDetails.do", method=RequestMethod.GET)
	public String showProductDetails(Model model,HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
		UserAccount user = (UserAccount)session.getAttribute("user");
		if(user==null){
			return "403";
		}
		if(!user.getRole().equals("customer")){
			return "403";
		}
		long musicID=Long.parseLong(request.getParameter("musicID"));
		Music music=musicDao.getSelectedMusic(musicID);
		model.addAttribute("music",music);
		return "MusicDetails";
    }
	
	
	@RequestMapping(value="quickFetchMusic.do", method=RequestMethod.POST)
	public void productSuggestion(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException{
//		UserAccount user = (UserAccount)session.getAttribute("customer");
//		if(user==null){
//			response.sendRedirect("");
//		}
//		if(!user.getRole().equals("customer")){
//			return "403";
//		}
		String genre = request.getHeader("genre");
		String musicName = request.getHeader("musicName");
		
		String fetchedMusic = musicDao.getQuickMusic(genre, musicName);
		PrintWriter out = response.getWriter();
		out.print(fetchedMusic);
	}
}
