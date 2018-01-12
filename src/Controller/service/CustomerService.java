package Controller.service;

import java.util.Date;
import java.util.List;

import Model.Dao.CustomerDao;
import Model.Dao.UserDao;
import Model.DaoImpl.UserOperation;
import Model.DaoImpl.customerOperation;
import Model.entities.Goods;
import Model.entities.Order;

public class CustomerService {
	
	public List<Goods> viewGoodslist(){
	
		UserOperation u=new UserDao();
		List<Goods> goodslist=u.viewGoodslist();
		
		return goodslist;
	}
	public Goods viewGooddetail(String goodid) {
		
		UserOperation u=new UserDao();
		Goods good=u.Gooddetail(goodid);
		return good;
	}
	public void createOrder(String orderid, String sellerid, String Customerid, List<Goods> goodslist, String status,Date date) {
		customerOperation custs=new CustomerDao();
		custs.createorder( orderid, sellerid,Customerid, goodslist, status, date);
	}
	public List<Order> ViewOrders(String role,String userid){
		UserOperation u=new UserDao();
		List<Order> orderlist=u.vieworderlist(role, userid);
		return orderlist;
	}
	public void payforOrder(String orderid) {
		customerOperation custO=new CustomerDao();
		custO.makePayment(orderid);
		
	}
	public void cancelOrder(String orderid) {
		UserOperation userO=new UserDao();
		userO.cancelOrder(orderid);
	}

	
}
