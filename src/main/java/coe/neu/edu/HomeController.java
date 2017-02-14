package coe.neu.edu;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import coe.neu.edu.DAO.AdminDao;
import coe.neu.edu.DAO.CustomerDao;
import coe.neu.edu.DAO.OrderDao;
import coe.neu.edu.DAO.SupplierDao;
import coe.neu.edu.DAO.UserDao;
import coe.neu.edu.model.Customer;
//import coe.neu.edu.model.FileUpload;
import coe.neu.edu.model.Genre;
import coe.neu.edu.model.Order;
import coe.neu.edu.model.Supplier;
import coe.neu.edu.model.UserAccount;
import coe.neu.edu.model.UserRole;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@Autowired
	@Qualifier("homeValidator")
	private Validator validator;

	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private SupplierDao supplierDao;
	
	@Autowired
	private CustomerDao customerDao;
	
	@Autowired
	private OrderDao orderDao;
	
	/*
	 * This is to initialize webDataBinder,set its
	 * validator as we specify.
	 */
	@InitBinder
	private void initBinder (WebDataBinder binder1){
		binder1.setValidator(validator);
	}
	
	
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String initUserLoginForm(Locale locale, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		adminDao.checkAdminCreated();
		
		Cookie[] cookies = request.getCookies();     
		String userName = null;
		String password = null;

		boolean foundCookie = false;
		if(cookies!=null)
		{
			for(int i = 0; i < cookies.length; i++)
			{ 
				Cookie c = cookies[i];
				if (c.getName().equals("userid"))
					{
					userName = c.getValue();
					model.addAttribute("userName", userName);
					}
				if (c.getName().equals("pwd"))
					{
					password = c.getValue();
					model.addAttribute("password", password);
					}

//				User user = new User();
//				model.addAttribute("foundCookie",true);
				foundCookie = true;
				UserAccount u = userDao.queryUserByNameAndPassword(userName, password);
				if(u!=null){
					
					if(u.getRole().equals(UserRole.ROLE_ADMIN))
					{
						session.setAttribute("user", u);
						return "adminWorkArea";
					}
					
					if(u.getRole().equals(UserRole.ROLE_SUPPLIER))
					{
						//FileUpload fileUpload = new FileUpload();
						Supplier supplier = (Supplier)u.getPerson();
						String supplierName = supplier.getSupplierName();
						model.addAttribute("supplierName", supplierName);
						session.setAttribute("user", u);
						//model.addAttribute("file",fileUpload);
						return "supplierWorkArea";
					}
					
					if(u.getRole().equals(UserRole.ROLE_CUSTOMER))
					{
						List<Genre> listGenre = supplierDao.getListOfGenre();
						List<String> supplierList = customerDao.getSupplierList();
						model.addAttribute("supplierList", supplierList);
						model.addAttribute("listGenre", listGenre);
						model.addAttribute("userFName",u.getPerson().getFirstName());
						Customer customer=(Customer)u.getPerson();
						long customerID=customer.getPersonID();
						model.addAttribute("customerId",customerID);
						session.setAttribute("user", u);
						return "userHomePage";		
					}
					
					
//					model.addAttribute("user", u);
//					session.setAttribute("user", u);
//					return "userHomePage";
				}
				}
			UserAccount userAccount = new UserAccount();
			model.addAttribute("userAccount", userAccount);
			return "home";
			
//			return "userHomePage";
		}
		
//		if(!foundCookie){
		else{
			UserAccount userAccount = new UserAccount();
			model.addAttribute("userAccount", userAccount);
			model.addAttribute("foundCookie",false);
			return "home";
		}
		
		
	}
	
	
	@RequestMapping(value="login.do" ,method=RequestMethod.POST)
	public String submitForm(Model model, @Validated UserAccount user, BindingResult result, HttpSession session,HttpServletRequest request, HttpServletResponse response){
		model.addAttribute("userAccount",user);
		String returnVal = "userHomePage";
		if (result.hasErrors()){
			
			return "home";
		}else{
			try {
				UserAccount u = userDao.queryUserByNameAndPassword(user.getUsername(), user.getPassword());
				if (u != null){
					model.addAttribute("user", u);
					boolean remember_me_is_checked;
					if(request.getParameter("rememberMe")!=null)
					{
						remember_me_is_checked = true;
					if(remember_me_is_checked)
					{
					    Cookie c1 = new Cookie("userid", user.getUsername());
					    Cookie c2 = new Cookie("pwd", user.getPassword());
					    c1.setMaxAge(7*24*60*60);
					    c2.setMaxAge(7*24*60*60);
					    response.addCookie(c1);
					    response.addCookie(c2);
						}
					}
					
					if(u.getRole().equals(UserRole.ROLE_ADMIN))
					{
						session.setAttribute("user", u);
						return "adminWorkArea";
					}
					
					if(u.getRole().equals(UserRole.ROLE_SUPPLIER))
					{
					
						Supplier supplier = (Supplier)u.getPerson();
						String supplierName = supplier.getSupplierName();
						model.addAttribute("supplierName", supplierName);
						
						
						List<Genre> listGenre = supplierDao.getListOfGenre();
						model.addAttribute("listGenre", listGenre);
						session.setAttribute("user", u);
						return "supplierWorkArea";
					}
					
					if(u.getRole().equals(UserRole.ROLE_CUSTOMER))
					{
						List<Genre> listGenre = supplierDao.getListOfGenre();
						List<String> supplierList = customerDao.getSupplierList();
						model.addAttribute("supplierList", supplierList);
						model.addAttribute("listGenre", listGenre);
						model.addAttribute("userFName",u.getPerson().getFirstName());
						Customer customer=(Customer)u.getPerson();
						long customerID=customer.getPersonID();
						model.addAttribute("customerId",customerID);
						session.setAttribute("user", u);
						return "userHomePage";		

					
					}
				}
				else return "home";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return "home";
		
}
	
	
	@RequestMapping(value="checkforusername.do", method=RequestMethod.POST)
	public void checkUserName(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String username = request.getHeader("username");
		
		PrintWriter out = response.getWriter();
		boolean b = userDao.checkUserName(username);
		if(b)
			out.print("true");
		else
			out.print("false");
	}
	
	
	@RequestMapping(value="goToSignUp.do")
	public String gotToSignUpPage()
	{
	return "signUp";	
	}
	
	@RequestMapping (value="signup.do", method=RequestMethod.POST)
	public String signUpUser(Model model, HttpServletRequest request, HttpSession session) throws Exception
	{
		Customer customer = new Customer();
		customer.setFirstName(request.getParameter("firstName"));
		customer.setLastName(request.getParameter("lastName"));
		customer.setAddress(request.getParameter("address"));
		customer.setDateOfBirth(request.getParameter("dateOfBirth"));
		customer.setEmail(request.getParameter("email"));
		customer.setGender(request.getParameter("gender"));
		customer.setPhoneNo(Long.parseLong(request.getParameter("phoneNo")));
		
		UserAccount userAccount = new UserAccount();
		userAccount.setUsername(request.getParameter("username"));
		userAccount.setPassword(request.getParameter("password"));
		userAccount.setRole(UserRole.ROLE_CUSTOMER);
		
		userAccount.setPerson(customer);
		
		userDao.addCustomerToDb(userAccount);
		List<Genre> listGenre = supplierDao.getListOfGenre();
		model.addAttribute("listGenre", listGenre);
		
		UserAccount u = userDao.queryUserByNameAndPassword(userAccount.getUsername(), userAccount.getPassword());
		
		if((u!=null) && (u.getRole()=="customer")){
		model.addAttribute("customerId", u.getPerson().getPersonID());
		}
		model.addAttribute("userFName",request.getParameter("firstName"));
		session.setAttribute("user", userAccount);
		model.addAttribute("user",userAccount);

		return "userHomePage";
		
//		Locale locale=null;
//		String result=initUserLoginForm(locale, model, request, session);
//		
//		return result;
	}
	

//	@RequestMapping(value="addMusicToCategory.do", method=RequestMethod.POST)
//	public String addMusicToGenre(HttpServletRequest request) throws Exception
//	{
//		String selectedGenre = request.getParameter("selectedGenre");
//		String name = request.getParameter("name");
//		String desc = request.getParameter("description");
//		Float price = Float.parseFloat(request.getParameter("price"));
//		int quantity = Integer.parseInt(request.getParameter("quantity"));
//		String path = request.getParameter("upload");
//		//UPLOAD PICTURE CODE//
//		String sample = "sample hai ye";
//		//UPLOAD MUSIC SAMPLE//
//		
//				
//
//				
//		supplierDao.addMusicToDb(selectedGenre, name, price, quantity, desc, path, sample);
//		return "musicAdded";
//	}
	
	
	
	
	@RequestMapping(value="addSupplier.do", method=RequestMethod.POST)
	public String RegisterMusicProducer(Model model, HttpServletResponse response, HttpServletRequest request, HttpSession session) throws Exception{
		
		UserAccount user = (UserAccount)session.getAttribute("user");
		if(user==null){
			return "403";
		}
		if(!user.getRole().equals("admin")){
			return "403";
		}
			Supplier supplier = new Supplier();
			String firstname= request.getParameter("firstname");
			String lastname = request.getParameter("lastname");
			
			String username=request.getParameter("username");
			String password = request.getParameter("password");
			
						
			adminDao.addSupplierToDb(firstname, lastname, username, password);
			
			return "supplierAdded";
	}
	
	@RequestMapping(value="addGenre.do", method=RequestMethod.POST)
	public String addGenreToDb(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
	UserAccount user = (UserAccount)session.getAttribute("user");
	if(user==null){
		return "403";
	}
	if(!user.getRole().equals("admin")){
		return "403";
	}
	{
		String newGenre = request.getParameter("newGenre");
		
		Genre genre = new Genre();
		genre.setName(newGenre);
		adminDao.addGenreToDb(genre);
		
		return "genreAdded";
	}}
	
	@RequestMapping(value = "checkPassword.do", method = RequestMethod.POST)
	public void verifyPassword(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException{
		PrintWriter out = response.getWriter();
		UserAccount userAccount = (UserAccount)session.getAttribute("user");
		
		String userName = userAccount.getUsername();
		
		String oldPassword = request.getHeader("oldPassword");

		if(userDao.queryByPassword(userName, oldPassword)){	
			out.print("true");
		}else{
			out.print("false");
		}
	}
	
	@RequestMapping(value = "changePassword.do", method = RequestMethod.POST)
	public String updatePassword(HttpServletRequest request, HttpSession session){
		UserAccount userAccount = (UserAccount)session.getAttribute("user");
		long id = userAccount.getUserID();
		String newPassword = request.getParameter("newPwdTF");
		userDao.updatePassword(id, newPassword);
		return "passwordSuccessful";		
	}
	

	@RequestMapping(value="goToHome.do", method=RequestMethod.GET)
	public String goToHomePage(HttpSession session, Model model) throws Exception{
		
		UserAccount u = (UserAccount)session.getAttribute("user");
		List<Genre> genreList = supplierDao.getListOfGenre();
		model.addAttribute("listGenre", genreList);
		
		List<String> supplierList = customerDao.getSupplierList();
		model.addAttribute("supplierList", supplierList);
		
		Customer customer=(Customer)u.getPerson();
		long customerID=customer.getPersonID();
		model.addAttribute("customerId",customerID);
		
		return "userHomePage";
		
	}
	
	@RequestMapping(value="logMeOut.do", method=RequestMethod.GET)
	public void logout(HttpSession session, HttpServletResponse response) throws IOException{
		session.removeAttribute("user");
		Cookie c1 = new Cookie("userid", null);
		Cookie c2 = new Cookie("pwd", null);
		c1.setMaxAge(0);
		c2.setMaxAge(0);
		response.addCookie(c1);
		response.addCookie(c2);
		response.sendRedirect("");
	}
	
	@RequestMapping(value="goToSupplierHome.do", method=RequestMethod.GET)
	public String goToSupplierHomePage(HttpSession session, Model model) throws Exception
	{
		UserAccount u = (UserAccount)session.getAttribute("user");

		Supplier supplier = (Supplier)u.getPerson();
		String supplierName = supplier.getSupplierName();
		model.addAttribute("supplierName", supplierName);
		
		List<Genre> listGenre = supplierDao.getListOfGenre();
		model.addAttribute("listGenre", listGenre);
		session.setAttribute("user", u);
		return "supplierWorkArea";
		
	}
	
	@RequestMapping(value="goToAdminHome.do", method=RequestMethod.GET)
	public String goToAdminHomePage(HttpSession session, Model model) throws Exception
	{
		UserAccount u = (UserAccount)session.getAttribute("user");

		session.setAttribute("user", u);
		return "adminWorkArea";
		
	}
	
}



