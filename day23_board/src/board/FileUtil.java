package board;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FileUtil {

	private MultipartRequest mp;
	private String uploadPath = "uploadPath";
	
	public BoardDTO getBoardDTO(HttpServletRequest request) throws IOException {
		
		System.out.println(request.getParameter("title"));
		
		BoardDTO dto = null;
		ServletContext application = request.getServletContext();
		String realPath = application.getRealPath(uploadPath);
		File dir = new File(realPath);
		
		mp = new MultipartRequest(request, dir.toString(), 10485760, "UTF-8", new DefaultFileRenamePolicy());
		
		System.out.println(mp.getParameter("title"));
		
		dto = new BoardDTO();
		dto.setContent(mp.getParameter("content"));
		dto.setIpaddr(mp.getParameter("ipaddr"));
		dto.setTitle(mp.getParameter("title"));
		dto.setUploadFile(mp.getFilesystemName("uploadFile"));	// 파일의 이름만 바로 가져오기
		dto.setWriter(mp.getParameter("writer"));
		
		return dto;
	}
}
