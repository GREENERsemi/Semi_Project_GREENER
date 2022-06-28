package member.controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import member.model.service.MemberService;

/**
 * Servlet implementation class NewPwdEmailCheckServlet
 */
@WebServlet("/newPwdEmailCheck.me")
public class NewPwdEmailCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewPwdEmailCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 존재 여부 확인 
		String userId = request.getParameter("id");
		String receiver = request.getParameter("email");
		
		int result = new MemberService().emailValid(userId, receiver);
		
		// 2. result>0가 아닐 때(사용자 부존재 시), 
		// createNewPwdResult 페이지로 불일치 안내
		if(result < 1) {
			request.setAttribute("msg", "존재하는 사용자가 아닙니다.");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
		}
		
		// 3. result>0일 때 인증번호 발급해 발송
		String sender = "greener2022@naver.com";
		String password = "Greener2022!";

		
		//3.1 난수로 인증번호 6자리 발급
		int validNumber = (int) Math.round(Math.random() * 1000000);

		String title = "Greener 새 비밀번호 생성 인증번호 안내입니다";
		String content = "인증번호는 <span style='color:red;'>"+ validNumber + "</span>입니다. <br> 인증번호란에 입력해주세요.";
	
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.naver.com");
		prop.put("mail.smtp.auth", "true");
		
		Session session = Session.getDefaultInstance(prop, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(sender, password);
			}
		});
		

		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(sender));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
			
			message.setSubject(title);
			message.setText(content, "UTF-8", "html");
			
			Transport.send(message);
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		// 4. 인증번호 변수 validNumber를 다시 jsp로 돌려보내기
		response.setContentType("application/json; charset=UTF-8"); 
		Gson gson = new Gson();
		gson.toJson(validNumber, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
