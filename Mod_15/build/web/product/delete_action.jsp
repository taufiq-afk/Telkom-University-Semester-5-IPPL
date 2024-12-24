<%-- 
    Document   : delete
    Created on : 22 Dec 2024, 19.51.17
    Author     : Fiqq``
--%>

<%@ page import="java.sql.*" %>
<%@ page import="classes.JDBC" %>
<%
    String idBarang = request.getParameter("id_barang");
    
    if (idBarang != null && !idBarang.isEmpty()) {        
        JDBC db = new JDBC();
        String query = "DELETE FROM barang WHERE id_barang = ?";
        try {            
            PreparedStatement stmt = db.con.prepareStatement(query);
            stmt.setInt(1, Integer.parseInt(idBarang));
                        
            int rowsAffected = stmt.executeUpdate();
            
            if (rowsAffected > 0) {
                response.sendRedirect("view.jsp?status=success");
            } else {
                response.sendRedirect("view.jsp?status=not_found");
            }
        } catch (SQLException e) {
            response.sendRedirect("view.jsp?status=error");
            e.printStackTrace();
        }
    } else {
        response.sendRedirect("view.jsp?status=invalid_id");
    }
%>