using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Veiculos
{
    public abstract class Veiculos
    {
        // variaveis privadas da classe Veiculos, herdeiras pelas classes Carros e Caminhoes
        private string placa;
        private double peso;
        private double altura;
        private double largura;
        private string tipoCombu;
        private string marca;

        // consulta sem parâmetros
        public Veiculos()
        {
            this.placa = null;
            this.peso = 0.0;
            this.altura = 0.0;
            this.largura = 0.0;
            this.tipoCombu = null;
            this.marca = null;
        }

        // consulta com parâmetros
        public Veiculos(string placa, double peso, double altura, double largura, string tipoCombu, string marca)
        {
            this.placa = placa;
            this.peso = peso;
            this.altura = altura;
            this.largura = largura;
            this.tipoCombu = tipoCombu;
            this.marca = marca;
        }

        // propriedades dos atributos
        public string Placa { get; set; }
        public double Peso { get; set; }
        public double Altura { get; set; }
        public double Largura { get; set; }
        public string TipoCombu { get; set; }
        public string Marca { get; set; }

        // método da classe Consultar
        public abstract String Consultar();
    }
}
