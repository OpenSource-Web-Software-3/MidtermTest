package Controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import file.FileDAO;
import file.FileDTO;
import item.ItemDAO;

/**
 * Servlet implementation class writeAction
 */
@WebServlet("/insertItemAction")
public class insertItemAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("UTF-8");

		ServletContext application = request.getServletContext();
		HttpSession session = request.getSession(true);

		String directory = application.getRealPath("/itemFile/");

		int maxSize = 1024 * 1024 * 100; // 100MB 제한
		String encoding = "UTF-8";	
		MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize, encoding,
				new DefaultFileRenamePolicy()); //인스턴스 생성과 함께 해당 directory에 파일 저장
		
		String itemName = (String) multipartRequest.getParameter("itemName");
		String itemPrice = (String) multipartRequest.getParameter("itemPrice");
		String itemColor = (String) multipartRequest.getParameter("itemColor");
		String itemSize = (String) multipartRequest.getParameter("itemSize");
		String itemContent = (String) multipartRequest.getParameter("itemContent");
		String main_cate = (String) multipartRequest.getParameter("main_cate");
		String sub_cate = (String) multipartRequest.getParameter("sub_cate");
		
		
		
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href = 'login.do'");
			script.println("</script>");

		} else {
			if (itemName == null || itemName.equals("") || itemPrice == null || itemPrice.equals("") ||
					itemColor == null || itemColor.equals("")|| itemSize == null || 
							itemSize.equals("")|| main_cate == null || main_cate.equals("")|| sub_cate == null || sub_cate.equals("")) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력되지 않는 정보가 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
				deleteFileFunction(multipartRequest, directory);
			} else {
				ItemDAO itemDao = new ItemDAO();
				int result = itemDao.insertItem(itemName, itemPrice, itemColor, itemSize, main_cate, sub_cate, itemContent);
				
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('상품 업로드 실패')");
					script.println("history.back()");
					script.println("</script>");
					deleteFileFunction(multipartRequest, directory);
				} else {
					// 상품 업로드 성공 시 파일도 저장하기(실제 파일은 저장되어 있고 DB에 fileName과 fileRealName을 등록하는 과정)
					// 여기다가 multipart선언해도 될 듯 
					Enumeration fileNames = multipartRequest.getFileNames(); //type = file
					while (fileNames.hasMoreElements()) { 
						String parameter = (String) fileNames.nextElement();
						String fileName = multipartRequest.getOriginalFileName(parameter);
						String fileRealName = multipartRequest.getFilesystemName(parameter);
						
						//단일 파일시 
						// String fileName = multipartRequest.getOriginalFileName("file"); //request요청
						// 객체 file (from form)
						// String fileRealName = multipartRequest.getFilesystemName("file"); //실제로 서버에
						// 업로드가 된 파일 시스템 name 을 가져온다

						if (fileName == null)
							continue; // 파일을 다른곳에 넣었을 경우

						// secure hard coding / only IMAGE FILE
						if (!fileName.endsWith(".PNG")
								&& !fileName.endsWith(".jpg") && !fileName.endsWith(".png")
								&& !fileName.endsWith(".JPEG") && !fileName.endsWith(".JPG")
								&& !fileName.endsWith(".jpeg") ) {
							File file = new File(directory + fileRealName);
							file.delete();
							
							PrintWriter script = response.getWriter();
							script.println("<script>");
							script.println("alert('파일을 업로드 하지 못했습니다.')");
							script.println("location.href = 'index.do'");
							script.println("</script>");

						} else {
							new FileDAO().upload(itemDao.getNext() - 1, fileName, fileRealName);
							// out.write("파일명 : " + fileName + "<br>");
							// out.write("실제파일명 : " + fileRealName + "<br>");
						}
					}

					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'index.do'");
					script.println("</script>");

				}
			}
		}

	}

	// 기존파일 삭제(함수 안만듬)
	public void deleteFileFunction(ArrayList<FileDTO> fileList, String directory, int bbsID) {
		for (int i = 0; i < fileList.size(); i++) {
			File prevfile = new File(directory + fileList.get(i).getFileRealName()); // 실제 파일도 같이 삭제
			prevfile.delete();
		}
		
		//new FileDAO().delete(bbsID); // 기존에 있던 사진을 먼저 삭제 한다
	}

	// 현재 날라온 파일 삭제
	public void deleteFileFunction(MultipartRequest multipartRequest, String directory) {
		Enumeration fileNames = multipartRequest.getFileNames();
		while (fileNames.hasMoreElements()) {
			String parameter = (String) fileNames.nextElement();
			String fileRealName = multipartRequest.getFilesystemName(parameter);
			File prevfile = new File(directory + fileRealName); // 실제 파일도 같이 삭제
			prevfile.delete();
		}
	}
}