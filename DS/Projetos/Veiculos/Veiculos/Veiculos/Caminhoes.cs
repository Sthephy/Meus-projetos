using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Veiculos
{
    internal class Caminhoes : Veiculos
    {
        // variaveis privadas da classe Caminhoes, pertencentes apenas a ela
        private double cargaMax;
        private string tipoCarga;
        private int velocMax;
        private int numEixos;

        // consulta sem parâmetros
        public Caminhoes()
        {
            this.cargaMax = 0.0;
            this.tipoCarga = null;
            this.velocMax = 0;
            this.numEixos = 0;
        }

        // consulta com parâmetros
        public Caminhoes(string placa, double peso, double altura, double largura, string tipoCombu, string marca, double cargaMax, string tipoCarga, int velocMax, int numEixos)
        {
            this.Placa = placa;
            this.Peso = peso;
            this.Altura = altura;
            this.Largura = largura;
            this.TipoCombu = tipoCombu;
            this.Marca = marca;
            this.cargaMax = cargaMax;
            this.tipoCarga = tipoCarga;
            this.velocMax = velocMax;
            this.numEixos = numEixos;
        }

        // propriedades dos atributos
        private double CargaMax { get; set; }
        private string TipoCarga { get; set; }
        private int VelocMax { get; set; }
        private int NumEixos { get; set; }

        public override string Consultar()
        {
            String s = String.Empty;
            s = $"Placa: {Placa}\n Peso: {Peso}\n Altura: {Altura}\n Largura: {Largura}\n Tipo Combustivel: {TipoCombu}\n Marca: {Marca}\n Carga máxima: {CargaMax}\n Tipo Carga: {TipoCarga}\n Velocidade máxima: {VelocMax}\n Número eixos: {numEixos}";
            return s;
        }
    }
}
