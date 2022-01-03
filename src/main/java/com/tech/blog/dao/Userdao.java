package com.tech.blog.dao;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.tech.blog.entities.User;
import com.tech.blog.helper.HibernateUtil;

public class Userdao {
	
	
	public boolean saveUser(User user) {
		Transaction transaction = null;
		SessionFactory sf =  HibernateUtil.getSessionFactory();
		try {
			Session session = sf.openSession();
			transaction = session.beginTransaction();
			session.save(user);
			transaction.commit();
			session.close();
			return true;
		}catch(Exception ex)
		{
			if(transaction!=null)
			{
				transaction.rollback();
			}
			ex.printStackTrace();
			return false;
		}
	}
	
	public User getUserByEmailAndPassword(String email, String password)
	{
		User user = null;
		try {
			SessionFactory sf =  HibernateUtil.getSessionFactory();
			String query = "from User where email =: e and password =: p";
			Session session = sf.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery(query);
			q.setParameter("e", email);
			q.setParameter("p", password);
			
			user = (User) q.uniqueResult();
			transaction.commit();
			session.close();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return user;
		
	}
	
	public boolean updateUser(User user)
	{
		Transaction transaction = null;
		boolean flag = false;
		try 
		{
			SessionFactory sf =  HibernateUtil.getSessionFactory();
			
			Session session = sf.openSession();
			 transaction = session.beginTransaction();
			session.update(user);
			transaction.commit();
			session.close();
			 flag = true;
		}
		catch(Exception ex)
		{
			if(transaction != null)
			{
				transaction.rollback();
			}
			ex.printStackTrace();
		}
		return flag;
	}
	
	public User getUserByUserId(int userId)
	{
		User user= null;
		try {
			SessionFactory sf =  HibernateUtil.getSessionFactory();
			String query = "from User where userid =:ui";
			Session session = sf.openSession();
			Transaction transaction = session.beginTransaction();
			Query q = session.createQuery(query);
			q.setParameter("ui" , userId);
		
			user = (User) q.uniqueResult();
			transaction.commit();
			session.close();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		
		return user;
	}

}
