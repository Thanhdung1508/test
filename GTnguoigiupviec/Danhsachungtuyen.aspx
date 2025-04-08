<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Danhsachungtuyen.aspx.cs" Inherits="GTnguoigiupviec.Danhsachungtuyen" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Danh sách ứng tuyển</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f6f9;
            padding: 30px;
        }

        .container {
            background-color: #fff;
            max-width: 1000px;
            margin: auto;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 25px;
        }

        .dropdown-container {
            margin-bottom: 20px;
            text-align: center;
        }

        .dropdown-container select {
            padding: 8px 12px;
            font-size: 16px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        .aspNet-GridView {
            width: 100%;
            border-collapse: collapse;
        }

        .aspNet-GridView th {
            background-color: #007bff;
            color: white;
            padding: 10px;
        }

        .aspNet-GridView td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            
            <h2>Danh sách người giúp việc đã ứng tuyển</h2>

            <div class="dropdown-container">
                <asp:DropDownList ID="ddlBaiDang" runat="server" AutoPostBack="true" 
                                  OnSelectedIndexChanged="ddlBaiDang_SelectedIndexChanged" />
            </div>

            <asp:GridView ID="gvUngTuyen" runat="server" AutoGenerateColumns="false" 
                          CssClass="aspNet-GridView">
                <Columns>
                    <asp:BoundField DataField="maUngTuyen" HeaderText="Mã Ứng Tuyển" />
                    <asp:BoundField DataField="hoTen" HeaderText="Họ Tên NGV" />
                    <asp:BoundField DataField="ngayUngTuyen" HeaderText="Ngày Ứng Tuyển" 
                                    DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="trangThai" HeaderText="Trạng Thái" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
