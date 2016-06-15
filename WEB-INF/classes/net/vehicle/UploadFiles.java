package net.vehicle;

import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javazoom.upload.*;


public class UploadFiles {
	
	public static String upload(HttpServletRequest req,String fileText){
		System.out.println ("In upload().....");
		String file="";
		try{
			if(MultipartFormDataRequest.isMultipartFormData(req)){	
				System.out.println ("in If.....");
				MultipartFormDataRequest mReq = new MultipartFormDataRequest(req);
				Hashtable files = mReq.getFiles();
				System.out.println ("Hashtable : "+files);
				if((files!=null) && (!files.isEmpty())){
					UploadFile uFile = (UploadFile)files.get(fileText);
					if(uFile!=null){
						file =uFile.getFileName();
						System.out.println ("File Name : "+file+"\n");
						UploadBean upBean = new UploadBean();
						upBean.setFolderstore(req.getRealPath("images"));
						upBean.store(mReq,fileText); 
					}
					
				}//if
				else {
					System.out.println ("No Uploaded Files");
				}
			}//if
			else {
				System.out.println ("Request is not MitliPart...");
			}
		}catch(Exception e){
			System.out.println ("Upload Exception :"+e);
		}
		return file;		
	}//upload
	
}//class 