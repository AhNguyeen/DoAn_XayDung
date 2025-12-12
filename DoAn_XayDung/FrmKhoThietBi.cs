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
    public partial class FrmKhoThietBi : Form
    {
        SqlConnection conn = new SqlConnection("Data Source=AnhNguyeen;Initial Catalog=CongTyXayDung;Integrated Security=True");
        public FrmKhoThietBi()
        {
            InitializeComponent();
        }

        private string identity()
        {
            string sql = "SELECT TOP 1 MaThietBi FROM KhoThietBi ORDER BY MaThietBi DESC";
            string newID = "";
            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sql, conn);
                object result = cmd.ExecuteScalar();

                newID = "TB001";

                if (result != null)
                {
                    string lastID = result.ToString();
                    int number = int.Parse(lastID.Substring(3));
                    number++;
                    newID = "TB" + number.ToString("000");
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
        private void layDSThietBi()
        {
            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "sp_LayDSKhoThietBi";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conn;

                DataTable dt = new DataTable();
                SqlDataAdapter ad = new SqlDataAdapter(cmd);

                ad.Fill(dt);
                dgvKhoThietBi.DataSource = dt;
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

        private void FrmKhoThietBi_Load(object sender, EventArgs e)
        {
            layDSThietBi();
        }

        private void dgvKhoThietBi_Click(object sender, EventArgs e)
        {
            try
            {
                int index = dgvKhoThietBi.CurrentCell.RowIndex;

                txtMaTB.Text = dgvKhoThietBi.Rows[index].Cells[0].Value.ToString();
                txtTenTB.Text = dgvKhoThietBi.Rows[index].Cells[1].Value.ToString();
                txtSoSR.Text = dgvKhoThietBi.Rows[index].Cells[2].Value.ToString();
                cboTrTh.SelectedItem = dgvKhoThietBi.Rows[index].Cells[3].Value.ToString();

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
                cmd.CommandText = "sp_ThemKhoThietBi";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conn;

                cmd.Parameters.AddWithValue("@maThietBi", newID);
                cmd.Parameters.AddWithValue("@tenThietBi", txtTenTB.Text);
                cmd.Parameters.AddWithValue("@soSeri", txtSoSR.Text);
                cmd.Parameters.AddWithValue("@trangThai", cboTrTh.SelectedItem.ToString());

                if (cmd.ExecuteNonQuery() > 0)
                {
                    MessageBox.Show("Thêm thiết bị thành công", "Thông báo");
                }
                else
                {
                    MessageBox.Show("Thêm thiết bị không thành công", "Thông báo");
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
            layDSThietBi();
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "sp_SuaKhoThietBi";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conn;

                cmd.Parameters.AddWithValue("@maThietBi", txtMaTB.Text);
                cmd.Parameters.AddWithValue("@tenThietBi", txtTenTB.Text);
                cmd.Parameters.AddWithValue("@soSeri", txtSoSR.Text);
                cmd.Parameters.AddWithValue("@trangThai", cboTrTh.SelectedItem.ToString());

                if (cmd.ExecuteNonQuery() > 0)
                {
                    MessageBox.Show("Sửa thiết bị thành công", "Thông báo");
                }
                else
                {
                    MessageBox.Show("Sửa thiết bị không thành công", "Thông báo");
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
            layDSThietBi();
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "sp_XoaKhoThietBi";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conn;

                cmd.Parameters.AddWithValue("@maThietBi", txtMaTB.Text);

                if (cmd.ExecuteNonQuery() > 0)
                {
                    MessageBox.Show("Xóa thiết bị thành công", "Thông báo");
                }
                else
                {
                    MessageBox.Show("Xóa thiết bị không thành công", "Thông báo");
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
            layDSThietBi();
        }
    }
}
