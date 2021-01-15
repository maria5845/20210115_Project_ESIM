package com.tectone.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;

import com.tectone.web.model.FileVO;



public class FileMngUtil {

    public static final int BUFF_SIZE = 2048;


    private static final Logger LOG = LogManager.getLogger(FileMngUtil.class.getName());

    /**
     * 첨부파일에 대한 목록 정보를 취득한다.
     *
     * @param files
     * @return
     * @throws Exception
     */
    public static List<FileVO> parseFileInf(Map<String, MultipartFile> files, String KeyStr, int fileKeyParam, String atchFileId, String storePath) throws Exception {
		int fileKey = fileKeyParam;
	
		String storePathString = storePath;
		String atchFileIdString = "";
		List<FileVO> result  = new ArrayList<FileVO>();
		if (storePath != null && !"".equals(storePath) ) {
	
	
			File saveFolder = new File(WebUtil.filePathBlackList(storePathString));
	
			if (!saveFolder.exists() || saveFolder.isFile()) {

			    saveFolder.mkdirs();
			}
	
			Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();
			MultipartFile file;
			String filePath = "";
	
			FileVO fvo;
	
			while (itr.hasNext()) {
			    Entry<String, MultipartFile> entry = itr.next();
	
			    file = entry.getValue();
			    String orginFileName = file.getOriginalFilename();
	
			    //--------------------------------------
			    // 원 파일명이 없는 경우 처리
			    // (첨부가 되지 않은 input file type)
			    //--------------------------------------
			    if ("".equals(orginFileName)) {
			    	continue;
			    }
			    ////------------------------------------
	
			    int index = orginFileName.lastIndexOf(".");
			    String fileName = orginFileName.substring(0, index);
			    String fileExt = orginFileName.substring(index + 1);
			    //String newName = KeyStr + getTimeStamp() + fileKey;
			    String	newName	=	fileName + getTimeStamp() +"."+fileExt;
			    
			    long _size = file.getSize();
	
			    if (!"".equals(orginFileName)) {
			    	filePath = storePathString + File.separator + newName;
					file.transferTo(new File(WebUtil.filePathBlackList(filePath)));
			    }
			    fvo = new FileVO();
			    fvo.setFileextsn(fileExt);
			    fvo.setFilestrecours(storePathString);
			    fvo.setFilemg(Long.toString(_size));
			    fvo.setOrignlfilenm(orginFileName);
			    fvo.setStrefilenm(newName);
			    fvo.setAtchfileid(atchFileIdString);
			    fvo.setFilesn(String.valueOf(fileKey));
	
			    //writeFile(file, newName, storePathString);
			    result.add(fvo);
	
			    fileKey++;
			}	
		}

		return result;
    }

    /**
     * 첨부파일을 서버에 저장한다.
     *
     * @param file
     * @param newName
     * @param stordFilePath
     * @throws Exception
     */
    public static void writeUploadedFile(MultipartFile file, String newName, String stordFilePath) throws Exception {
		InputStream stream = null;
		OutputStream bos = null;
	
		try {
		    stream = file.getInputStream();
		    File cFile = new File(stordFilePath);
	
		    if (!cFile.isDirectory()) {
			boolean _flag = cFile.mkdir();
			if (!_flag) {
			    throw new IOException("Directory creation Failed ");
			}
		    }
	
		    bos = new FileOutputStream(stordFilePath + File.separator + newName);
	
		    int bytesRead = 0;
		    byte[] buffer = new byte[BUFF_SIZE];
	
		    while ((bytesRead = stream.read(buffer, 0, BUFF_SIZE)) != -1) {
			bos.write(buffer, 0, bytesRead);
		    }
		} catch (Exception e) {
		    //e.printStackTrace();
		    LOG.error("IGNORE:", e);	// 2011.10.10 보안점검 후속조치
		} finally {
		    if (bos != null) {
			try {
			    bos.close();
			} catch (Exception ignore) {
			    LOG.debug("IGNORED: " + ignore.getMessage());
			}
		    }
		    if (stream != null) {
			try {
			    stream.close();
			} catch (Exception ignore) {
			    LOG.debug("IGNORED: " + ignore.getMessage());
			}
		    }
		}
    }

    /**
     * 서버의 파일을 다운로드한다.
     *
     * @param request
     * @param response
     * @throws Exception
     */
    public static void downFile(HttpServletRequest request, HttpServletResponse response, String file_path, String filename) throws Exception {

		String downFileName = "";
		String orgFileName = "";
	
		//downfilename
		///data/web/env_material/notice\1b81ec38-ab63-4fca-82f4-6bd2c3e789b5.xlsx
		
		
	//	downFileName=file_path + File.separator + filename;
		orgFileName=filename;
	
		orgFileName = orgFileName.replaceAll("\r", "").replaceAll("\n", "");
		downFileName = file_path+orgFileName;
	
		System.out.println(file_path+orgFileName);
		System.out.println(downFileName);///Report/W_2020-05-29_report.xlsx
		
		File file = new File(WebUtil.filePathBlackList(downFileName));
	
		// 파일 존재 여부 체크
		if (!file.exists()) {
			throw new FileNotFoundException(downFileName);
		}
		
		// 파일 여부(디렉토리가아니어야한다.)
		if (!file.isFile()) {
			throw new FileNotFoundException(downFileName);
		}
	
		byte[] b = new byte[BUFF_SIZE]; //buffer size 2K.
	
		response.setContentType("application/octet-stream; charset=utf-8");
		response.setHeader("Content-Disposition", getDisposition(orgFileName, check_browser(request)));
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "0");
		response.setHeader("Set-Cookie", "fileDownload=true; path=/"); //jquery파일 다운로드 성공을 나타냄
		
		BufferedInputStream fin = null;
		BufferedOutputStream outs = null;
	
		try {
			fin = new BufferedInputStream(new FileInputStream(file));
			outs = new BufferedOutputStream(response.getOutputStream());
			int read = 0;
	
			while ((read = fin.read(b)) != -1) {
				outs.write(b, 0, read);
			}
		} finally {
			if (outs != null) {
				try {
					outs.close();
				} catch (Exception ignore) {
					System.out.println("IGNORED: " + ignore.getMessage());
					//logger.debug("IGNORED: " + ignore.getMessage());
				}
			}
			if (fin != null) {
				try {
					fin.close();
				} catch (Exception ignore) {
					System.out.println("IGNORED: " + ignore.getMessage());
					//logger.debug("IGNORED: " + ignore.getMessage());
				}
			}
		}
    }
    

    public static String check_browser(HttpServletRequest request) {
        String browser = "";
        String header = request.getHeader("User-Agent");
        //신규추가된 indexof : Trident(IE11) 일반 MSIE로는 체크 안됨
        if (header.indexOf("MSIE") > -1 || header.indexOf("Trident") > -1){
            browser = "ie";
        }
        //크롬일 경우
        else if (header.indexOf("Chrome") > -1){
            browser = "chrome";
        }
        //오페라일경우
        else if (header.indexOf("Opera") > -1){
            browser = "opera";
        }
        //사파리일 경우
        else if (header.indexOf("Apple") > -1){
            browser = "sarari";
        } else {
            browser = "firfox";
        }
        return browser;
    }
 
    public static String getDisposition(String down_filename, String browser_check) throws UnsupportedEncodingException {
        String prefix = "attachment;filename=";
        String encodedfilename = null;
        System.out.println("browser_check:"+browser_check);
        if (browser_check.equals("ie")) {
            encodedfilename = URLEncoder.encode(down_filename, "UTF-8").replaceAll("\\+", "%20");
        }else if (browser_check.equals("chrome")) {
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < down_filename.length(); i++){
                char c = down_filename.charAt(i);
                if (c > '~') {
                    sb.append(URLEncoder.encode("" + c, "UTF-8"));
                } else {
                    sb.append(c);
                }
            }
            encodedfilename = sb.toString();
        }else {
            encodedfilename = "\"" + new String(down_filename.getBytes("UTF-8"), "8859_1") + "\"";
        }
        return prefix + encodedfilename;
    }


    
    


    /**
     * 파일을 실제 물리적인 경로에 생성한다.
     *
     * @param file
     * @param newName
     * @param stordFilePath
     * @throws Exception
     */
    protected static void writeFile(MultipartFile file, String newName, String stordFilePath) throws Exception {
		InputStream stream = null;
		OutputStream bos = null;
	
		try {
		    stream = file.getInputStream();
		    File cFile = new File(WebUtil.filePathBlackList(stordFilePath));
	
		    if (!cFile.isDirectory())
			cFile.mkdir();
	
		    bos = new FileOutputStream(WebUtil.filePathBlackList(stordFilePath + File.separator + newName));
	
		    int bytesRead = 0;
		    byte[] buffer = new byte[BUFF_SIZE];
	
		    while ((bytesRead = stream.read(buffer, 0, BUFF_SIZE)) != -1) {
			bos.write(buffer, 0, bytesRead);
		    }
		} catch (Exception e) {
		    //e.printStackTrace();
		    //throw new RuntimeException(e);	// 보안점검 후속조치
			LogManager.getLogger(FileMngUtil.class).debug("IGNORED: " + e.getMessage());
		} finally {
		    if (bos != null) {
			try {
			    bos.close();
			} catch (Exception ignore) {
				LogManager.getLogger(FileMngUtil.class).debug("IGNORED: " + ignore.getMessage());
			}
		    }
		    if (stream != null) {
			try {
			    stream.close();
			} catch (Exception ignore) {
				LogManager.getLogger(FileMngUtil.class).debug("IGNORED: " + ignore.getMessage());
			}
		    }
		}
    }


    /**
     * 2011.08.09
     * 공통 컴포넌트 utl.fcc 패키지와 Dependency제거를 위해 내부 메서드로 추가 정의함
     * 응용어플리케이션에서 고유값을 사용하기 위해 시스템에서17자리의TIMESTAMP값을 구하는 기능
     *
     * @param
     * @return Timestamp 값
     * @exception MyException
     * @see
     */
    private static String getTimeStamp() {

	String rtnStr = null;

	// 문자열로 변환하기 위한 패턴 설정(년도-월-일 시:분:초:초(자정이후 초))
	String pattern = "yyyyMMddhhmmssSSS";

	try {
	    SimpleDateFormat sdfCurrent = new SimpleDateFormat(pattern, Locale.KOREA);
	    Timestamp ts = new Timestamp(System.currentTimeMillis());

	    rtnStr = sdfCurrent.format(ts.getTime());
	} catch (Exception e) {
	    //e.printStackTrace();
		
	    //throw new RuntimeException(e);	// 보안점검 후속조치
	    LOG.debug("IGNORED: " + e.getMessage());
	}

	return rtnStr;
    }
    
    
    
    
	public static void getImageWrite(String _path,HttpSession session,HttpServletResponse response)  {

		try{
			InputStream is	=	new FileInputStream(_path);

			response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
			
			IOUtils.copy(is, response.getOutputStream());
			response.flushBuffer();
		}catch(Exception e){
			
			e.printStackTrace();
		}
	}
	
    /**
     * <pre>
     * Comment : 파일을 삭제한다.
     * </pre>
     *
     * @param fileDeletePath 삭제하고자 하는파일의 절대경로
     * @return 성공하면 삭제된 파일의 절대경로, 아니면블랭크
     */

    public static String deleteFile(String fileDeletePath) {

		// 인자값 유효하지 않은 경우 블랭크 리턴
		if (fileDeletePath == null || fileDeletePath.equals("")) {
		    return "";
		}
		String result = "";
		File file = new File(WebUtil.filePathBlackList(fileDeletePath));
		if (file.isFile()) {
		    result = deletePath(fileDeletePath);
		} else {
		    result = "";
		}
	
		return result;
    }
    
    /**
     * <pre>
     * Comment : 디렉토리(파일)를 삭제한다. (파일,디렉토리 구분없이 존재하는 경우 무조건 삭제한다)
     * </pre>
     *
     * @param filePathToBeDeleted 삭제하고자 하는 파일의 절대경로 + 파일명
     * @return 성공하면 삭제된 절대경로, 아니면블랭크
     */

    public static String deletePath(String filePath) {
		File file = new File(WebUtil.filePathBlackList(filePath));
		String result = "";
		try {
	
		    if (file.exists()) {
		    	result = file.getAbsolutePath();
		    	if (!file.delete()) {
		    		result = "";
		    	}
		    }
		} catch (Exception e) {
		    //e.printStackTrace();
		    throw new RuntimeException(e);
		}
		return result;
    }    
}
