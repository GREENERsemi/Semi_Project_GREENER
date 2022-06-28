package common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File originFile) {
		
		//우리가 만들 규칙 : 시간에 랜덤숫자도 추가로 넣어주기
		long currentTime = System.currentTimeMillis();
		int ranNum = (int)(Math.random() * 100000);
		
		String name = originFile.getName();	//파일 이름 가져오기
		String ext = null;	//확장자
		
		// 확장자는 파일 이름의 가장 마지막.뒤에 오므로
		int dot = name.lastIndexOf(".");	// 확장자를 찾기 위해 파일 이름의 마지막 . 에 대한 인덱스 가져오기 
		if(dot == -1) {	// 인덱스가 -1이라는 것은 .이 없는 경우를 의미한다. --> 확장자가 없는 경우
			ext = "";
		} else {
			ext = name.substring(dot);	// ex) .PNG  
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");	// 원하는 포맷으로 밀리초까지 가져옴
		String fileName = sdf.format(new Date(currentTime)) + ranNum + ext;		// 파일 이름 형식 만들어줌
		
		// File객체를 이용하여 getParent를 보내주어
		// thumbnail_uploadFiles 폴더 안에 해당 파일 이름으로 저장까지 된다.
		File newFile = new File(originFile.getParent(), fileName);
		
		return newFile;
	}

}
