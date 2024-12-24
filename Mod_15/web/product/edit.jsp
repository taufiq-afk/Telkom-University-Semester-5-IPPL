<%@ page import="java.sql.*" %>
<%@ page import="classes.JDBC" %>
<%
    String id = request.getParameter("id");
    JDBC db = new JDBC();
    ResultSet rs = null;
    String query = "SELECT * FROM barang WHERE id_barang = ?";
    try {
        PreparedStatement stmt = db.con.prepareStatement(query);
        stmt.setInt(1, Integer.parseInt(id));
        rs = stmt.executeQuery();
        if (rs.next()) {
            String nama = rs.getString("nama_barang");
            String kategori = rs.getString("kategori_barang");
            double harga = rs.getDouble("harga_barang");
            int stok = rs.getInt("stok_barang");
%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Barang</title>
    <!-- Link ke Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1>Edit Barang</h1>
        <form action="edit_action.jsp" method="post">
            <input type="hidden" name="id_barang" value="<%= id %>">
            <div class="mb-3">
                <label for="nama_barang" class="form-label">Nama Barang</label>
                <input type="text" class="form-control" name="nama_barang" id="nama_barang" value="<%= nama %>" required>
            </div>
            <div class="mb-3">
                <label for="kategori_barang" class="form-label">Kategori Barang</label>
                <input type="text" class="form-control" name="kategori_barang" id="kategori_barang" value="<%= kategori %>" required>
            </div>
            <div class="mb-3">
                <label for="harga_barang" class="form-label">Harga Barang</label>
                <input type="number" class="form-control" name="harga_barang" id="harga_barang" step="0.01" value="<%= harga %>" required>
            </div>
            <div class="mb-3">
                <label for="stok_barang" class="form-label">Stok Barang</label>
                <input type="number" class="form-control" name="stok_barang" id="stok_barang" value="<%= stok %>" required>
            </div>
            <button type="submit" class="btn btn-warning">Simpan Perubahan</button>
        </form>
        <a href="view.jsp" class="btn btn-secondary mt-3">Kembali ke Lihat Barang</a>
    </div>

    <!-- Link ke Bootstrap JS dan dependensi -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<%
        }
    } catch (SQLException e) {
        out.println("Error: " + e.getMessage());
    }
%>
