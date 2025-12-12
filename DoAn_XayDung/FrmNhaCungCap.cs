using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace DoAn_XayDung_V1._0
{
    public partial class FrmNhaCungCap : Form
    {
        SqlConnection conn = new SqlConnection("Data Source=AnhNguyeen;Initial Catalog=CongTyXayDung;Integrated Security=True");
        public FrmNhaCungCap()
        {
            InitializeComponent();
        }
        private string identity()
        {
            string sql = "SELECT TOP 1 MaNCC FROM NhaCungCap ORDER BY MaNCC DESC";
            string newID = "";
            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sql, conn);
                object result = cmd.ExecuteScalar();

                newID = "NCC001";

                if (result != null)
                {
                    string lastID = result.ToString();
                    int number = int.Parse(lastID.Substring(3));
                    number++;
                    newID = "NCC" + number.ToString("000");
                }
                
            }catch (Exception ex)
            {
                return null;
            }
            finally
            {
                conn.Close();
            }
            return newID;
        }
        private void layDSNhaCungCap()
        {
            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "sp_LayDSNhaCungCap";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conn;

                DataTable dt = new DataTable();
                SqlDataAdapter ad = new SqlDataAdapter(cmd);

                ad.Fill(dt);
                dgvNhaCungCap.DataSource = dt;
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

        private void dgvNhaCungCap_Click(object sender, EventArgs e)
        {
            try
            {
                int index = dgvNhaCungCap.CurrentCell.RowIndex;

                txtMaNCC.Text = dgvNhaCungCap.Rows[index].Cells[0].Value.ToString();
                txtTenNCC.Text = dgvNhaCungCap.Rows[index].Cells[1].Value.ToString();
                txtSdtNCC.Text = dgvNhaCungCap.Rows[index].Cells[2].Value.ToString();
                txtEmailNCC.Text = dgvNhaCungCap.Rows[index].Cells[3].Value.ToString();
                txtDiaChiNCC.Text = dgvNhaCungCap.Rows[index].Cells[4].Value.ToString();
                txtLoaiHinhNCC.Text = dgvNhaCungCap.Rows[index].Cells[5].Value.ToString();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi"+ ex.Message, "Thông Báo");
            }
        }

        private void FrmNhaCungCap_Load(object sender, EventArgs e)
        {
            layDSNhaCungCap();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            string newID = identity();
            try
            {
                conn.Open();


                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "sp_ThemNhaCungCap";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection= conn;

                cmd.Parameters.AddWithValue("@maNCC", newID);
                cmd.Parameters.AddWithValue("@tenNCC", txtTenNCC.Text);
                cmd.Parameters.AddWithValue("@sdt", txtSdtNCC.Text);
                cmd.Parameters.AddWithValue("@email", txtEmailNCC.Text);
                cmd.Parameters.AddWithValue("@diaChi", txtDiaChiNCC.Text);
                cmd.Parameters.AddWithValue("@loaiHinh", txtLoaiHinhNCC.Text);

                if(cmd.ExecuteNonQuery() > 0)
                {
                    MessageBox.Show("Thêm nhà cung cấp thành công", "Thông báo");
                }
                else
                {
                    MessageBox.Show("Thêm nhà cung cấp không thành công", "Thông báo");
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
            layDSNhaCungCap();
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "sp_SuaNhaCungCap";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conn;

                cmd.Parameters.AddWithValue("@maNCC", txtMaNCC.Text);
                cmd.Parameters.AddWithValue("@tenNCC", txtTenNCC.Text);
                cmd.Parameters.AddWithValue("@sdt", txtSdtNCC.Text);
                cmd.Parameters.AddWithValue("@email", txtEmailNCC.Text);
                cmd.Parameters.AddWithValue("@diaChi", txtDiaChiNCC.Text);
                cmd.Parameters.AddWithValue("@loaiHinh", txtLoaiHinhNCC.Text);

                if (cmd.ExecuteNonQuery() > 0)
                {
                    MessageBox.Show("Sửa nhà cung cấp thành công", "Thông báo");
                    txtMaNCC.Clear();
                    txtTenNCC.Clear();
                    txtSdtNCC.Clear();
                    txtEmailNCC.Clear();
                    txtDiaChiNCC.Clear();
                    txtLoaiHinhNCC.Clear();
                    txtMaNCC.Focus();
                }
                else
                {
                    MessageBox.Show("Sửa nhà cung cấp không thành công", "Thông báo");
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
            layDSNhaCungCap();
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "sp_XoaNhaCungCap";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conn;

                cmd.Parameters.AddWithValue("@maNCC", txtMaNCC.Text);

                if (cmd.ExecuteNonQuery() > 0)
                {
                    MessageBox.Show("Xóa nhà cung cấp thành công", "Thông báo");
                }
                else
                {
                    MessageBox.Show("Xóa nhà cung cấp không thành công", "Thông báo");
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
            layDSNhaCungCap();
        }
    }
}
