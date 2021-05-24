package day18;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FileUpload {
	
	private MultipartRequest mp;
	private final String uploadPath = "uploadFolder";
	private final int uploadFileSizeLimit = 10 * 1024 * 1024;
	private final String encType = "UTF-8";
	
	public ImageDTO getImageDTO(HttpServletRequest request) throws IOException {
		// JSP에서 사용하는 내장 객체 application (= ServletContext)
		ServletContext application = request.getSession().getServletContext(); 
		String uploadFilePath = application.getRealPath(uploadPath);
		
		File dir = new File(uploadFilePath);
		if(dir.exists() == false) {
			dir.mkdirs();
		}
		
		mp = new MultipartRequest(request, uploadFilePath, uploadFileSizeLimit, encType);
		// MultipartRequest 객체를 생성하면 파일이 지정한 위치에 생성된다
		
		String fileName = mp.getFilesystemName("uploadFile");
		ImageDTO dto = null;
		
		if(fileName == null) {
			System.out.println("파일 업로드 실패");
		}else {
			File f1 = mp.getFile("uploadFile");
			String extName = fileName.substring(fileName.lastIndexOf("."));
			String f2Name = UUID.randomUUID().toString().replace("-", "") + extName;
			File f2 = new File(uploadFilePath, f2Name);
			f1.renameTo(f2);
			dto = new ImageDTO();
			dto.setOriginalFileName(fileName);
			dto.setStoredFileName(f2Name);
		}
		return dto;
	}
}
