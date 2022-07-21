using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace MagazaVeriTabani
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        SqlConnection baglanti = new SqlConnection("Data Source=DESKTOP-5MG088C\\MSSQL12;Initial Catalog=VeriTabaniMagazaProje;Integrated Security=True");
        private void Form1_Load(object sender, EventArgs e)
        {
            renkIdCombobox.Items.Clear();
            SqlCommand komut = new SqlCommand("Select * From Renkler", baglanti);
            SqlDataReader dr;
            baglanti.Open();
            dr = komut.ExecuteReader();
            while (dr.Read())
            {
                renkIdCombobox.Items.Add(dr["renk_ad"]);
            }
            baglanti.Close();
            baglanti.Open();
            SqlDataReader dr2;
            SqlCommand komut2 = new SqlCommand("Select * From Bedenler", baglanti);
            dr2 = komut2.ExecuteReader();
            while (dr2.Read())
            {
                bedenIdCombobox.Items.Add(dr2["beden_ad"]);
                //bedenIdCombobox.ValueMember = dr2["beden_id"].ToString();

            }
            baglanti.Close();
            baglanti.Open();
            SqlDataReader dr5;
            SqlCommand komut5 = new SqlCommand("Select * From OdemeTipi",baglanti);
            dr5 = komut5.ExecuteReader();
            while (dr5.Read())
            {
                faturaOlusturOdemeTipCombobox.Items.Add(dr5["tip_ad"]);
            }
            baglanti.Close();

            baglanti.Open();
            SqlDataReader dr3;
            SqlCommand komut3 = new SqlCommand("Select * From Urunler", baglanti);
            dr3 = komut3.ExecuteReader();
            while (dr3.Read())
            {
                string deger= dr3["urun_id"].ToString();
                int sayi = Convert.ToInt32(deger) + 1;
                urunIDTextbox.Text = sayi.ToString();              
            }
            baglanti.Close();

            baglanti.Open();
            SqlDataReader dr4;
            SqlCommand komut4 = new SqlCommand("Select * from Fatura",baglanti);
            dr4 = komut4.ExecuteReader();
            while (dr4.Read())
            {
                String deger = dr4["fatura_id"].ToString();
                int sayi = Convert.ToInt32(deger)+1;
                sepetFaturaEkleId.Text = sayi.ToString();
            }
            baglanti.Close();
        }
        

        private void yeniUrunDetayEkleButton_Click(object sender, EventArgs e)
        {
            String urun_ad, urun_barkod;
            int urun_id, beden_id, renk_id, urun_stok;
            double urun_fiyat;
            urun_ad = yeniUrunEkleAdTextbox.Text;
            urun_barkod = urunBedenRenkIdTextbox.Text;
            urun_id = Convert.ToInt32(urunIDTextbox.Text);
            beden_id = (bedenIdCombobox.SelectedIndex + 1);
            renk_id = (renkIdCombobox.SelectedIndex + 1);
            urun_stok =Convert.ToInt32(urunStokTextbox.Text);
            urun_fiyat = Convert.ToDouble(urunFiyatTextbox.Text);
            DataTable dt = new DataTable();
            baglanti.Close();
            baglanti.Open();
            SqlCommand komut = new SqlCommand();
            komut.CommandType = CommandType.StoredProcedure;
            komut.Parameters.AddWithValue("@urun_ad",urun_ad);
            komut.CommandText = "UrunEkle";
            komut.Connection = baglanti;
            dt.Load(komut.ExecuteReader());
            dataGridView1.DataSource = dt;
            komut.Parameters.Clear();
            baglanti.Close();
            /////////////////////////////////////////       
        }

        private void urunStokSorgulaButton_Click(object sender, EventArgs e)
        {
            String urun_id;
            urun_id = urunStokSorgulaTextBox.Text;
            if (urun_id != "")
            {
                DataTable dt = new DataTable();
                baglanti.Open();
                SqlCommand komut = new SqlCommand();
                komut.CommandType = CommandType.StoredProcedure;
                komut.Parameters.AddWithValue("@urun_beden_renk_id", urun_id);
                komut.CommandText = "UrunStokSorgu";
                komut.Connection = baglanti;
                dt.Load(komut.ExecuteReader());
                dataGridView1.DataSource = dt;
                komut.Parameters.Clear();
                baglanti.Close();
                urunStokSorgulaTextBox.Clear();
            }
            else
            {
                MessageBox.Show("Ürün Kodu Boş Bırakılamaz!!!");
            }
        }

        private void sepetUrunEkleBtn_Click(object sender, EventArgs e)
        {
            String urun_kodu;
            int fatura_id;
            urun_kodu = sepetUrunEkleId.Text;
            fatura_id =Convert.ToInt32(sepetFaturaEkleId.Text);
            SqlCommand komut = new SqlCommand();
            baglanti.Open();
            komut.CommandType = CommandType.StoredProcedure;
            komut.Parameters.AddWithValue("@urun_beden_renk_id", urun_kodu);
            komut.Parameters.AddWithValue("@fatura_id", fatura_id);
            komut.CommandText = "FaturaUrunlerEkle";
            komut.Connection = baglanti;
            DataTable dt = new DataTable();
            dt.Load(komut.ExecuteReader());
            dataGridView1.DataSource = dt;
            baglanti.Close();
        }

        private void faturaOlusturBtn_Click(object sender, EventArgs e)
        {
            String musteri_id, musteri_ad, musteri_soyad, musteri_telefon, tarih;
            int odeme_tipi, personel_id;
            int fatura_id;
            musteri_id = faturaOlusturMusteriIdTxt.Text;
            musteri_ad = faturaOlusturMusteriAdTxt.Text;
            musteri_soyad = faturaOlusturMusteriSoyadTxt.Text;
            musteri_telefon = faturaOlusturMusteriTelTxt.Text;
            tarih = faturaOlusturTarihTxt.Text;
            odeme_tipi = (faturaOlusturOdemeTipCombobox.SelectedIndex + 1);
            personel_id = Convert.ToInt32(textBox1.Text);
            fatura_id = Convert.ToInt32(sepetFaturaEkleId.Text);
            SqlCommand komut = new SqlCommand();
            baglanti.Open();
            komut.CommandType = CommandType.StoredProcedure;
            komut.Parameters.AddWithValue("@musteri_id", musteri_id);
            komut.Parameters.AddWithValue("@musteri_ad", musteri_ad);
            komut.Parameters.AddWithValue("@musteri_soyad", musteri_soyad);
            komut.Parameters.AddWithValue("@musteri_telefon", musteri_telefon);
            komut.Parameters.AddWithValue("@fatura_id", fatura_id);
            komut.Parameters.AddWithValue("@odeme_tipi", odeme_tipi);
            komut.Parameters.AddWithValue("@personel_id", personel_id);
            komut.Parameters.AddWithValue("@tarih", tarih);
            komut.CommandText = "FaturaOlustur";
            komut.Connection = baglanti;
            DataTable dt = new DataTable();
            dt.Load(komut.ExecuteReader());
            dataGridView1.DataSource = dt;
            baglanti.Close();
        }

        private void faturaIslemBitir_Click(object sender, EventArgs e)
        {
            int fatura_id;
            fatura_id = Convert.ToInt32(sepetFaturaEkleId.Text);
            SqlCommand komut = new SqlCommand();
            baglanti.Open();
            komut.CommandType = CommandType.StoredProcedure;
            komut.Parameters.AddWithValue("@fatura_id", fatura_id);
            komut.CommandText = "FaturaToplamTutar";
            komut.Connection = baglanti;
            DataTable dt = new DataTable();
            dt.Load(komut.ExecuteReader());
            dataGridView1.DataSource = dt;
            baglanti.Close();
            sepetUrunEkleId.Clear();
            faturaOlusturMusteriIdTxt.Clear();
            faturaOlusturMusteriAdTxt.Clear();
            faturaOlusturMusteriSoyadTxt.Clear();
            faturaOlusturMusteriTelTxt.Clear();
            textBox1.Clear();
            faturaOlusturTarihTxt.Clear();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string baslangicTarih, bitisTarih;
            baslangicTarih = ciroBaslangicTxt.Text;
            bitisTarih = ciroBitisTxt.Text;
            SqlCommand komut = new SqlCommand();
            baglanti.Open();
            komut.CommandType = CommandType.StoredProcedure;
            komut.Parameters.AddWithValue("@baslangic_tarih", baslangicTarih);
            komut.Parameters.AddWithValue("@bitis_tarih", bitisTarih);
            komut.CommandText = "CiroTakip";
            komut.Connection = baglanti;
            DataTable dt = new DataTable();
            dt.Load(komut.ExecuteReader());
            dataGridView1.DataSource = dt;
            baglanti.Close();
            ciroBaslangicTxt.Clear();
            ciroBitisTxt.Clear();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            int fatura_id;
            SqlCommand komut = new SqlCommand();
            if (faturadakiUrunleriSorgulaTxt.Text=="")
            {
                MessageBox.Show("Fatura Kodu Boş Bırakılamaz");
            }
            else
            {
                fatura_id = Convert.ToInt32(faturadakiUrunleriSorgulaTxt.Text);
                baglanti.Open();
                 komut.CommandType = CommandType.StoredProcedure;
                 komut.Parameters.AddWithValue("@fatura_id", fatura_id);
                 komut.CommandText = "FaturadaUrunleriListele";
                 komut.Connection = baglanti;
                 DataTable dt = new DataTable();
                 dt.Load(komut.ExecuteReader());
                 dataGridView1.DataSource = dt;
                 baglanti.Close();
            }
            
            
        }

        private void button3_Click(object sender, EventArgs e)
        {
            int fatura_id;
            SqlCommand komut2 = new SqlCommand();
            if (faturadakiUrunleriSorgulaTxt.Text == "") 
            {
                MessageBox.Show("Fatura Kodu Boş Bırakılamaz.");
            }
            else
            {
                fatura_id = Convert.ToInt32(faturadakiUrunleriSorgulaTxt.Text);
                baglanti.Open();
                komut2.CommandType = CommandType.StoredProcedure;
                komut2.Parameters.AddWithValue("@fatura_id", fatura_id);
                komut2.CommandText = "FaturaGoster";
                komut2.Connection = baglanti;
                DataTable dt = new DataTable();
                dt.Load(komut2.ExecuteReader());
                dataGridView1.DataSource = dt;
                baglanti.Close();
            }     
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Form2 form2 = new Form2();
            form2.Show();
            this.Hide();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            String urun_barkod;
            int urun_id, beden_id, renk_id, urun_stok;
            double urun_fiyat;
            urun_barkod = urunBedenRenkIdTextbox.Text;
            urun_id = Convert.ToInt32(urunIDTextbox.Text);
            beden_id = (bedenIdCombobox.SelectedIndex + 1);
            renk_id = (renkIdCombobox.SelectedIndex + 1);
            urun_stok = Convert.ToInt32(urunStokTextbox.Text);
            urun_fiyat = Convert.ToDouble(urunFiyatTextbox.Text);
            baglanti.Open();
            SqlCommand komut2 = new SqlCommand();
            komut2.CommandType = CommandType.StoredProcedure;
            komut2.Parameters.AddWithValue("urun_beden_renk_id", urun_barkod);
            komut2.Parameters.AddWithValue("@urun_id", urun_id);
            komut2.Parameters.AddWithValue("@beden_id", beden_id);
            komut2.Parameters.AddWithValue("@renk_id", renk_id);
            komut2.Parameters.AddWithValue("@urun_fiyat", urun_fiyat);
            komut2.Parameters.AddWithValue("@urun_stok", urun_stok);
            komut2.CommandText = "UrunDetayEkle";
            komut2.Connection = baglanti;
            dt.Load(komut2.ExecuteReader());
            dataGridView1.DataSource = dt;
            baglanti.Close();
            MessageBox.Show("Ürün Ekleme İşlemi Başarılı Bir Şekilde Yapıldı");
        }

        private void button6_Click(object sender, EventArgs e)
        {
            Form3 form3 = new Form3();
            form3.Show();
            this.Hide();
        }
    }
}
