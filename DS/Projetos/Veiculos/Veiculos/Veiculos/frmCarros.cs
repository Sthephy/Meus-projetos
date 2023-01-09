using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Veiculos
{
    public partial class frmCarros : Form
    {
        // variável para armazenar dados
        Carros carros;
        public frmCarros()
        {
            InitializeComponent();
        }

        // voltando para o form principal
        private void btnVoltar_Click(object sender, EventArgs e)
        {
            frmVeiculos frmVeiculos = new frmVeiculos();
            this.Hide();
            frmVeiculos.Show();
        }

        // adicionando dados na variável de armazenamento e limpando campos
        private void btnAdicionar_Click(object sender, EventArgs e)
        {
            carros = new Carros(txtPlaca.Text, (Convert.ToDouble(txtPeso.Text)), (Convert.ToDouble(txtAltura.Text)), (Convert.ToDouble(txtLargura.Text)), txtCombu.Text, txtMarca.Text,(Convert.ToInt32(txtPortas.Text)), txtCarroceria.Text, (Convert.ToInt32(txtPass.Text)), txtPMalas.Text);
            txtPlaca.Clear();
            txtPeso.Clear();
            txtAltura.Clear();
            txtLargura.Clear();
            txtCombu.Clear();
            txtMarca.Clear();
            txtPortas.Clear();
            txtCarroceria.Clear();
            txtPass.Clear();
            txtPMalas.Clear();
        }

        // mostrar últimas dados colocadas
        private void btnConsultar_Click(object sender, EventArgs e)
        {
            MessageBox.Show(carros.Consultar());
        }
    }
}
