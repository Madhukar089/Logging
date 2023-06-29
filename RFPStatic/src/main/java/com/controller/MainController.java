package com.controller;



import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
public class MainController {

	@RequestMapping(value = "dashboard")
	public String getDashBoard() {
		return "Dashboard";
	}

	@RequestMapping(value = "/")
	public String adminLogin() {
		return "login";
	}

	@RequestMapping(value = "login")
	public String login() {
		return "login";
	}

	@RequestMapping(value = "maindash")
	public String getMainDash() {
		return "maindash";
	}

	@RequestMapping(value = "adminUsers")
	public String getActiveEnquiries() {

		return "adminUsers";
	}
	@RequestMapping(value = "accClosed")
	public String getClosedAccs() {
		return "accClosed";
	}

	@RequestMapping(value = "createAcc")
	public String createAcc() {
		return "createAcc";
	}

	@RequestMapping(value = "logout1")
	public String logout() {
		return "logout";
	}

	@RequestMapping(value = "pipeline")
	public String getPipeline() {
		return "EnqForPipeline";
	}

	@RequestMapping(value = "RFPs")
	public String getRFPs(Model model) {
		return "RFPs";
	}

	@RequestMapping(value = "Enquiries")
	public String getEnquiries(Model model) {
		return "Enquiries";
	}

	@RequestMapping(value = "Customers")
	public String getCustomers(Model model) {
		return "Customers";
	}

	@RequestMapping(value = "Signup")
	public String signUpnewAdminUser() {
		return "newadminsucessmessage";
	}

	@RequestMapping(value = "profile")
	public String getProfile() {
		return "profile";
	}

	@RequestMapping(value = "passwordReset")
	public String ChangePw(Model model) {
		return "passwordReset";
	}
	@RequestMapping(value = "home")
	public String CustomerHome(Model model) {
		return "home";
	}
	
	@RequestMapping("docform1")
	public String getForComm() {
		return "upload";
	}
	@RequestMapping(value = "uploading", method = RequestMethod.POST)
	public String handleFileUpload(@RequestParam("file") CommonsMultipartFile file,HttpServletRequest req) {
	    try {
	        System.out.println(file.getOriginalFilename());
	        
	        System.out.println(file.getContentType());

	        System.out.println(file.getName());

	        System.out.println(file.getSize());

	        byte[] bytes = file.getBytes();
	        System.out.println(bytes);
	        String path = req.getServletContext().getRealPath("/")+"WEB-INF"+File.separator+"resources"
	        +File.separator+"uploads"+File.separator+file.getOriginalFilename();
	        System.out.println(path);
	       
	        try {
	        	FileOutputStream fos = new FileOutputStream(path);
	        	fos.write(bytes);
	        	fos.close();
	        	System.out.println("File uploaded successfully");
	        }catch(Exception e){
	        	
	        }
	        
	        return "success";
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "error";
	    }
	}

	@RequestMapping(value = "showFile", method = RequestMethod.GET)
	public void showFile(@RequestParam("filename") String filename,HttpServletRequest request, HttpServletResponse response) {
	    try {
	        String filePath = request.getServletContext().getRealPath("/") + "WEB-INF" + File.separator + "resources"
	                + File.separator + "uploads" + File.separator + filename;

	        File file = new File(filePath);

	        if (file.exists()) {
	            String contentType = request.getServletContext().getMimeType(filename);
	            response.setContentType(contentType);
	            response.setHeader("Content-Disposition", "inline; filename=\"" + filename + "\"");

	            InputStream inputStream = new BufferedInputStream(new FileInputStream(file));
	            OutputStream outputStream = response.getOutputStream();

	            byte[] buffer = new byte[1024];
	            int bytesRead;
	            while ((bytesRead = inputStream.read(buffer)) != -1) {
	                outputStream.write(buffer, 0, bytesRead);
	            }

	            inputStream.close();
	            outputStream.flush();
	            outputStream.close();
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

}