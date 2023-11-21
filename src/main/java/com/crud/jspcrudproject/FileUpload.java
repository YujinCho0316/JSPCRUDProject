package com.crud.jspcrudproject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;

public class FileUpload {
    public BoardVO uploadImg (HttpServletRequest request) {
        String filename = "";
        int sizeLimit = 15*1024*1024;

        // 실제로 서버에 저장되는 path를 upload로 정한다.
        String realPath = request.getServletContext().getRealPath("upload");

        // 만약 저장될 경로에 upload 폴더가 존재하지 않으면 생성
        File dir = new File(realPath);
        if(!dir.exists()) dir.mkdirs();

        BoardVO one = null;
        MultipartRequest multipartRequest = null;
        try {
            // 파일 업로드 처리 과정
            multipartRequest = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());

            filename = multipartRequest.getFilesystemName("img");

            one = new BoardVO();
            String seq = multipartRequest.getParameter("seq");
            if (seq != null && !seq.equals(""))
                one.setSeq(Integer.parseInt(seq));
            one.setCategory(multipartRequest.getParameter("category"));
            one.setTitle(multipartRequest.getParameter("title"));
            one.setWriter(multipartRequest.getParameter("writer"));
            one.setContent(multipartRequest.getParameter("content"));
            //String cnt = multipartRequest.getParameter("cnt");
            //one.setCnt(Integer.parseInt(cnt));
           // String regdate = multipartRequest.getParameter("regdate");
           // one.setRegdate(BaseCalendar.Date.);
           // one.setModdate(multipartRequest.getParameter("moddate"));

            if (seq != null && !seq.equals("")) {
                BoardDAO dao = new BoardDAO();
                String oldfilename = dao.getImgFilename(Integer.parseInt(seq));
                if(filename != null && oldfilename != null)
                    FileUpload.deleteFile(request, oldfilename);
                else if(filename == null && oldfilename != null)
                    filename = oldfilename;
                else if(oldfilename == null) {
                    one.setImg(filename);
                    return one;
                }
            }
            one.setImg(filename);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return one;
    }
    public static void deleteFile (HttpServletRequest request, String filename) {
        String filePath = request.getServletContext().getRealPath("upload");

        File f = new File(filePath + "/" + filename);
        if (f.exists()) f.delete();
    }
}
