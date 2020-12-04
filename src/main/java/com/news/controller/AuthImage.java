package com.news.controller;
import java.io.IOException ;
import javax.servlet.ServletException; 
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse; 

import org.springframework.stereotype.Controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.OutputStream;
import java.util.Random;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class AuthImage extends HttpServlet {



public void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
doPost(request, response);
}


public void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
response.setContentType("imge/jpeg");       
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

int width= 300;  
int height = 50;
int count = 4;
String codes="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz123456789";
String codeValues = "";
BufferedImage image = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
Graphics2D g = image.createGraphics();
g.setColor(Color.WHITE);
g.fillRect(0, 0, width, height);

g.setColor(Color.blue);
g.drawRect(0, 0, width, height);
Random random = new Random();
int segment = width/count;  
for(int i=0;i<count;i++){
int red =random.nextInt(255)+1;
int blue = random.nextInt(255)+1;
int green = random.nextInt(255)+1;

Color color = new Color(red,blue,green);
g.setColor(color);
int size = random.nextInt(7)+30;
Font font = new Font("Default",Font.ITALIC,size);
g.setFont(font);
int index = random.nextInt(codes.length());
String s = codes.charAt(index)+"";
codeValues += s;
g.drawString(s, i*segment, height-4);
}
request.getSession().setAttribute("codeValues", codeValues);
// System.out.println(codeValues);
for(int i=0;i<5;i++){
int x=random.nextInt(width)+1;
int y=random.nextInt(height)+1;
g.drawRect(x, y, 1, 1);
}
g.dispose();
OutputStream out = response.getOutputStream();
JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
encoder.encode(image);
out.flush();
out.close();
}


}