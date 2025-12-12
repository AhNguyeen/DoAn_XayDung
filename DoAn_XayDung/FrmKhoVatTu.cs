using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DoAn_XayDung_V1._0
{
    public partial class FrmKhoVatTu : Form
    {
        SqlConnection conn = new SqlConnection("Data Source=AnhNguyeen;Initial Catalog=CongTyXayDung;Integrated Security=True");
        public FrmKhoVatTu()
        {
            InitializeComponent();
        }

        private void layDSKhoVatTu()
        {
            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "sp_LayDSKhoVatTu";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conn;

                DataTable dt = new DataTable();
                SqlDataAdapter ad = new SqlDataAdapter(cmd);

                ad.Fill(dt);
                dgvKhoVatTu.DataSource = dt;
            }
            catch
            {
                MessageBox.Show("Không thể hiển thị dữ liệu", "Thông Báo");
            }
            finally
            {
                conn.Close();
            }
        }

        private string identity()
        {
            string sql = "SELECT TOP 1 MaVatTu FROM KhoVatTu ORDER BY MaVatTu DESC";
            string newID = "";
            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sql, conn);
                object result = cmd.ExecuteScalar();

                newID = "VT001";

                if (result != null)
                {
                    string lastID = result.ToString();
                    int number = int.Parse(lastID.Substring(3));
                    number++;
                    newID = "VT" + number.ToString("000");
                }

            }
            catch (Exception ex)
            {
                return null;
            }
            finally
            {
                conn.Close();
            }
            return newID;
        }
        private void FrmKhoVatTu_Load(object sender, EventArgs e)
        {
            layDSKhoVatTu();
        }

        private void dgvKhoVatTu_Click(object sender, EventArgs e)
        {
            try
            {
                int index = dgvKhoVatTu.CurrentCell.RowIndex;

                txtMaVT.Text = dgvKhoVatTu.Rows[index].Cells[0].Value.ToString();
                txtTenVT.Text = dgvKhoVatTu.Rows[index].Cells[1].Value.ToString();
                cbBDonVi.SelectedItem = dgvKhoVatTu.Rows[index].Cells[2].Value.ToString();
                txtBoxMoTa.Text = dgvKhoVatTu.Rows[index].Cells[3].Value.ToString();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi "+ ex.Message, "Thông Báo");
            }
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            string newID = identity();
            try
            {
                conn.Open();


                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "sp_ThemKhoVatTu";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conn;

                cmd.Parameters.AddWithValue("@maVatTu", newID);
                cmd.Parameters.AddWithValue("@tenVatTu", txtTenVT.Text);
                cmd.Parameters.AddWithValue("@donViTinh", cbBDonVi.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@moTa", txtBoxMoTa.Text);
                if (cmd.ExecuteNonQuery() > 0)
                {
                    MessageBox.Show("Thêm thiết bị vật tư thành công", "Thông báo");
                }
                else
                {
                    MessageBox.Show("Thêm thiết bị vật tư không thành công", "Thông báo");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi" + ex.Message, "Thông báo");
            }
            finally
            {
                conn.Close();
            }
            layDSKhoVatTu();
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            try
            {
                conn.Open();


                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "sp_SuaKhoVatTu";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conn;

                cmd.Parameters.AddWithValue("@maVatTu", txtMaVT.Text);
                cmd.Parameters.AddWithValue("@tenVatTu", txtTenVT.Text);
                cmd.Parameters.AddWithValue("@donViTinh", cbBDonVi.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@moTa", txtBoxMoTa.Text);
                if (cmd.ExecuteNonQuery() > 0)
                {
                    MessageBox.Show("Sửa thiết bị vật tư thành công", "Thông báo");
                }
                else
                {
                    MessageBox.Show("Sửa thiết bị vật tư không thành công", "Thông báo");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi" + ex.Message, "Thông báo");
            }
            finally
            {
                conn.Close();
            }
            layDSKhoVatTu();
        }
    }
}
