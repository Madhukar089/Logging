package main.java.com.controller;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.validation.Valid;
import main.java.com.models.*;
import main.java.com.services.EmailService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import main.java.com.dao.EnqDAOIn;
import com.fasterxml.jackson.core.type.TypeReference;



@Controller
@SessionAttributes("requestModel")
public class DynamicController {
	
	@Autowired
	private EnqDAOIn edao;

	@Autowired
    private EmailService emailService;
	
	private final CustomObjectMapperWrapper customObjectMapperWrapper;

    @Autowired
    public DynamicController(CustomObjectMapperWrapper customObjectMapperWrapper) {
        this.customObjectMapperWrapper = customObjectMapperWrapper;
    }
	
	
	@RequestMapping(value = "/Enquiries")
	public String getlist(Model model) {

		List<Enquiries> enq = edao.getAllEnquiries();
		model.addAttribute("enqdata", enq);

		return "Enquiries";
	}
	
	@RequestMapping(value = "/dashboard")
	public String getHome(Model model) {
		return "Dashboard";
	}
	
	@RequestMapping(value = "/pipeline")
	public String getPipeline(Model model) {
		
		//List<ReferenceModel> rm = edao.getEnquiryStatusList();
		//System.out.println(rm);
	    // Set the POJO as a model attribute
	    //model.addAttribute("myData", rm);
		return "pipelineView";
	}
	

	@RequestMapping(value = "/request", method = RequestMethod.POST)
	public String handleForm2Submission(@ModelAttribute("requestFormModel") RequestFormModel requestFormModel,Model model, HttpSession session) {
		
		
		List<TrackerEnquiryFieldsDataModel> customerResponse = edao.getCustomerResponseByNo(requestFormModel.getEnqId());
		model.addAttribute("enquiryDetails", requestFormModel);
		model.addAttribute("CustomerResponse",customerResponse);
		
		session.setAttribute("requestModel", requestFormModel);
		
		return "enquiryDetails";
	}

	@RequestMapping(value = "/updateEnquiry", method = RequestMethod.POST, consumes = "application/json")
	public ResponseEntity<String> updateEnquiryFields(@RequestBody String enquiryData, HttpSession session) {
		
		RequestFormModel requestFormModel = (RequestFormModel) session.getAttribute("requestModel");
		
		int iterId = edao.CreateEnquiryIterations(requestFormModel);
		
		String custMail = edao.getCustomerEmail(requestFormModel);
		
		String formIdentifier = generateUUID();
		try {

	        List<TrackerEnqFieldsUtilityModel> trackerEnqFieldsUtilityModel = customObjectMapperWrapper.readValue(enquiryData, new TypeReference<List<TrackerEnqFieldsUtilityModel>>() {});
	        
	        System.out.println(trackerEnqFieldsUtilityModel.toString());
	        
	        for(TrackerEnqFieldsUtilityModel tefum:trackerEnqFieldsUtilityModel) {
	        	edao.createtrackerFormDetails(tefum, formIdentifier, iterId);
	        }
	        
	        String to = custMail;
	        String subject = "Action needed";

	        emailService.sendEmail(to, subject, formIdentifier);
	        
	        return ResponseEntity.ok("Email sent successfully");
	    } catch (Exception e) {
	        e.printStackTrace();
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error updating data");
	    }
		
	}

	@RequestMapping(value="/suspecious", method = RequestMethod.GET)
	public String showSuccessPage(@RequestParam("formIdentifier") String formIdentifier, Model model) {
		
		model.addAttribute("formIdentifier", formIdentifier);
		return "suspecious";
		
	}

	@GetMapping("form-page/{formIdentifier}")
	public String showDynamicForm(@PathVariable("formIdentifier") String formIdentifier, Model model) {

		List<TrackerEnqFieldsModel> fields = edao.getTrackerFieldData(formIdentifier);		
		model.addAttribute("formData", fields);
		
		return "form-page";
	}

	@PostMapping("/submitting")
	public ResponseEntity<String> submitForm(@RequestBody DynamicFormModel dynamicFormModel) {
		
		edao.createCustomerFormDetails(dynamicFormModel);
	    return ResponseEntity.ok("Form submitted successfully!");
	    
	}

	private String generateUUID() {
		return UUID.randomUUID().toString();
	}
	
	@RequestMapping("finalComm")
	public String getFormRfpr() {
		int rfpr=23;
		return "redirect:formfor?rfpr="+rfpr;
	}
	@RequestMapping("formfor")
	public String getFormForComm() {
		return "FormForComm";
	}
	
	@PostMapping("/your-controller-url")
    public ResponseEntity<String> handleFormSubmission(@Valid @RequestBody CommunicationData data, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            // Handle validation errors
            return ResponseEntity.badRequest().body("Validation error");
        }

        // Process the form data
        System.out.println(data);
        // Return a success response
        return ResponseEntity.ok("Form submitted successfully");
    }
	
	@PostMapping("/your-approve-controller-url")
    public ResponseEntity<String> handleApproveAction(@Valid @RequestBody CommunicationData data, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            // Handle validation errors
            return ResponseEntity.badRequest().body("Validation error");
        }

        // Process the approval action
        System.out.println(data);
        // Return a success response
        return ResponseEntity.ok("Approved");
    }
	
	@PostMapping("/your-reject-controller-url")
    public ResponseEntity<String> handleRejectAction(@Valid @RequestBody CommunicationData data, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            // Handle validation errors
            return ResponseEntity.badRequest().body("Validation error");
        }

        // Process the rejection action
        System.out.println(data);
        // Return a success response
        return ResponseEntity.ok("Rejected");
    }
	
	
	//=======================================================================================
	@RequestMapping("docform")
	public String getForComm() {
		return "upload";
	}
	@RequestMapping(value = "uploading", method = RequestMethod.POST)
	public String handleFileUpload(@RequestParam("file") MultipartFile file,HttpServletRequest req) {
	    try {
	        // Get the original filename
	        String originalFilename = file.getOriginalFilename();
	        // Generate a unique filename
	        String uniqueFilename = UUID.randomUUID().toString() + "_" + originalFilename;
	        // Save the file to the "uploads" folder
	        String path = req.getServletPath();
	        System.out.println(path);
	        return "redirect:/success";
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "redirect:/error";
	    }
	}


	@RequestMapping(value = "/documents/{filename}", method = RequestMethod.GET)
	public ResponseEntity<Resource> viewDocument(@PathVariable("filename") String filename) {
	    try {
	        // Construct the file path based on the provided filename
	        String filePath = "classpath:/uploads/" + filename;
	        // Read the document from the "uploads" folder
	        Resource resource = new ClassPathResource(filePath);

	        // Set the appropriate headers for the response
	        HttpHeaders headers = new HttpHeaders();
	        headers.add(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=" + filename);

	        return ResponseEntity.ok()
	                .headers(headers)
	                .contentLength(resource.contentLength())
	                .contentType(MediaType.APPLICATION_OCTET_STREAM)
	                .body(resource);
	    } catch (IOException e) {
	        e.printStackTrace();
	        return ResponseEntity.notFound().build();
	    }
	}
}
