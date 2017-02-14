package coe.neu.edu.DAO;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;

import coe.neu.edu.model.Customer;
import coe.neu.edu.model.Music;
import coe.neu.edu.model.Order;
import coe.neu.edu.model.OrderItem;
import coe.neu.edu.model.Payment;
import coe.neu.edu.model.UserAccount;

public class OrderDao extends DAO {

	// public Order addMusicToCart(long musicID,int quantity)
	// {
	// Session session = getSession();
	// session.beginTransaction();
	// Query q = session.createQuery("from Music where musicId = :musicID");
	// q.setString("musicID", String.valueOf(musicID));
	// Music selectedMusic=(Music)q.list().get(0);
	//
	// OrderItem orderItem=new OrderItem();
	// orderItem.setMusic(selectedMusic);
	// orderItem.setQuantity(quantity);
	//
	// Order placedOrder=new Order();
	// placedOrder.getOrderItem().add(orderItem);
	// placedOrder.setOrderStatus("current");
	//
	// session.save(placedOrder);
	// return placedOrder;
	//
	// }

	public Order addMusicToCart(long ProductID, int quantity,
			HttpSession httpSession) {
		Session session = getSession();
		session.beginTransaction();
		Query q = session.createQuery("from Music where musicId = :productID");
		q.setString("productID", String.valueOf(ProductID));
		Music selectedMusic = (Music) q.uniqueResult();

		OrderItem orderItem = new OrderItem();
		orderItem.setMusic(selectedMusic);
		orderItem.setQuantity(quantity);
		orderItem.setTotalCost(quantity * selectedMusic.getPrice());

		UserAccount user = (UserAccount) httpSession.getAttribute("user");
		Customer customer = (Customer) user.getPerson();
		String personId = String.valueOf(customer.getPersonID());

		Query q1 = session.createQuery("from Order where personId = :personId");
		q1.setString("personId", personId);

		List<Order> orders = q1.list();
		boolean b = true;
		for (Order o : orders) {
			if (o.getOrderStatus().equals("current")) {

				for (OrderItem oItem : o.getOrderItem()) {
					if (oItem.getMusic().equals(selectedMusic)) {
						int newQuantity = oItem.getQuantity() + quantity;
						oItem.setQuantity(newQuantity);

						oItem.setTotalCost(selectedMusic.getPrice()
								* newQuantity);
						o.setOrderTotal(selectedMusic.getPrice() * quantity);

						session.save(oItem);
						session.save(o);
						session.getTransaction().commit();

						session.close();
						b = false;
						return o;
					}
				}

				o.getOrderItem().add(orderItem);
				orderItem.setOrder(o);
				o.setOrderTotal(orderItem.getTotalCost());

				session.save(orderItem);
				session.save(o);
				// session.save(customer);
				session.getTransaction().commit();
				session.close();
				b = false;
				return o;
			}
		}

		if (b) {
			Order placedOrder = new Order();
			placedOrder.getOrderItem().add(orderItem);
			placedOrder.setOrderStatus("current");
			placedOrder.setCustomer(customer);
			placedOrder.setOrderTotal(orderItem.getTotalCost());

			session.save(placedOrder);
			customer.getOrder().add(placedOrder);
			session.save(customer);

			orderItem.setOrder(placedOrder);
			session.save(orderItem);
			session.save(placedOrder);
			session.getTransaction().commit();
			session.close();
			return placedOrder;
		}
		return null;

	}

	public Order deleteOrderItem(long orderItemID, long orderID) {
		Session session = getSession();
		session.beginTransaction();

		Query q1 = session.createQuery("from Order where orderId=:orderID");
		q1.setString("orderID", String.valueOf(orderID));
		Order dbOrder = (Order) q1.uniqueResult();

		Query q2 = session
				.createQuery("from OrderItem where orderItemId = :orderItemID");
		q2.setString("orderItemID", String.valueOf(orderItemID));
		OrderItem dbOrderItem = (OrderItem) q2.uniqueResult();

		dbOrder.getOrderItem().remove(dbOrderItem);
		dbOrder.setOrderTotal(-1 * dbOrderItem.getTotalCost());

		session.save(dbOrder);
		Query q = session
				.createQuery("delete OrderItem where orderItemId = :orderItemID");
		q.setString("orderItemID", String.valueOf(orderItemID));
		q.executeUpdate();

		session.getTransaction().commit();
		session.close();
		return dbOrder;
	}

	public void makePayment(Payment payment, String orderId) {
		Session session = getSession();
		session.beginTransaction();
		Query q = session.createQuery("from Order where orderId = :orderId");
		q.setString("orderId", orderId);
		Order order = (Order) q.uniqueResult();
		order.setOrderStatus("paid");
		payment.setOrder(order);
		order.setPayment(payment);
		for (OrderItem oi : order.getOrderItem()) {
			int oldQuantity = oi.getMusic().getQuantity();
			int newQuantity = oldQuantity - oi.getQuantity();
			oi.getMusic().setQuantity(newQuantity);
		}
		session.save(order);
		session.save(payment);
		session.getTransaction().commit();
		session.close();
	}

	public boolean checkOrderForPayment(String orderId) {
		Session session = getSession();
		session.beginTransaction();
		Query q = session.createQuery("from Order where orderId = :orderId");
		q.setString("orderId", orderId);
		Order order = (Order) q.uniqueResult();
		if (order.getOrderStatus().equals("current")) {
			return true;
		} else {
			return false;
		}

	}

	public boolean checkQuantity(String musicId, int quantity) {
		Session session = getSession();
		session.beginTransaction();
		Query q = session.createQuery("from Music where musicId = :musicId");
		q.setString("musicId", musicId);
		Music music = (Music) q.uniqueResult();
		if (quantity <= music.getQuantity()) {
			return true;
		}
		if (String.valueOf(quantity) == "") {
			return false;
		} else {
			return false;
		}

	}

	public boolean checkPaymentStatusOfOrder(String orderId) {
		Session session = getSession();
		session.beginTransaction();
		Query q = session.createQuery("from Order where orderId = :orderId");
		q.setString("orderId", orderId);
		Order order = (Order) q.uniqueResult();
		if (order.getOrderStatus().equals("current")) {
			return true;
		} else {
			return false;
		}

	}

	public String checkForQuantity(String orderId) {
		Session session = getSession();
		session.beginTransaction();
		Query q = session.createQuery("from Order where orderId = :orderId");
		q.setString("orderId", orderId);
		Order order = (Order) q.uniqueResult();

		String result = " ";

		for (OrderItem oi : order.getOrderItem()) {
			if (oi.getQuantity() > oi.getMusic().getQuantity()) {
				result = result + oi.getMusic().getName();
			}
		}
		if (result.equals(" ")) {
			return "true";
		} else {
			return result;
		}
	}

	public Order getOrderObj(String orderID) {
		Session session = getSession();
		session.beginTransaction();

		Query q1 = session.createQuery("from Order where orderId=:orderID");
		q1.setString("orderID", orderID);
		Order orderObj = (Order) q1.uniqueResult();

		session.getTransaction().commit();
		session.close();
		return orderObj;
		

	}

	public Order getMyOrder(String personId) {

		Session session = getSession();
		session.beginTransaction();
		Query q1 = session
				.createQuery("from Order where customer =:personID and orderStatus = :orderStatus");
		q1.setString("personID", personId);
		q1.setString("orderStatus", "current");
		Order orderObj = (Order) q1.uniqueResult();

		session.getTransaction().commit();
		session.close();
		return orderObj;

	}

	public Payment getPaymentObj(String paymentID) {
		Session session = getSession();
		session.beginTransaction();

		Query q1 = session.createQuery("from Payment where paymentId=:orderID");
		q1.setString("orderID", paymentID);
		Payment paymentObj = (Payment) q1.uniqueResult();

		session.close();
		return paymentObj;

	}

}
