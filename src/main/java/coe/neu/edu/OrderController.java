package coe.neu.edu;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import coe.neu.edu.DAO.OrderDao;
import coe.neu.edu.model.Order;
import coe.neu.edu.model.Payment;
import coe.neu.edu.model.UserAccount;

@Controller
public class OrderController {
	@Autowired
	private OrderDao orderDao;

	@RequestMapping(value = "addToCart.do", method = RequestMethod.POST)
	public String addMusicToCart(Model model, HttpServletRequest request, HttpSession session, HttpServletResponse response) throws IOException {
		
		UserAccount user = (UserAccount)session.getAttribute("user");
		if(user==null){
			return "403";
		}
		if(!user.getRole().equals("customer")){
			return "403";
		}
		long musicID = Long.parseLong(request.getParameter("musicId"));
		int musicQuantity = Integer.parseInt(request.getParameter("quantity"));
		Order customerOrder = orderDao.addMusicToCart(musicID, musicQuantity,
				session);
		model.addAttribute("cart", customerOrder);
		return "AddToCart";
	}

	@RequestMapping(value = "deleteOrderItem.do", method = RequestMethod.GET)
	public String deleteOrderItemFromCart(Model model, HttpSession session, HttpServletResponse response,
			HttpServletRequest request) throws IOException {
		// HttpSession session=request.getSession();
		UserAccount user = (UserAccount)session.getAttribute("user");
		if(user==null){
			return "403";
		}
		if(!user.getRole().equals("customer")){
			return "403";
		}
		
		long orderItemID = Long.parseLong(request.getParameter("orderItemid"));
		long orderID = Long.parseLong(request.getParameter("orderID"));
		Order customerOrder = orderDao.deleteOrderItem(orderItemID, orderID);
		model.addAttribute("cart", customerOrder);
		return "AddToCart";
	}

	@RequestMapping(value = "proceedToPayment.do", method = RequestMethod.POST)
	public String proceedForPayment(HttpServletRequest request, Model model, HttpSession session, HttpServletResponse response) throws IOException {
		
		UserAccount user = (UserAccount)session.getAttribute("user");
		if(user==null){
			return "403";
		}
		if(!user.getRole().equals("customer")){
			return "403";
		}
		String orderId = request.getParameter("orderId");
		String orderTotal = request.getParameter("orderTotal");
		if(orderTotal=="0.0")
		{
			return null;
		}
		model.addAttribute("orderId", orderId);
		if (orderDao.checkOrderForPayment(orderId)) {
			String result = orderDao.checkForQuantity(orderId);
			if (result.equals("true")) {
				return "makePayment";
			} else {
				model.addAttribute("productNotAvailable", result);
				return "NotSufficientQuantity";
			}
		} else {
			return "cannotPayAgain";
		}

	}

	@RequestMapping(value = "quantityCheck.do", method = RequestMethod.POST)
	public void checkQuantity(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		if(request.getHeader("quantity")==""){
			out.print("false");
		}
		int quantity = Integer.parseInt(request.getHeader("quantity"));
		String musicId = request.getHeader("musicId");
		
		if (quantity <= 0) {
			out.print("false");
		} else if (orderDao.checkQuantity(musicId, quantity)) {
			out.print("true");
		} else {
			out.print("false");
		}
	}

	@RequestMapping(value = "makePayment.do", method = RequestMethod.POST)
	public String makePayement(HttpServletRequest request, Model model, HttpSession session, HttpServletResponse response) throws IOException {
		
		UserAccount user = (UserAccount)session.getAttribute("user");
		if(user==null){
			return "403";
		}
		if(!user.getRole().equals("customer")){
			return "403";
		}
		String orderId = request.getParameter("orderId");
		
		if (orderDao.checkOrderForPayment(orderId)) {
			String name = request.getParameter("name");
			String[] card = request.getParameterValues("cardNumber");
			String cardNumber = "";
			for (String c : card) {
				cardNumber = cardNumber + c;
			}
			String month = request.getParameter("month");
			String year = request.getParameter("year");

			String date = year + "/" + month;
			int cvv = Integer.parseInt(request.getParameter("cvv"));

			Payment payment = new Payment();
			payment.setCvv(cvv);
			payment.setDate(date);
			payment.setNumber(cardNumber);
			payment.setNameOnCard(name);
			orderDao.makePayment(payment, orderId);

			String paymentId = String.valueOf(payment.getPaymentId());
			model.addAttribute("paymentId", paymentId);
			model.addAttribute("orderId", orderId);
			
			return "paymentDone";
		} else {
			return "cannotPayAgain";
		}
	}

	@RequestMapping(value = "viewPdf.do", method = RequestMethod.GET)
	public ModelAndView generatPdf(Locale locale, ModelMap model,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String orderId = request.getParameter("orderId");
		String paymentId = request.getParameter("paymentId");

		Order order = (Order)orderDao.getOrderObj(orderId);
		model.addAttribute("order", order);
		
		Payment payment = (Payment)orderDao.getPaymentObj(paymentId);
		model.addAttribute("payment", payment);
		
		float orderTotal = order.getOrderTotal();
		model.addAttribute("total", orderTotal);

		return new ModelAndView(new PDFView(), model);
	}

	
	@RequestMapping(value="viewCart.do")
	public String viewMyCart(HttpSession session, Model model, HttpServletResponse response) throws IOException{
		UserAccount user = (UserAccount)session.getAttribute("user");
		if(user==null){
			return "403";
		}
		if(!user.getRole().equals("customer")){
			return "403";
		}
		String personId = String.valueOf(user.getPerson().getPersonID());
		Order cart = orderDao.getMyOrder(personId);
		model.addAttribute("cart", cart);
		return "AddToCart";
	}

}
