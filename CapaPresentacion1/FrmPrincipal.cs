﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CapaPresentacion1
{
    public partial class FrmPrincipal : Form
    {
        private int childFormNumber = 0;

        public string Idtrabajador="";
        public string Apellido = "";
        public string Nombre = "";
        public string Acceso = "";

        public FrmPrincipal()
        {
            InitializeComponent();
        }

        private void ShowNewForm(object sender, EventArgs e)
        {
            Form childForm = new Form();
            childForm.MdiParent = this;
            childForm.Text = "Ventana " + childFormNumber++;
            childForm.Show();
        }

        private void OpenFile(object sender, EventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.Personal);
            openFileDialog.Filter = "Archivos de texto (*.txt)|*.txt|Todos los archivos (*.*)|*.*";
            if (openFileDialog.ShowDialog(this) == DialogResult.OK)
            {
                string FileName = openFileDialog.FileName;
            }
        }

        private void SaveAsToolStripMenuItem_Click(object sender, EventArgs e)
        {
            SaveFileDialog saveFileDialog = new SaveFileDialog();
            saveFileDialog.InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.Personal);
            saveFileDialog.Filter = "Archivos de texto (*.txt)|*.txt|Todos los archivos (*.*)|*.*";
            if (saveFileDialog.ShowDialog(this) == DialogResult.OK)
            {
                string FileName = saveFileDialog.FileName;
            }
        }

        private void ExitToolsStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void CutToolStripMenuItem_Click(object sender, EventArgs e)
        {
        }

        private void CopyToolStripMenuItem_Click(object sender, EventArgs e)
        {
        }

        private void PasteToolStripMenuItem_Click(object sender, EventArgs e)
        {
        }

        private void ToolBarToolStripMenuItem_Click(object sender, EventArgs e)
        {
            toolStrip.Visible = toolBarToolStripMenuItem.Checked;
        }

        private void StatusBarToolStripMenuItem_Click(object sender, EventArgs e)
        {
            statusStrip.Visible = statusBarToolStripMenuItem.Checked;
        }

        private void CascadeToolStripMenuItem_Click(object sender, EventArgs e)
        {
            LayoutMdi(MdiLayout.Cascade);
        }

        private void TileVerticalToolStripMenuItem_Click(object sender, EventArgs e)
        {
            LayoutMdi(MdiLayout.TileVertical);
        }

        private void TileHorizontalToolStripMenuItem_Click(object sender, EventArgs e)
        {
            LayoutMdi(MdiLayout.TileHorizontal);
        }

        private void ArrangeIconsToolStripMenuItem_Click(object sender, EventArgs e)
        {
            LayoutMdi(MdiLayout.ArrangeIcons);
        }

        private void CloseAllToolStripMenuItem_Click(object sender, EventArgs e)
        {
            foreach (Form childForm in MdiChildren)
            {
                childForm.Close();
            }
        }

        private void salirToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void categoríasToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            FrmCategoria frm = new FrmCategoria();
            frm.MdiParent = this;
            frm.Show();
        }

        private void presentacionesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FrmPresentacion frm = new FrmPresentacion();
            frm.MdiParent = this;
            frm.Show();
        }

        private void artículosToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            FrmArticulo frm = FrmArticulo.GetInstancia();
            frm.MdiParent = this;
            frm.Show();
        }

        private void proveedorToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            FrmProveedor frm = new FrmProveedor();
            frm.MdiParent = this;
            frm.Show();
        }

        private void clientesToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            FrmCliente frm = new FrmCliente();
            frm.MdiParent = this;
            frm.Show();
        }

        private void trabajadoresToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            FrmTrabajador frm = new FrmTrabajador();
            frm.MdiParent = this;
            frm.Show();
        }

        private void FrmPrincipal_Load(object sender, EventArgs e)
        {
            GestionUsuarios();
        }

        private void GestionUsuarios()
        {
            //Controlar los accesos
            if (Acceso == "Administrador")
            {
                this.mnuAlmacen.Enabled = true;
                this.mnuCompras.Enabled = true;
                this.mnuVentas.Enabled = true;
                this.mnuMantenimiento.Enabled = true;
                this.mnuConsultas.Enabled = true;
                this.mnuHerramientas.Enabled = true;
                this.tsCompras.Enabled = true;
                this.tsVentas.Enabled = true;
            }
           else if (Acceso == "Vendedor")
            {
                this.mnuAlmacen.Enabled = false;
                this.mnuCompras.Enabled = false;
                this.mnuVentas.Enabled = true;
                this.mnuMantenimiento.Enabled = false;
                this.mnuConsultas.Enabled = true;
                this.mnuHerramientas.Enabled = true;
                this.tsCompras.Enabled = false;
                this.tsVentas.Enabled = true;
            }
           else if (Acceso == "Almacenero")
            {
                this.mnuAlmacen.Enabled = true;
                this.mnuCompras.Enabled = true;
                this.mnuVentas.Enabled = false;
                this.mnuMantenimiento.Enabled = false;
                this.mnuConsultas.Enabled = true;
                this.mnuHerramientas.Enabled = true;
                this.tsCompras.Enabled = true;
                this.tsVentas.Enabled = false;
            }
            else
            {
                this.mnuAlmacen.Enabled = false;
                this.mnuCompras.Enabled = false;
                this.mnuVentas.Enabled = false;
                this.mnuMantenimiento.Enabled = false;
                this.mnuConsultas.Enabled = false;
                this.mnuHerramientas.Enabled = false;
                this.tsCompras.Enabled = false;
                this.tsVentas.Enabled = false;
            }
        }

        private void ingresosToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            FrmIngreso frm = FrmIngreso.GetInstancia();
            frm.MdiParent = this;
            frm.Show();
            frm.idtrabajador = Convert.ToInt32(this.Idtrabajador);
        }
    }
}
    