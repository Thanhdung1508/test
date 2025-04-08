using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GTnguoigiupviec
{
    public partial class Danhsachungtuyen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBaiDang();
            }
        }
        private void LoadBaiDang()
        {
            // Gán tạm mã người thuê
            Session["maNT"] = "nt001";
            string maNT = Session["maNT"].ToString();

            string connStr = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"SELECT bd.maBD, bd.tieuDe
                         FROM BaiDang bd
                         JOIN YeuCauDichVu yc ON bd.maYCDV = yc.maYCDV
                         WHERE yc.maNT = @maNT";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@maNT", maNT);
                conn.Open();

                ddlBaiDang.DataSource = cmd.ExecuteReader();
                ddlBaiDang.DataTextField = "tieuDe";
                ddlBaiDang.DataValueField = "maBD";
                ddlBaiDang.DataBind();

                ddlBaiDang.Items.Insert(0, new ListItem("-- Chọn bài đăng --", ""));
            }
        }

        protected void ddlBaiDang_SelectedIndexChanged(object sender, EventArgs e)
        {
            string maBD = ddlBaiDang.SelectedValue;
            if (!string.IsNullOrEmpty(maBD))
            {
                LoadUngTuyen(maBD);
            }
            else
            {
                gvUngTuyen.DataSource = null;
                gvUngTuyen.DataBind();
            }
        }

        private void LoadUngTuyen(string maBD)
        {
            string connStr = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"
            SELECT ut.maUngTuyen, ngv.hoTen, ut.ngayUngTuyen, ut.trangThai
            FROM UngTuyen ut
            JOIN NguoiGiupViec ngv ON ut.maNGV = ngv.maNGV
            WHERE ut.maBD = @maBD";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@maBD", maBD);
                conn.Open();

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvUngTuyen.DataSource = dt;
                gvUngTuyen.DataBind();
            }
        }
    }
}