using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GTnguoigiupviec
{
    public partial class Ungtuyen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadDanhSachBaiDang();
        }

        private void LoadDanhSachBaiDang()
        {
            string connStr = ConfigurationManager.ConnectionStrings["connStr"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "SELECT maBD, tieuDe, noiDung, ngayDang FROM BaiDang WHERE trangThai = N'chấp nhận'";
                SqlDataAdapter da = new SqlDataAdapter(sql, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvBaiDang.DataSource = dt;
                gvBaiDang.DataBind();
            }
        }

        protected void gvBaiDang_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "UngTuyen")
            {
                string maBD = e.CommandArgument.ToString();
                string maNGV = Session["maNGV"]?.ToString();

                if (string.IsNullOrEmpty(maNGV))
                {
                    ShowAlert("Bạn cần đăng nhập với tư cách người giúp việc.");
                    return;
                }

                string connStr = ConfigurationManager.ConnectionStrings["connStr"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();

                   
                    string checkSql = "SELECT COUNT(*) FROM UngTuyen WHERE maBD = @maBD AND maNGV = @maNGV";
                    SqlCommand checkCmd = new SqlCommand(checkSql, conn);
                    checkCmd.Parameters.AddWithValue("@maBD", maBD);
                    checkCmd.Parameters.AddWithValue("@maNGV", maNGV);
                    int exists = (int)checkCmd.ExecuteScalar();

                    if (exists > 0)
                    {
                        ShowAlert("Bạn đã ứng tuyển bài đăng này trước đó.");
                        return;
                    }

                
                    string maUT = "UT" + DateTime.Now.Ticks.ToString().Substring(10);
                    string insertSql = "INSERT INTO UngTuyen (maUngTuyen, maBD, maNGV, ngayUngTuyen, trangThai) " +
                                       "VALUES (@maUT, @maBD, @maNGV, GETDATE(), N'Chờ duyệt')";

                    SqlCommand cmd = new SqlCommand(insertSql, conn);
                    cmd.Parameters.AddWithValue("@maUT", maUT);
                    cmd.Parameters.AddWithValue("@maBD", maBD);
                    cmd.Parameters.AddWithValue("@maNGV", maNGV);
                    cmd.ExecuteNonQuery();

                    ShowAlert("Ứng tuyển thành công!");
                }
            }
        }

        private void ShowAlert(string message)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage",
                $"alert('{message}');", true);
        }
    }
}
