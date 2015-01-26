package com.gzjr.hzkjy.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Calendar;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hpsf.Thumbnail;


/**
 * 
 * 项目名称：
 * 类名称：FileUtil
 * 类描述：文件操作类（主要用于上传和下载）
 * 创建人：linshaozhi
 * 创建时间：2013-4-23 上午11:01:38
 * 修改人：linshaozhi
 * 修改时间：2013-4-23 上午11:01:38
 * 修改备注：
 * @version
 */
public class FileUtil {
	/**
	 * 
	 * downloadFile( 下载文件)
	 * @param filePath :是指欲下载的文件的路径。
	 * @param response  :响应  
	 * void    返回类型
	 */
	public void downloadFile(String filePath,String newfileName, HttpServletResponse response) {
		try {
			File file = new File(filePath);
			// 取得文件名。
			String filename = file.getName();

			// byte[] bytes = filename.getBytes("iso-8859-1");
			// filename = new String(bytes, "UTF-8") ;
			// 以流的形式下载文件。
			InputStream fis = new BufferedInputStream(new FileInputStream(
					filePath));
			// byte[] buffer = new byte[1024];

			// fis.read(buffer);
			// fis.close();
			// 清空response
			response.reset();
			// 设置response的Header
			filename = java.net.URLEncoder.encode(filename, "UTF-8");
			// filename=java.net.URLEncoder.encode(filename);
			// response.setCharacterEncoding("UTF-8");
			response.addHeader("Content-Disposition", "attachment;filename="
					+ newfileName);
			response.addHeader("Content-Length", "" + file.length());
			OutputStream toClient = new BufferedOutputStream(response
					.getOutputStream());
			response.setContentType("application/octet-stream");
			int i1 = 0;
			byte b[] = new byte[1024];
			while ((i1 = fis.read(b)) != -1) {
				toClient.write(b, 0, i1);
			}
			// toClient.write(buffer);
			fis.close();
			toClient.flush();
			toClient.close();

		} catch (IOException ex) {
			ex.printStackTrace();
			System.out.println("下载异常：" + ex.getMessage());
		}
	}

	 /**
	  * 
	  * upfile(上传文件)
	  * @param upfile :上传的文件
	  * @param filePath :保存到服务上的路径
	  * @return    
	  * boolean    返回类型
	  */
	public boolean upfile(File upfile, String filePath) {
		try {
			InputStream is = new FileInputStream(upfile);
			this.createFolder(filePath);
			OutputStream os = new FileOutputStream(filePath);
			byte[] bt = new byte[1024];
			int length = 0;
			while ((length = is.read(bt)) > 0) {
				os.write(bt, 0, length);
				os.flush();
			}
			is.close();
			os.close();
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	/**
	 * 
	 * showImage(输出图片)
	 * @param imagePath ：图片路径
	 * @param response
	 * @throws Exception    
	 * void
	 */
	
	public void showImage(String imagePath,HttpServletResponse response) throws Exception {
		InputStream inputStream=new FileInputStream(imagePath);
		showImage(inputStream,response);
	}
	/**
	 * 
	 * showImage(输出图片)
	 * @param imagePath ：图片路径
	 * @param response
	 * @throws Exception    
	 * void
	 */
	
	public void showImage(InputStream inputStream,HttpServletResponse response) throws Exception {
		byte[] b = new byte[1024*4];
		int len = -1;
		while ((len = inputStream.read(b, 0, 1024*4)) != -1) {
			response.getOutputStream().write(b, 0, len);
		}
		inputStream.close();
		response.getOutputStream().close();
	}

	/**
	 * 
	 * deleteFile(检查文件是否存在)
	 * @param path :文件路径
	 * @return    boolean    返回类型
	 */
	public boolean deleteFile(String path) {
		File file = new File(path);
		if (!file.exists()) {
			System.out.println(path + "文件不存在");
			return true;
		}
		file.delete();
		return true;
	}
	 
	/**
	 * 
	 * getFileName(根据文件名或者文件路径生成一个文件名(与源文件名是一样的,只是后缀名有区别,当然,如果ext与源文件 名的后缀名一样,返回的文件名也是一样的.))
	 * @param filePathOrFileName :文件名或者路径
	 * @param ext :生成文件名的后缀名,例如"pdf","flv".
	 * @return   String    返回类型
	 */
	public String getFileName(String filePathOrFileName, String ext) {
		try {
			String d_fileName = filePathOrFileName.substring(filePathOrFileName
					.lastIndexOf("/") + 1, filePathOrFileName.length());
			d_fileName = d_fileName.substring(0,
					d_fileName.lastIndexOf(".") + 1);
			return d_fileName + ext;
		} catch (Exception e) {
			// System.out.println("文件名为空");
			// e.printStackTrace();
			return null;
		}
	}
	/**
	 * exitFile(检查文件是否存在)
	 * @param path :文件路径
	 * @return    
	 * boolean    返回类型
	 */
	public boolean exitFile(String path) {
		File file = new File(path);
		if (!file.exists()) {
			return false;
		}
		return true;
	}

	/**
	 * createFolder(创建文件夹)
	 * @param folderOrFilePath   :文件夹或文件的路径.如:/data/src/vod或/data/src/vod/123.flv  
	 * void    返回类型
	 */
	public void createFolder(String folderOrFilePath) {
		if (folderOrFilePath.lastIndexOf(".") > 0) {// 判断是否是文件,如果是文件,则将对应文件夹路径截出来
			folderOrFilePath = folderOrFilePath.substring(0, folderOrFilePath
					.lastIndexOf("/"));
		}
		File file = new File(folderOrFilePath);
		if (!file.exists()) {
			file.mkdirs();
		}
	}

	/**
	 * createThumbnail(生成缩略图，返回缩略图的名字)
	 * @param imagePath :源图片路径
	 * @param thumbPath ：缩略图路径
	 * @return   boolean    返回类型
	 */
	
	 /**
	  * 
	  * getReFileName(获取一个唯一的文件名)
	  * @param fileName :文件名,含扩张名
	  * @return    
	  * String    返回类型
	  */
	public String getReFileName(String fileName) {
		UUID uuid = UUID.randomUUID();
		return uuid.toString() + "." + getFileExt(fileName);
	}

	 /**
	  * 
	  * getFileExt(根据文件名或者文件路径全名获取后缀名(不含点"."))
	  * @param fileNameOrPath :文件路径（文件名）
	  * @return  String    返回类型
	  */
	public String getFileExt(String fileNameOrPath) {
		try {
			return fileNameOrPath.substring(
					fileNameOrPath.lastIndexOf(".") + 1, fileNameOrPath
							.length());
		} catch (Exception e) {
			// System.out.println("文件名为空");
			// e.printStackTrace();
			return null;
		}
	}

}
