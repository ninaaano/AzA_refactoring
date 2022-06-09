package com.aza.web.message;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.aza.common.Search;
import com.aza.service.domain.Message;
import com.aza.service.domain.Students;
import com.aza.service.domain.User;
import com.aza.service.students.StudentsDao;
import com.aza.service.students.StudentsService;
import com.aza.service.user.UserDao;
import com.aza.service.user.UserService;

@CrossOrigin(origins = "*", allowedHeaders = "*")
@RestController
@RequestMapping("/message/rest/*")
public class MessageRestController {

	@Autowired
	private MongoTemplate mongoTemplate;
		
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("userDaoImpl")
	private UserDao userDao;
	
	@Autowired
	@Qualifier("studentsServiceImpl")
	private StudentsService studentsService;
	
	@Autowired
	@Qualifier("studentsDaoImpl")
	private StudentsDao studentsDao;
	
	
	public MessageRestController() {
		System.out.println(this.getClass());
	}

	
	@RequestMapping("addMessage")
	public void addMessage(String senderId, String receiverId, String messageContent, String messageCreateAt) throws Exception {
		
		System.out.println("addMessage : start");
		
		Message message = new Message(senderId, receiverId, messageContent, messageCreateAt);
		mongoTemplate.insert(message);
		
		System.out.println(message);
	}
	
	@RequestMapping("deleteMessage")
	public void deleteMessage(String messageId) throws Exception {
		
		Criteria criteria = new Criteria("._id");
		criteria.is(messageId);

		Query qr = new Query(criteria);
		
		mongoTemplate.remove(qr, "message");
	}
	
	@RequestMapping("readMessage")
	public void readMessage(String receiverId, String senderId, String messageReadAt) throws Exception {
		
		Criteria criteria = Criteria.where("receiverId").is(receiverId)
				.and("senderId").is(senderId)
				.and("messageReadAt").exists(false);
		Query qr = new Query(criteria);
		Update update = new Update();
		update.set("messageReadAt", messageReadAt);
		
		mongoTemplate.updateMulti(qr, update, "message");
				
	}

	@RequestMapping("listMessage")
	public List listMessage(HttpSession session) throws Exception {
		
		System.out.println("/message/rest/listMessage");
		
		List others = new ArrayList<>();
		
		User dbUser = (User) session.getAttribute("user");
		
		others.add(dbUser);	
		
		if(dbUser.getRole().equals("teacher")) {
			
			String teacherId = dbUser.getUserId();
			
			Search search = new Search();
			int totalCount = (int) studentsService.listStudentsRecord(search, teacherId).get("totalCount");
			search.setCurrentPage(1);
			search.setPageSize(totalCount);
			
			//others.add(teacherId);
			
			List<Students> studentsList = (List<Students>) studentsService.listStudentsRecord(search, teacherId).get("list");
						
			for(Students student : studentsList) {				
				
				System.out.println(student + ": forStudent");
				String studentId = student.getStudentId();
				
				others.add(student);
				
				//search = new Search();
				totalCount = (int) userService.listRelationByStudent(search, studentId).get("totalCount");
				//search.setCurrentPage(1);
				search.setPageSize(totalCount);
				
				List<User> parentList = (List<User>) userService.listRelationByStudent(search, studentId).get("list");
				
				
				for(User parent : parentList) {

					User parentInfo = userService.getUser(parent.getUserId());
					parentInfo.setRelationName(parent.getRelationName()); 
					parentInfo.setFirstStudentId(studentId);
					
					others.add(parentInfo);				
				}
			}
			
			
					
			
			
			
			
		} 
		
		else if(dbUser.getRole().equals("student")) {
			
			
			
			
		} 
		
		else if(dbUser.getRole().equals("parent")) {
			
		}
		
		
		
		
	
	
	
	
	return others;
	}

}