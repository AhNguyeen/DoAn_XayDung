using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DoAn_XayDung_V1._0
{
    public partial class FrmMenu : Form
    {
        private Form currentChildForm;
        private Button currentBtn;
        public FrmMenu()
        {
            InitializeComponent();
        }
        //Hàm gọi from bất kỳ from con
        private void OpenChildForm(Form childForm)
        {
            //Khi bật Form khác thì Form kia sẽ đóng lại
            if (currentChildForm != null)
            {
                currentChildForm.Close();
            }

            currentChildForm = childForm;
            childForm.TopLevel = false;
            childForm.FormBorderStyle = FormBorderStyle.None;
            childForm.Dock = DockStyle.Fill;

            pnlMenu.Controls.Add(childForm);
            pnlMenu.Tag = childForm;

            childForm.BringToFront();
            childForm.Show();
        }
        private void ActivateButton(object senderBtn)
        {
            if(senderBtn != null)
            {
                DisableButton();

                currentBtn = (Button)senderBtn;

                currentBtn.BackColor = Color.SaddleBrown;
                currentBtn.ForeColor = Color.White;
            }
        }
        private void DisableButton()
        {
            if(currentBtn != null)
            {
                currentBtn.BackColor = Color.FromArgb(224, 133, 67);
                currentBtn.ForeColor = Color.FromArgb(64, 64, 64);
            }
        }
        private void FrmMenu_Load(object sender, EventArgs e)
        {

        }

        private void btnDangXuat_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void FrmMenu_FormClosing(object sender, FormClosingEventArgs e)
        {
            DialogResult r;
            r = MessageBox.Show("Bạn có muốn đăng xuất không ?", "Thông Báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button1);
            if(r == DialogResult.No)
            {
                e.Cancel = true;
            }
        }

        private void btnChucVu_Click(object sender, EventArgs e)
        {
            ActivateButton(sender);
            OpenChildForm(new FrmChucVu());
        }

        private void btnPhongBan_Click(object sender, EventArgs e)
        {
            ActivateButton(sender);
            OpenChildForm(new FrmPhongBan());
        }

        private void btnNhanVien_Click(object sender, EventArgs e)
        {
            ActivateButton(sender);
            OpenChildForm(new FrmNhanVien());
        }

        private void btnDuAn_Click(object sender, EventArgs e)
        {
            ActivateButton(sender);
            OpenChildForm(new FrmDuAn());
        }

        private void btnPhanCong_Click(object sender, EventArgs e)
        {
            ActivateButton(sender);
            OpenChildForm(new FrmPhanCong());
        }

        private void btnKhachHang_Click(object sender, EventArgs e)
        {
            ActivateButton(sender);
            OpenChildForm(new FrmKhachHang());
        }

        private void btnNhaCungCap_Click(object sender, EventArgs e)
        {
            ActivateButton(sender);
            OpenChildForm(new FrmNhaCungCap());
        }

        private void btnKhoThietBi_Click(object sender, EventArgs e)
        {
            ActivateButton(sender);
            OpenChildForm(new FrmKhoThietBi());
        }

        private void btnKhoVatTu_Click(object sender, EventArgs e)
        {
            ActivateButton(sender);
            OpenChildForm(new FrmKhoVatTu());
        }

        private void btnThongTin_Click(object sender, EventArgs e)
        {
            ActivateButton(sender);
            OpenChildForm(new FrmThongTinDonHang());
        }

        private void btnChiTiet_Click(object sender, EventArgs e)
        {
            ActivateButton(sender);
            OpenChildForm(new FrmChiTietHoaDonNhapHang());
        }

        private void pnlMenu_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
