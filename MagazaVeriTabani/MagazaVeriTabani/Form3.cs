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
    public partial class Form3 : Form
    {
        public Form3()
        {
            InitializeComponent();
        }
        SqlConnection baglanti = new SqlConnection("Data Source=DESKTOP-5MG088C\\MSSQL12;Initial Catalog=VeriTabaniMagazaProje;Integrated Security=True");
        private void Form3_Load(object sender, EventArgs e)
        {
            SqlCommand komut = new SqlCommand("Select * From PersonelGrup", baglanti);
            SqlDataReader dr;
            baglanti.Open();
            dr = komut.ExecuteReader();
            while (dr.Read())
            {
                comboBox1.Items.Add(dr["grup_ad"]);
            }
            baglanti.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            String personel_ad, personel_soyad, personel_telefon;
            int personel_grup;
            personel_ad = textBox1.Text;
            personel_soyad = textBox2.Text;
            personel_telefon = textBox3.Text;
            personel_grup = (comboBox1.SelectedIndex + 1);
            baglanti.Open();
            SqlCommand komut = new SqlCommand();
            komut.CommandType = CommandType.StoredProcedure;
            komut.Parameters.AddWithValue("@personel_ad",personel_ad);
            komut.Parameters.AddWithValue("@personel_soyad", personel_soyad);
            komut.Parameters.AddWithValue("@personel_telefon", personel_telefon);
            komut.Parameters.AddWithValue("@personel_personel_grup_id", personel_grup);
            komut.CommandText = "PersonelEkle";
            komut.Connection = baglanti;
            dt.Load(komut.ExecuteReader());
            komut.Parameters.Clear();
            baglanti.Close();
            MessageBox.Show("Personel Başarılı Bir Şekilde Eklendi.");
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Form1 form1 = new Form1();
            form1.Show();
            this.Hide();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            int urun_id, urun_stok;
            urun_id = Convert.ToInt32(textBox4.Text);
            urun_stok = Convert.ToInt32(textBox5.Text);
            baglanti.Open();
            SqlCommand komut = new SqlCommand();
            komut.CommandType = CommandType.StoredProcedure;
            komut.Parameters.AddWithValue("@urun_beden_renk_id",urun_id);
            komut.Parameters.AddWithValue("@urun_stok",urun_stok);
            komut.CommandText = "beginTranUrunStokGuncelle";
            komut.Connection = baglanti;
            dt.Load(komut.ExecuteReader());
            komut.Parameters.Clear();
            baglanti.Close();
            MessageBox.Show("Ürün Stoğu Başarılı Bir Şekilde Güncellendi");
        }
    }
}
