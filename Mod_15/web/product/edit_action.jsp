<%-- 
    Document   : edit_action
    Created on : 8 Dec 2024, 00.34.22
    Author     : Fiqq``
--%>

<%@ page import="java.sql.*" %>
<%@ page import="classes.JDBC" %>
<%
    String id = request.getParameter("id_barang");
    String nama = request.getParameter("nama_barang");
    String kategori = request.getParameter("kategori_barang");
    double harga = Double.parseDouble(request.getParameter("harga_barang"));
    int stok = Integer.parseInt(request.getParameter("stok_barang"));
    
    JDBC db = new JDBC();
    String query = "UPDATE barang SET nama_barang = ?, kategori_barang = ?, harga_barang = ?, stok_barang = ? WHERE id_barang = ?";
    try {
        PreparedStatement stmt = db.con.prepareStatement(query);
        stmt.setString(1, nama);
        stmt.setString(2, kategori);
        stmt.setDouble(3, harga);
        stmt.setInt(4, stok);
        stmt.setInt(5, Integer.parseInt(id));
        int rowsAffected = stmt.executeUpdate();
        if (rowsAffected > 0) {
            response.sendRedirect("view.jsp");
        } else {
            out.println("Gagal mengupdate barang");
        }
    } catch (SQLException e) {
        out.println("Error: " + e.getMessage());
    }
%>

