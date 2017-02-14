package coe.neu.edu;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import coe.neu.edu.DAO.CustomerDao;
import coe.neu.edu.DAO.SupplierDao;
import coe.neu.edu.model.Music;
import coe.neu.edu.model.Order;
import coe.neu.edu.model.UserAccount;


@Controller
public class CustomerRoleController 
{
	@Autowired
	private CustomerDao customerDao;
	
	@Autowired
	private SupplierDao supplierDao;

	@RequestMapping(value = "getMusic.do", method = RequestMethod.POST)
	public String getMusic(Model model,HttpServletRequest request, HttpSession session, HttpServletResponse response) throws Exception{
		
		UserAccount user = (UserAccount)session.getAttribute("user");
		if(user==null){
			return "403";
		}
		if(!user.getRole().equals("customer")){
			return "403";
		}
		String genre=request.getParameter("genre");
		String searchMusic=request.getParameter("musicName");
		if(searchMusic.equals(""))
		{
		   List<Music>musicList=customerDao.getMusicList(genre);
		   model.addAttribute("musicList",musicList);
		   List<String> supplierList= customerDao.getSupplierList();
		   model.addAttribute("supplierList",supplierList);
		}
		
		else
		{
		  List<Music>getMusicList=customerDao.getMusic(genre,searchMusic);
		  model.addAttribute("musicList",getMusicList);
		  
		}
		return "MusicDisplay";
		
	}
	
	
	@RequestMapping(value = "quickSearch.do", method = RequestMethod.POST)
	public String quickSearch(Model model, HttpServletRequest request, HttpSession session, HttpServletResponse response)
			throws Exception {
		
		UserAccount user = (UserAccount)session.getAttribute("user");
		if(user==null){
			return "403";
		}
		if(!user.getRole().equals("customer")){
			return "403";
		}
		String musicName = request.getParameter("musicName");
		float priceFrom;
		float priceTo;
		String pricef = request.getParameter("priceFrom");
		if (pricef.equals("")) {
			priceFrom = 0;
		} else {
			priceFrom = Float.parseFloat(pricef);
		}
		String pricet = request.getParameter("priceTo");
		if (pricet.equals("")) {
			priceTo = 0;
		} else {
			priceTo = Float.parseFloat(pricet);
		}
		//String genre = request.getParameter("genre");
		//System.out.println(genre);
		String supplierName = request.getParameter("supplier");
		model.addAttribute("supplierList", customerDao.getSupplierList());
		model.addAttribute("genreList", supplierDao.getListOfGenre());
		List<Music> searchResult = customerDao.quickSearch(musicName, priceFrom, priceTo, supplierName);
		model.addAttribute("musicList", searchResult);
		return "MusicDisplay";
	}
	
	@RequestMapping(value = "getOrderHistory.do", method = RequestMethod.POST)
	public String getOrderHistory(Model model,HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
		UserAccount user = (UserAccount)session.getAttribute("user");
		if(user==null){
			return "403";
		}
		if(!user.getRole().equals("customer")){
			return "403";
		}
		String customerID=request.getParameter("customerID");
		List<Order>orderList=customerDao.getMyOrderHistory(customerID);
		model.addAttribute("orderList", orderList);
		if(orderList.size()==0)
		{
			return "NoOrderHistory";
		}
		return "orderHistory";
		
	}
	
	
}
