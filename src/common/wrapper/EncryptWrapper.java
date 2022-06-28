package common.wrapper;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class EncryptWrapper extends HttpServletRequestWrapper{

	public EncryptWrapper(HttpServletRequest request) {
		super(request);  // HttpServletRequestWrapper의 기본 생성자		
	} // super를 생성해 줌
	
	// EncryptWrapper는 HSRW를 상속받음, 이 때 상속이라 함은 자식 객체를 만들 때 
	// 부모 클래스의 super 기본 생성자를 통해 부모 객체를 먼저 만들어야 함
	// 그런데 HSRW는 기본 생성자가 없음
	// so 객체를 만들 수 없어 자식 객체인 EncryptWrapper의 객체도 만들 수가 없음
	// so HttpServletRequestWrapper가 유일하게 가진 생성자를 호출해 super를 생성함
	
	//비밀번호 암호화
	@Override
	public String getParameter(String name) {
		String value = null;
		if(name != null && (name.equals("userPwd") || name.equals("user[password]") || name.equals("newPwd") || name.equals("user[newPwd]"))) {	

			// 암호화 진행 : SHA-512 
			try {
				MessageDigest md = MessageDigest.getInstance("SHA-512");
				String pwd = super.getParameter(name);
				byte[] bytes = pwd.getBytes("UTF-8");  //String을 byte[]로 바꿈
				md.update(bytes); //준비 완료
				
				value = Base64.getEncoder().encodeToString(md.digest());
				
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		} else {
			value = super.getParameter(name);
		}
		
		return value;
	}
	
	
}
