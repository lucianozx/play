package lib;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import java.awt.image.BufferedImage;
import java.io.*;
import java.util.List;
import javax.imageio.ImageIO;
//import org.apache.commons.fileupload.FileItem;
//import org.apache.commons.fileupload.FileUploadException;
//import org.apache.commons.fileupload.disk.DiskFileItemFactory;
//import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.imgscalr.Scalr;
import org.json.JSONArray;
import org.json.JSONObject;

// @WebServlet("/upload.html")

@WebServlet(urlPatterns = { "/upload" }, initParams = { @WebInitParam(name = "upload_path_linux", value = "/home/ec2-user/static", description = "linux"), @WebInitParam(name = "upload_path", value = "/home/ec2-user/static", description = "windows") })
// @MultipartConfig(location="c:\\tmp", fileSizeThreshold = 1024 * 1024,
// maxFileSize = 1024 * 1024 * 500, maxRequestSize = 1024 * 1024 * 50 * 500)
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 500, maxRequestSize = 1024 * 1024 * 50 * 500)
public class FileUploadServlet extends HttpServlet
{

	private static final long serialVersionUID = 2460311279206654446L;

	private String dir;
	private File fileUploadPath;

	public void init(ServletConfig config) throws ServletException
	{
		dir = config.getInitParameter("upload_path");
		fileUploadPath = new File(config.getInitParameter("upload_path"));
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		if (request.getParameter("getfile") != null && !request.getParameter("getfile").isEmpty())
		{

			File file = new File(fileUploadPath, request.getParameter("getfile"));

			if (file.exists())
			{
				int bytes = 0;
				ServletOutputStream op = response.getOutputStream();

				response.setContentType(getMimeType(file));
				response.setContentLength((int) file.length());
				response.setHeader("Content-Disposition", "inline; filename=\"" + file.getName() + "\"");

				byte[] bbuf = new byte[1024];
				DataInputStream in = new DataInputStream(new FileInputStream(file));

				while ((in != null) && ((bytes = in.read(bbuf)) != -1))
				{
					op.write(bbuf, 0, bytes);
				}

				in.close();
				op.flush();
				op.close();
			}
		}
		else if (request.getParameter("delfile") != null && !request.getParameter("delfile").isEmpty())
		{
			File file = new File(fileUploadPath, request.getParameter("delfile"));
			if (file.exists())
			{
				file.delete(); // TODO:check and report success
			}
		}
		else if (request.getParameter("getthumb") != null && !request.getParameter("getthumb").isEmpty())
		{
			File file = new File(fileUploadPath, request.getParameter("getthumb"));
			if (file.exists())
			{
				String mimetype = getMimeType(file);
				if (mimetype.endsWith("png") || mimetype.endsWith("jpeg") || mimetype.endsWith("gif"))
				{
					BufferedImage im = ImageIO.read(file);
					if (im != null)
					{
						BufferedImage thumb = Scalr.resize(im, 180);
						ByteArrayOutputStream os = new ByteArrayOutputStream();
						if (mimetype.endsWith("png"))
						{
							ImageIO.write(thumb, "PNG", os);
							response.setContentType("image/png");
						}
						else if (mimetype.endsWith("jpeg"))
						{
							ImageIO.write(thumb, "jpg", os);
							response.setContentType("image/jpeg");
						}
						else
						{
							ImageIO.write(thumb, "GIF", os);
							response.setContentType("image/gif");
						}
						ServletOutputStream srvos = response.getOutputStream();
						response.setContentLength(os.size());
						response.setHeader("Content-Disposition", "inline; filename=\"" + file.getName() + "\"");
						os.writeTo(srvos);
						srvos.flush();
						srvos.close();
					}
				}
			} // TODO: check and report success
		}
		else
		{
			PrintWriter writer = response.getWriter();
			writer.write("call POST with multipart form data");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		response.setContentType("application/json");
		PrintWriter writer = response.getWriter();
		JSONArray json = new JSONArray();

		InputStream inputStream = null;
		FileOutputStream outputStream = null;

		try
		{
			for (Part part : request.getParts())
			{

				System.out.println("Part.getContentType(): " + part.getContentType());
				System.out.println("Part.getName()       : " + part.getName());
				System.out.println("Part.getSize()       : " + part.getSize());
				System.out.println("Part.getHeaderNames():");
				for (String str : part.getHeaderNames())
				{
					System.out.println("                      " + str);
					System.out.println("                      - " + part.getHeader(str));

					for (String header : part.getHeaders(part.getHeader(str)))
					{
						System.out.println("                       - " + part.getHeader(header));
					}
				}

				inputStream = part.getInputStream();
				int i = inputStream.available();
				byte[] b = new byte[i];
				inputStream.read(b);
				System.out.println("Length : " + b.length);

				String filename = null;
				String partHeader = part.getHeader("content-disposition");
				System.out.println("Part Header = " + partHeader);
				System.out.println("part.getHeader(\"content-disposition\") = " + part.getHeader("content-disposition"));

				for (String temp : part.getHeader("content-disposition").split(";"))
				{
					if (temp.trim().startsWith("filename")) filename = temp.substring(temp.indexOf('=') + 1).trim().replace("\"", "");
				}

				if (filename != null)
				{

					StringBuilder id = new StringBuilder();
					String type = getSuffix(filename);
					String size = Integer.toString(b.length);
					String folder = dir;
					ManagerFigura.add(id, filename, type, size, folder);

					filename = id.toString() + "." + type;

					// String uploadDir =
					// System.getProperty("jboss.server.base.dir")+"/upload";
					System.out.println("File will be Uploaded at: " + dir + "/" + filename);
					outputStream = new FileOutputStream(dir + "/" + filename);
					outputStream.write(b);
					inputStream.close();

					// ManagerFigura.update(id.toString());

					/*
					 * 
					 * File file = new File(fileUploadPath, part.getName()); //part.write(file.getName()); FileOutputStream o = new FileOutputStream(file);
					 */

					JSONObject jsono = new JSONObject();
					jsono.put("id", id.toString());
					jsono.put("name", filename);
					jsono.put("size", part.getSize());
					jsono.put("url", "/upload?getfile=" + filename);
					jsono.put("thumbnail_url", "/upload?getthumb=" + filename);
					jsono.put("delete_url", "/upload?delfile=" + filename);
					jsono.put("delete_type", "GET");
					json.put(jsono);
				}
			}
		}
		catch (Exception e)
		{

			System.out.println("Unable to Upload File: " + e);
			e.printStackTrace();
			throw new RuntimeException(e);

		}
		finally
		{

			writer.write(json.toString());
			writer.close();

			if (inputStream != null)
			{
				try
				{
					inputStream.close();
				}
				catch (Exception e)
				{
					e.printStackTrace();
				}
			}
			if (outputStream != null)
			{
				try
				{
					outputStream.close();
				}
				catch (Exception e)
				{
					e.printStackTrace();
				}
			}
		}

		/*
		 * if (!ServletFileUpload.isMultipartContent(request)) { throw new IllegalArgumentException( "Request is not multipart, please 'multipart/form-data' enctype for your form." ); }
		 * 
		 * ServletFileUpload uploadHandler = new ServletFileUpload(new DiskFileItemFactory()); PrintWriter writer = response.getWriter(); response.setContentType("application/json"); JSONArray json = new JSONArray(); try { List<FileItem> items =
		 * uploadHandler.parseRequest(request); for (FileItem item : items) { if (!item.isFormField()) { File file = new File(fileUploadPath, item.getName()); item.write(file); JSONObject jsono = new JSONObject(); jsono.put("name", item.getName());
		 * jsono.put("size", item.getSize()); jsono.put("url", "upload?getfile=" + item.getName()); jsono.put("thumbnail_url", "upload?getthumb=" + item.getName()); jsono.put("delete_url", "upload?delfile=" + item.getName()); jsono.put("delete_type", "GET");
		 * json.put(jsono); } } } catch (FileUploadException e) { throw new RuntimeException(e); } catch (Exception e) { throw new RuntimeException(e); } finally { writer.write(json.toString()); writer.close(); }
		 */
	}

	private void printPart(Collection<Part> parts, Part part, PrintWriter pw)
	{
		StringBuffer sb = new StringBuffer();
		sb.append("<p>");
		sb.append("Parts: " + parts.size());
		sb.append("<br>");
		sb.append("Name : " + part.getName());
		sb.append("<br>");
		sb.append("Content Type : " + part.getContentType());
		sb.append("<br>");
		sb.append("Size : " + part.getSize());
		sb.append("<br>");
		for (String header : part.getHeaderNames())
		{
			sb.append(header + " : " + part.getHeader(header));
			sb.append("<br>");
		}
		sb.append("</p>");
		pw.write(sb.toString());
	}

	private String getMimeType(File file)
	{
		String mimetype = "";
		if (file.exists())
		{
			// URLConnection uc = new URL("file://" +
			// file.getAbsolutePath()).openConnection();
			// String mimetype = uc.getContentType();
			// MimetypesFIleTypeMap gives PNG as application/octet-stream, but
			// it seems so does URLConnection
			// have to make dirty workaround
			switch (getSuffix(file.getName()).toLowerCase())
			{
				case "jpg":
				case "jpeg":
					mimetype = "image/jpeg";
					break;
				case "png":
					mimetype = "image/png";
					break;
				case "gif":
					mimetype = "image/png";
					break;
				default:
					javax.activation.MimetypesFileTypeMap mtMap = new javax.activation.MimetypesFileTypeMap();
					mimetype = mtMap.getContentType(file);
					break;
			}
		}
		System.out.println("mimetype: " + mimetype);
		return mimetype;
	}

	private String getSuffix(String filename)
	{
		String suffix = "";
		int pos = filename.lastIndexOf('.');
		if (pos > 0 && pos < filename.length() - 1)
		{
			suffix = filename.substring(pos + 1);
		}
		System.out.println("suffix: " + suffix);
		return suffix;
	}
}
