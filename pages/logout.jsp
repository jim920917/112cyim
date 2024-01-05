<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*"%>

<% 
session.removeAttribute("access");
session.removeAttribute("username");
response.sendRedirect("index.jsp") ;
%>