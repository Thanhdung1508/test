<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ungtuyen.aspx.cs" Inherits="GTnguoigiupviec.Ungtuyen" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ứng tuyển bài đăng</title>
</head>
<body>
    <form id="form1" runat="server">

        <asp:GridView ID="gvBaiDang" runat="server" AutoGenerateColumns="False" OnRowCommand="gvBaiDang_RowCommand">
            <Columns>
                <asp:BoundField DataField="maBD" HeaderText="Mã Bài Đăng" />
                <asp:BoundField DataField="tieuDe" HeaderText="Tiêu đề" />
                <asp:BoundField DataField="noiDung" HeaderText="Nội dung" />
                <asp:BoundField DataField="ngayDang" HeaderText="Ngày đăng" DataFormatString="{0:dd/MM/yyyy}" />
                <asp:TemplateField HeaderText="Ứng tuyển">
                    <ItemTemplate>
                        <asp:Button ID="btnUngTuyen" runat="server" Text="Ứng tuyển"
                            CommandName="UngTuyen"
                            CommandArgument='<%# Eval("maBD") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
       </asp:GridView>

    </form>
</body>
</html>
