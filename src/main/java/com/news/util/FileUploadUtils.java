package com.news.util;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtils {
	// 这个文件上传类主要是配合SpringMVC框架的

	// 这里主要是把文件上传到本地Tomcat服务器的webapp下面 ，并返回web的文件访问地址

	/**
	 * 文件上传
	 *
	 * @param request
	 *            HTTP请求
	 * @param files
	 *            上传的文件
	 * @param folder
	 *            要建立的文件夹的名字
	 * @return
	 */
	public static Map<String, UploadFile> upLoadFile(
			HttpServletRequest request, List<MultipartFile> files, String folder) {
		Map<String, UploadFile> map = new HashMap<String, UploadFile>();
		if (files != null && files.size() > 0) {
			// 1.获取绝对路径
			// request.getSession().getServletContext().getRealPath("/")==>
			// E:\apache-tomcate-7.0\webapps\项目名
			// getParentFile() ==>E:\apache-tomcate-7.0\webapps
			File root = new File(request.getSession().getServletContext()
					.getRealPath("/")).getParentFile();
			// 2.定义图片保存在服务器的那个位置
			// ==>E:\apache-tomcate-7.0\webapps\floder(你指定的文件夹名字)
			File loaclFilePath = new File(root, folder);
			// 3.通过http协议访问的路径 http://localhost:8080/floder(你指定的文件夹名字)
			String webFileUrl = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ "/" + folder;
			try {
				for (MultipartFile file : files) {
					// 文件的原始文件名
					String originalFileName = file.getOriginalFilename();
					if (file.isEmpty()) {
						continue;
					}
					// 随机分配一个新的文件名字给上传的文件
					// 29e6c3676c23466c8735bcc4d157ee08.xxx
					String newFileName = randomFileName()
							+ originalFileName.substring(originalFileName
							.lastIndexOf("."));
					// E:\apache-tomcate-7.0\webapps\floder(你指定的文件夹名字)\2017\02\25\
					String dir = loaclFilePath.getAbsolutePath()
							+ dateFileDirectory();
					// 重新创建新的本地文件的路径
					// E:\apache-tomcate-7.0\webapps\floder(你指定的文件夹名字)\2017\02\25\29e6c3676c23466c8735bcc4d157ee08.xxx
					String newFilePath = dir + newFileName;
					// 重新创建新的http协议访问文件的路径
					// http://localhost:8080/floder(你指定的文件夹名字)\2017\02\25\29e6c3676c23466c8735bcc4d157ee08.xxx
					String newFileUrl = webFileUrl + dateFileDirectory()
							+ newFileName;
					// 创建文件路径
					File saveFileDirectory = new File(dir);
					if (!saveFileDirectory.exists()) {
						saveFileDirectory.mkdirs();
					}
					// 新建文件
					File createFiles = new File(newFilePath);
					long fileSize = file.getSize();
					String fileType = file.getContentType();

					//通过上面的代码实现了文件属性的拼接,生成操作,最后利用UploadFile,实例化一个文件对象
					UploadFile uploadFile = new UploadFile(originalFileName,
							newFileName, newFilePath, newFileUrl, fileType,
							fileSize);

					//将文件对象放入map集合
					map.put(originalFileName, uploadFile);

					//上传文件spring框架提供的功能
					file.transferTo(createFiles);
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return map;
	}

	/**
	 * 随机分配文件名
	 *
	 * @return 29e6c3676c23466c8735bcc4d157ee08
	 */
	private static String randomFileName() {
		String name = UUID.randomUUID().toString();
		name = name.replaceAll("-", "");
		return name;
	}

	/**
	 * 产生日期的文件夹
	 *
	 * @return \2017\02\25\
	 */
	private static String dateFileDirectory() {
		Calendar calendar = Calendar.getInstance();
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH);
		int day = calendar.get(Calendar.DATE);
		return File.separator + year + File.separator + (month+1) + File.separator
				+ day + File.separator;
	}

	public static void main(String[] args) {
		System.out.println(FileUploadUtils.randomFileName());
	}

}
