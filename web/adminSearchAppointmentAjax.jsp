<%-- 
    Document   : adminSearchAppointmentAjax
    Created on : Jan 23, 2017, 9:29:23 AM
    Author     : -D-
--%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Conn Conn = new Conn();
    String pmiNo = request.getParameter("pmiNo").toString();
    String icNo = request.getParameter("icNo").toString();
    String idNo = request.getParameter("idNo").toString();
//    String pmiNo = "9504050251851";
//    String icNo = "";
//    String idNo = "";
    
  String sql = "SELECT * "
 + "FROM pms_patient_biodata "
 + "WHERE PMI_NO='"+pmiNo+"' OR NEW_IC_NO = '"+icNo+"' OR ID_NO = '"+idNo+"'";
ArrayList<ArrayList<String>> dataPatient = Conn.getData(sql);

out.print(dataPatient.get(0).get(0)+"|"+dataPatient.get(0).get(2)+"|"+dataPatient.get(0).get(7)+"|"+dataPatient.get(0).get(4));

    
%>

