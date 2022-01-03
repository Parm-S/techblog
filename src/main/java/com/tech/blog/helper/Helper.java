package com.tech.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class Helper {
	
	public static boolean deleteFile(String path)
	{
		boolean flag = false;
		try {
			File file = new File(path);
			flag = file.delete();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return flag;
	}
	
	public static boolean saveFile(InputStream is, String path)
	{
		boolean flag = false;
		try 
		{
			byte[] data = new byte[is.available()];
			is.read(data);
			FileOutputStream fos = new FileOutputStream(path);
			fos.write(data);
			fos.flush();
			fos.close();
			flag=true;
		}
		catch(Exception ex) 
		{
			ex.printStackTrace();
		}
		return flag;
	}

}
