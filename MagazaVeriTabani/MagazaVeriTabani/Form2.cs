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

namespace MagazaVeriTabani
{
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }
        SqlConnection baglanti = new SqlConnection("Data Source=DESKTOP-5MG088C\\MSSQL12;Initial Catalog=VeriTabaniMagazaProje;Integrated Security=True");
        private void Form2_Load(object sender, EventArgs e)
        {
        }

        private void button1_Click(object sender, EventArgs e)
        {
            String pk, ps;
            pk = textBox1.Text;
            ps = textBox2.Text;
            DataTable dt = new DataTable();
            baglanti.Open();
            SqlCommand komut = new SqlCommand();
            komut.CommandType = CommandType.StoredProcedure;
            komut.Parameters.AddWithValue("@personel_kullanici", pk);
            komut.Parameters.AddWithValue("@personel_sifre ", ps);
            komut.CommandText = "PersonelGirisKontrol";
            komut.Connection = baglanti;
            //dt.Load(komut.ExecuteReader());
            SqlDataReader dr;
            dr = komut.ExecuteReader();
            if (dr.Read())
            {
                MessageBox.Show("Giriş Başarılı");
                Form1 form1 = new Form1();
                form1.Show();
                this.Hide();
            }
            else
            {
                MessageBox.Show("Kullanıcı Adı Veya Şifre Hatalı");
            }
            komut.Parameters.Clear();
            baglanti.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Form1 form1 = new Form1();
            form1.Show();
            this.Hide();
        }
    }
}
