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
    public partial class frmVeiculos : Form
    {
        public frmVeiculos()
        {
            InitializeComponent();
        }

        private void btnCarros_Click(object sender, EventArgs e)
        {
            frmCarros frmCarros = new frmCarros();
            this.Hide();
            frmCarros.Show();
        }

        private void btnCaminhoes_Click(object sender, EventArgs e)
        {
            frmCaminhoes frmCaminhoes = new frmCaminhoes();
            this.Hide();
            frmCaminhoes.Show();
        }

        private void btnSair_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}