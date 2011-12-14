<%-- 
    Document   : index
    Created on : Dec 10, 2011, 3:39:08 PM
    Author     : lalazari
--%>
<%@ page import="java.util.*" %>
<%@ page import="listen.*" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<%Handler cafe=(Handler)getServletContext().getAttribute("cafe"); 
  String cafeQ = request.getParameter("cafeQuantity");
  if (session.isNew()){
      session.setAttribute("theCafe", 0);
  }
  int ca;
  if(cafeQ != null){
    try {
        ca = Integer.parseInt(cafeQ);
        if(ca<0) {
            ca=(ca*(-1));
        }
        session.setAttribute("theCafe", ca);
    }
    catch(NumberFormatException e){
      session.setAttribute("theCafe", 0);
      out.println("<br>Bad number format at cafe field!<br>Please give an integer at this field");
      
    }
   }
%>
<% Handler sugar=(Handler)getServletContext().getAttribute("sugar");
  String sugarQ = request.getParameter("sugarQuantity");
  int su;
  if (session.isNew()){
      session.setAttribute("theSugar", 0);
  }
  if(sugarQ != null) {
      try {
        su = Integer.parseInt(sugarQ);
        if(su<0) {
            su=(su*(-1));
        }
        session.setAttribute("theSugar", su);
      }
      catch(NumberFormatException e){
          session.setAttribute("theSugar", 0);
          out.println("<br>Bad number format at sugar field!<br>Please give an integer at this field");
      
        }
  
  }   
  
%>  
<% Handler water=(Handler)getServletContext().getAttribute("water");
  String waterQ = request.getParameter("WaterQuantity");
  int wa;
  if (session.isNew()){
      session.setAttribute("theWater", 0);
  }
  if(waterQ != null) {
    try{  
        wa = Integer.parseInt(waterQ);
        if(wa<0) {
            wa=(wa*(-1));
        }
        session.setAttribute("theWater",wa);
       }
    catch(NumberFormatException e){
        session.setAttribute("theWater", 0);
        out.println("<br>Bad number format at water field!<br>Please give an integer at this field");
         }
  }
%>  
    


    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <h4>Eshop</h4>
    
    <form name="input form" method="post" action="index.jsp">
        
    <table border="2" cellspacing="0" cellpadding="7"> 
    <tr>
      <th>Item</th>
      <th>Price</th>
      <th>Quantity</th>
      <th>Total</th>
    </tr>
    <tr>
      <td>Cafe</td>
      <td>     
          <% 
        out.println(cafe.getPrice()); 
        float getcafe=Float.parseFloat(cafe.getPrice());
  
        %> 

        </td>
      <td><input type="text" name="cafeQuantity"  size="7" value="<%=(Integer)session.getAttribute("theCafe")%>" /></td>
      <td><% out.println(((Integer)session.getAttribute("theCafe"))*(getcafe)); %></td>
    </tr>
    <tr>
      <td>Sugar</td>
      <td><% 
        out.println(sugar.getPrice()); 
        float getsugar=Float.parseFloat(sugar.getPrice());
        %>
      </td>
      <td><input type="text" name="sugarQuantity" size="7" value="<%=(Integer)session.getAttribute("theSugar")%>" /></td>
      <td><% out.println(((Integer)session.getAttribute("theSugar"))*(getsugar)); %></td>
    </tr>
    <tr>
      <td>Water</td>
      <td><%  
        out.println(water.getPrice());
        float getwater=Float.parseFloat(water.getPrice());
            %>
      </td>
      <td><input type="text" name="WaterQuantity" size="7" value="<%=(Integer)session.getAttribute("theWater")%>" /></td>
      <td><% out.println(((Integer)session.getAttribute("theWater"))*(getwater)); %></td>
    </tr>
    <tr>
      <td>Total</td>
      <td></td>
      <td></td>
      <td><% float total;
                total=((((Integer)session.getAttribute("theCafe"))*(getcafe)) + (((Integer)session.getAttribute("theSugar"))*(getsugar)) + (((Integer)session.getAttribute("theWater"))*(getwater)));
      
      out.println(total);  %></td>
    </tr>

    </table>

    <input type="submit"  value="CHECK" name="CHECK"  />
    </form>
    
    
   
</html>
