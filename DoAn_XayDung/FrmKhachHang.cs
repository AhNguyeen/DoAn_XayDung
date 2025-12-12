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
    public partial class FrmKhachHang : Form
    {
        SqlConnection conn = new SqlConnection("Data Source=AnhNguyeen;Initial Catalog=CongTyXayDung;Integrated Security=True");
        public FrmKhachHang()
        {
            InitializeComponent();
        }
        private string identity()
        {
            string sql = "SELECT TOP 1 MaKH FROM KhachHang ORDER BY MaKH DESC";
            string newID = "";
            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sql, conn);
                object result = cmd.ExecuteScalar();

                newID = "KH001";

                if (result != null)
                {
                    string lastID = result.ToString();
                    int number = int.Parse(lastID.Substring(3));
                    number++;
                    newID = "KH" + number.ToString("000");
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

        private void layDSKhachHang()
        {
            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "sp_LayDSKhachHang";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conn;

                DataTable dt = new DataTable();
                SqlDataAdapter ad = new SqlDataAdapter(cmd);

                ad.Fill(dt);
                dgvKhachHang.DataSource = dt;
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

        private void FrmKhachHang_Load(object sender, EventArgs e)
        {
            layDSKhachHang();
        }

        private void dgvKhachHang_Click(object sender, EventArgs e)
        {
            try
            {
                int index = dgvKhachHang.CurrentCell.RowIndex;

                txtMaKH.Text = dgvKhachHang.Rows[index].Cells[0].Value.ToString();
                txtTenKH.Text = dgvKhachHang.Rows[index].Cells[1].Value.ToString();
                txtSodtKH.Text = dgvKhachHang.Rows[index].Cells[2].Value.ToString();
                txtEmailKH.Text = dgvKhachHang.Rows[index].Cells[3].Value.ToString();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi" + ex.Message, "Thông Báo");
            }
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            string newID = identity();
            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "sp_ThemKhachHang";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conn;

                cmd.Parameters.AddWithValue("@makh", newID);
                cmd.Parameters.AddWithValue("@tenkh", txtTenKH.Text);
                cmd.Parameters.AddWithValue("@sdt", txtSodtKH.Text);
                cmd.Parameters.AddWithValue("@email", txtEmailKH.Text);

                if (cmd.ExecuteNonQuery() > 0)
                {
                    MessageBox.Show("Thêm khách hàng thành công", "Thông báo");
                }
                else
                {
                    MessageBox.Show("Thêm khách hàng không thành công", "Thông báo");
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
            layDSKhachHang();
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "sp_SuaKhachHang";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conn;

                cmd.Parameters.AddWithValue("@makh", txtMaKH.Text);
                cmd.Parameters.AddWithValue("@tenkh", txtTenKH.Text);
                cmd.Parameters.AddWithValue("@sdt", txtSodtKH.Text);
                cmd.Parameters.AddWithValue("@email", txtEmailKH.Text);

                if (cmd.ExecuteNonQuery() > 0)
                {
                    MessageBox.Show("Sửa thông tin khách hàng thành công", "Thông báo");
                }
                else
                {
                    MessageBox.Show("Sửa thông tin khách hàng không thành công", "Thông báo");
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
            layDSKhachHang();
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "sp_XoaKhachHang";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conn;

                cmd.Parameters.AddWithValue("@makh", txtMaKH.Text);

                if (cmd.ExecuteNonQuery() > 0)
                {
                    MessageBox.Show("Xóa khách hàng thành công", "Thông báo");
                }
                else
                {
                    MessageBox.Show("Xóa khách hàng không thành công", "Thông báo");
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
            layDSKhachHang();
        }
    }
}
