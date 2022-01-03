package com.tech.blog.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.HibernateUtil;

public class PostDao {

     public ArrayList<Category> getAllCategories(){
    	 ArrayList<Category> list = null;
    	 try 
    	 {
    		 SessionFactory sf = HibernateUtil.getSessionFactory();
    		 Session session = sf.openSession();
    		 Transaction transaction = session.beginTransaction();
    		 list = (ArrayList<Category>) session.createQuery("from Category").list();
    		 transaction.commit();
    		 session.close();
    	 }
    	 catch(Exception ex) 
    	 {
    		 ex.printStackTrace();
    	 }
    	 return list;
     }
     public boolean savePost(Post p)
     {
    	 boolean flag=false;
    	 Transaction transaction=null;
    	 try 
    	 {
    		 SessionFactory sf = HibernateUtil.getSessionFactory();
    		 Session session =sf.openSession();
    		  transaction = session.beginTransaction();
    		  session.save(p);
    		 transaction.commit();
    		 session.close();
    		 return flag=true;
    	 }
    	 catch(Exception ex) 
    	 {
    		 if(transaction!=null)
 			{
 				transaction.rollback();
 			}
    		 ex.printStackTrace();
    	 }
    	 return flag;
     }
     //get all the post
     public List<Post> getAllPosts()
     {
    	 List<Post> list = new  ArrayList<Post>();
    	 // fetch all the post
    	 try {
    		 SessionFactory sf = HibernateUtil.getSessionFactory();
    		 Session session = sf.openSession();
    		 Transaction transaction = session.beginTransaction();
    		 list = (ArrayList<Post>) session.createQuery("from Post order by pid desc").list();
    		 transaction.commit();
    		 session.close();
    	 }
    	 catch(Exception ex) {
    		 ex.printStackTrace();
    	 }
    	 
    	 return list;
     }
     // get post by category id
     public List<Post> getPostByCatId(int catId)
     {
    	 List<Post> list = new  ArrayList<Post>();
    	 // fetch all the post by category id
    	 try {
    		 SessionFactory sf = HibernateUtil.getSessionFactory();
    		 Session session = sf.openSession();
    		 Transaction transaction = session.beginTransaction();
    		 Query query = session.createQuery("from Post where pcategory =:pc  ");
    		 query.setParameter("pc", catId);
    		 list = query.list();
    		 transaction.commit();
    		 session.close();
    	 }
    	 catch(Exception ex) {
    		 ex.printStackTrace();
    	 }
    	 
    	 return list;
    	 
     }
     public Post getPostByPostId(int postId)
     {
    	 Post post=null;
    	 try {
    		 SessionFactory sf = HibernateUtil.getSessionFactory();
    		 Session session = sf.openSession();
    		 Transaction transaction = session.beginTransaction();
    		 Query query = session.createQuery("from Post where pid =:pi  ");
    		 query.setParameter("pi", postId);
    		 post = (Post) query.uniqueResult();
    		 transaction.commit();
    		 session.close();
    	 }
    	 catch(Exception ex) {
    		 ex.printStackTrace();
    	 } 
    	 return post; 
     }
}
