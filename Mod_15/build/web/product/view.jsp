<%@ page import="java.sql.*" %>
<%@ page import="classes.JDBC" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%    
    HttpSession userSession = request.getSession(false);
    if (userSession == null || userSession.getAttribute("username") == null) {        
        response.sendRedirect("login.jsp");
        return;
    } else {        
        String username = (String) userSession.getAttribute("username");        
    }
%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Barang</title>
    <!-- Link ke Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
</head>
<body>
    <div class="container mt-5">
        <h1>Data Barang</h1>
        <table class="table table-bordered mt-3">
            <thead>
                <tr>
                    <th>ID Barang</th>
                    <th>Nama Barang</th>
                    <th>Kategori</th>
                    <th>Harga</th>
                    <th>Stok</th>
                    <th>Aksi</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    JDBC db = new JDBC();
                    ResultSet rs = null;
                    String query = "SELECT * FROM barang";
                    try {
                        rs = db.stmt.executeQuery(query);
                        while (rs.next()) {
                            int id = rs.getInt("id_barang");
                            String nama = rs.getString("nama_barang");
                            String kategori = rs.getString("kategori_barang");
                            double harga = rs.getDouble("harga_barang");
                            int stok = rs.getInt("stok_barang");
                %>
                <tr>
                    <td><%= id %></td>
                    <td><%= nama %></td>
                    <td><%= kategori %></td>
                    <td><%= harga %></td>
                    <td><%= stok %></td>
                    <td>
                        <a href="edit.jsp?id=<%= id %>" class="btn btn-warning" style="display: inline-block; margin-right: 5px;">Edit</a>
                        <form id="deleteForm<%= id %>" action="delete_action.jsp" method="POST" style="display: inline-block; margin-bottom: 0;">
                            <input type="hidden" name="id_barang" value="<%= id %>" />
                            <button type="button" class="btn btn-danger" onclick="confirmDelete(<%= id %>)">Delete</button>
                        </form>
                    </td>
                </tr>
                <%
                        }
                    } catch (SQLException e) {
                        out.println("Error: " + e.getMessage());
                    }
                %>
            </tbody>
        </table>
        <div class="mt-4">
            <a href="../index.jsp" class="btn btn-secondary">Kembali ke Halaman Utama</a>
            <a href="add.jsp" class="btn btn-success">Tambah Barang Baru</a>
        </div>        
    </div>          
    <!-- Link ke Bootstrap JS dan dependensi -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>        
        function confirmDelete(id) {
            Swal.fire({
                title: 'Apakah Anda yakin?',
                text: "Data ini akan dihapus secara permanen!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#d33',
                cancelButtonColor: '#3085d6',
                confirmButtonText: 'Ya, hapus!',
                cancelButtonText: 'Batal'
            }).then((result) => {
                if (result.isConfirmed) {                    
                    document.getElementById('deleteForm' + id).submit();
                }
            });
        }
    </script>
</body>
</html>