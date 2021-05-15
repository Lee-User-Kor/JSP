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
		
		dto = new BoardDTO();
//		dto.setIdx(Integer.parseInt(mp.getParameter("idx")));
		dto.setTitle(mp.getParameter("title"));
		dto.setWriter(mp.getParameter("writer"));
		dto.setContent(mp.getParameter("content"));
//		dto.setWriteDate(mp.getParameter("writedate"));
//		dto.setViewCount(Integer.parseInt(mp.getParameter("viewcount")));
		dto.setUploadFile(mp.getFilesystemName("uploadFile"));
//		dto.setDeleted(mp.getParameter("deleted"));
		dto.setSecretNum(mp.getParameter("secretnum"));
		dto.setSecretCheck(mp.getParameter("secretcheck"));
		
		return dto;
	}
}
