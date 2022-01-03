package com.tech.blog.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.tech.blog.entities.Like;
import com.tech.blog.helper.HibernateUtil;

public class LikeDao {
	
	public boolean insertLike(int pid, int uid)
	{
		boolean flag=false;
		try {
			SessionFactory sf = HibernateUtil.getSessionFactory();
			Session session = sf.openSession();
			Transaction transaction = session.beginTransaction();
			String hql = "INSERT INTO Like (post,user) " +
				                "SELECT post,user FROM Like";
			Query query = session.createQuery(hql);
		
			 query.executeUpdate();
			transaction.commit();
			session.close();
			return flag=true;
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return flag;
	}
	public int countLikeOnPost(int pid)
	{
		int count=0;
		try {
			SessionFactory sf = HibernateUtil.getSessionFactory();
			Session session = sf.openSession();
			Transaction transaction = session.beginTransaction();
			String hql = "SELECT count(*) FROM Like where pid =:pi";
			Query query = session.createQuery(hql);
			query.setParameter("pi", pid);
			count= (Integer) query.uniqueResult();
			transaction.commit();
			session.close();
			
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return count;
	}
	public boolean isLikedByUser(int pid,int uid)
	{
		boolean flag=false;
		try {
			SessionFactory sf = HibernateUtil.getSessionFactory();
			Session session = sf.openSession();
			Transaction transaction = session.beginTransaction();
			String hql = "SELECT * FROM Like where pid =:pi and uid =: ui";
			Query query = session.createQuery(hql);
			query.setParameter("pi", pid);
			query.setParameter("ui", uid);
			int set= (Integer) query.uniqueResult();
			
			transaction.commit();
			session.close();
			if(set!=0)
			{
				return flag=true;
			}
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		return flag;
	}
 
}
