<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Danhsachungtuyen.aspx.cs" Inherits="GTnguoigiupviec.Danhsachungtuyen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <asp:DropDownList ID="ddlBaiDang" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlBaiDang_SelectedIndexChanged" />
<br /><br />
<asp:GridView ID="gvUngTuyen" runat="server" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField DataField="maUngTuyen" HeaderText="Mã Ứng Tuyển" />
        <asp:BoundField DataField="hoTen" HeaderText="Họ Tên NGV" />
        <asp:BoundField DataField="ngayUngTuyen" HeaderText="Ngày Ứng Tuyển" />
        <asp:BoundField DataField="trangThai" HeaderText="Trạng Thái" />
    </Columns>
</asp:GridView>
        </div>
    </form>
</body>
</html>
