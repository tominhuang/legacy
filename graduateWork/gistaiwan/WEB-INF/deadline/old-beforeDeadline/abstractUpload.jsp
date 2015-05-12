 <%@ page contentType="text/html; charset=UTF-8"%>  
 <%@ page import="java.io.*"%>  
 <%@ page import="org.apache.commons.fileupload.*"%>  
 <%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>  
 <%@ page import="org.apache.commons.fileupload.util.Streams"%>  
 <%@ page import="org.apache.commons.io.FilenameUtils"%>  
 <%  
     //String saveDirectory = application.getRealPath("/upload");  
	 String saveDirectory = "K:/file/abstract/";
       
     // Check that we have a file upload request  
     boolean isMultipart = ServletFileUpload.isMultipartContent(request);  
     //out.println("isMultipart="+isMultipart+"<br>");  
       
     // Create a new file upload handler  
     ServletFileUpload upload = new ServletFileUpload();  
   
     //Create a progress listener  
     ProgressListener progressListener = new ProgressListener(){  
        private long megaBytes = -1;  
        public void update(long pBytesRead, long pContentLength, int pItems) {  
            long mBytes = pBytesRead / 1000000;  
            if (megaBytes == mBytes) {  
                return;  
            }  
            megaBytes = mBytes;  
            System.out.println("We are currently reading item " + pItems);  
            if (pContentLength == -1) {  
                System.out.println("So far, " + pBytesRead + " bytes have been read.");  
            } else {  
                System.out.println("So far, " + pBytesRead + " of " + pContentLength  
                                   + " bytes have been read.");  
            }  
        }  
     };  
     upload.setProgressListener(progressListener);  
   
     // Parse the request  
     FileItemIterator iter = upload.getItemIterator(request);  
     while (iter.hasNext()) {  
         FileItemStream item = iter.next();  
         String name = item.getFieldName();  
         InputStream stream = item.openStream();  
         if (item.isFormField()) {  
             String value = Streams.asString(stream);  
             out.println(name + "=" + value+"<br>");  
         } else {  
             System.out.println("File field " + name + " with file name "  
                 + item.getName() + " detected.");  
             // Process the input stream  
             String fieldName = item.getFieldName();  
             String fileName = item.getName();  
             String contentType = item.getContentType();  
             //out.println("fieldName="+fieldName+"<br>");  
             //out.println("fileName="+fileName+"<br>");  
             //out.println("contentType="+contentType+"<br>");
			 
			 /* check pin & filename */
			 String pin=(String)session.getAttribute("pin");//get pin			 
			 if(pin ==null){
				 out.println("Please login first!");
				 out.println("<script>alert('Please login first!');history.go(-1);</script>");
			 	 return;
			 }

			 
			 String upfile = "A" + pin + ".pdf";
			 /*
			 String fileName2 = fileName;//for ie
			 int filelength = fileName.length();
			 
			 if(filelength>10){
				  fileName2 = fileName.substring(filelength-10,filelength);
			 }			 
			 if( !fileName2.equals(upfile) ){
				 out.println("File name is not correct.");
				 out.println("<script>alert('File name is not correct.');history.go(-1);</script>");
				 return;
			 }
			 */
				 
             if (fileName != null && !"".equals(fileName)) {  
                 fileName= FilenameUtils.getName(fileName);  
                 //out.println("fileName saved="+fileName+"<br>");  
                 File uploadedFile = new File(saveDirectory, upfile);  
                 FileOutputStream uploadedFileStream =   
                     new FileOutputStream(uploadedFile);  
                 Streams.copy(stream, uploadedFileStream, true);
				 response.sendRedirect("upload/abstractUpload.html");
             }  
         }  
     }                
 %> 