<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ungtuyen.aspx.cs" Inherits="GTnguoigiupviec.Ungtuyen" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ứng tuyển bài đăng</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            padding: 30px;
        }

        .container {
            background-color: #ffffff;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            max-width: 1000px;
            margin: auto;
        }

        h2 {
            text-align: center;
            color: #007bff;
            margin-bottom: 20px;
        }

        .aspNet-GridView {
            width: 100%;
            border-collapse: collapse;
        }

        .aspNet-GridView th {
            background-color: #007bff;
            color: white;
            padding: 12px;
        }

        .aspNet-GridView td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        .btn-ungtuyen {
            background-color: #28a745;
            color: white;
            padding: 6px 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-ungtuyen:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Danh sách bài đăng đã được chấp nhận</h2>
            <asp:GridView ID="gvBaiDang" runat="server" AutoGenerateColumns="False"
                CssClass="aspNet-GridView"
                OnRowCommand="gvBaiDang_RowCommand">
                <Columns>
                    <asp:BoundField DataField="maBD" HeaderText="Mã Bài Đăng" />
                    <asp:BoundField DataField="tieuDe" HeaderText="Tiêu đề" />
                    <asp:BoundField DataField="noiDung" HeaderText="Nội dung" />
                    <asp:BoundField DataField="ngayDang" HeaderText="Ngày đăng" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:TemplateField HeaderText="Ứng tuyển">
                        <ItemTemplate>
                            <asp:Button ID="btnUngTuyen" runat="server" Text="Ứng tuyển"
                                CssClass="btn-ungtuyen"
                                CommandName="UngTuyen"
                                CommandArgument='<%# Eval("maBD") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
