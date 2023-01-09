namespace Veiculos
{
    partial class frmVeiculos
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.lblTitulo = new System.Windows.Forms.Label();
            this.btnCarros = new System.Windows.Forms.Button();
            this.btnCaminhoes = new System.Windows.Forms.Button();
            this.btnSair = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // lblTitulo
            // 
            this.lblTitulo.AutoSize = true;
            this.lblTitulo.Font = new System.Drawing.Font("Microsoft YaHei UI", 21.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTitulo.Location = new System.Drawing.Point(307, 127);
            this.lblTitulo.Name = "lblTitulo";
            this.lblTitulo.Size = new System.Drawing.Size(145, 38);
            this.lblTitulo.TabIndex = 0;
            this.lblTitulo.Text = "Autobots";
            // 
            // btnCarros
            // 
            this.btnCarros.Font = new System.Drawing.Font("Microsoft YaHei UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnCarros.Location = new System.Drawing.Point(138, 299);
            this.btnCarros.Name = "btnCarros";
            this.btnCarros.Size = new System.Drawing.Size(114, 45);
            this.btnCarros.TabIndex = 1;
            this.btnCarros.Text = "Carros";
            this.btnCarros.UseVisualStyleBackColor = true;
            this.btnCarros.Click += new System.EventHandler(this.btnCarros_Click);
            // 
            // btnCaminhoes
            // 
            this.btnCaminhoes.Font = new System.Drawing.Font("Microsoft YaHei UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnCaminhoes.Location = new System.Drawing.Point(325, 299);
            this.btnCaminhoes.Name = "btnCaminhoes";
            this.btnCaminhoes.Size = new System.Drawing.Size(114, 45);
            this.btnCaminhoes.TabIndex = 2;
            this.btnCaminhoes.Text = "Caminhões";
            this.btnCaminhoes.UseVisualStyleBackColor = true;
            this.btnCaminhoes.Click += new System.EventHandler(this.btnCaminhoes_Click);
            // 
            // btnSair
            // 
            this.btnSair.Font = new System.Drawing.Font("Microsoft YaHei UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnSair.Location = new System.Drawing.Point(510, 299);
            this.btnSair.Name = "btnSair";
            this.btnSair.Size = new System.Drawing.Size(114, 45);
            this.btnSair.TabIndex = 3;
            this.btnSair.Text = "Sair";
            this.btnSair.UseVisualStyleBackColor = true;
            this.btnSair.Click += new System.EventHandler(this.btnSair_Click);
            // 
            // frmVeiculos
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btnSair);
            this.Controls.Add(this.btnCaminhoes);
            this.Controls.Add(this.btnCarros);
            this.Controls.Add(this.lblTitulo);
            this.Name = "frmVeiculos";
            this.Text = "Veículos";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblTitulo;
        private System.Windows.Forms.Button btnCarros;
        private System.Windows.Forms.Button btnCaminhoes;
        private System.Windows.Forms.Button btnSair;
    }
}

