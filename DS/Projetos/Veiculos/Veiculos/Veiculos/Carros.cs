using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Veiculos
{
    internal class Carros : Veiculos
    {
        // variaveis privadas da classe Carros, pertencentes apenas a ela
        private int numPortas;
        private string carroceria;
        private int qtdPass;
        private string tamPMAlas;

        // consulta sem parâmetros
        public Carros()
        {
            this.numPortas = 0;
            this.carroceria = null;
            this.qtdPass = 0;
            this.tamPMAlas = null;
        }

        // consulta com parâmetros
        public Carros(string placa, double peso, double altura, double largura, string tipoCombu, string marca, int numPortas, string carroceria, int qtdPass, string tamPMAlas)
        {
            this.Placa = placa;
            this.Peso = peso;
            this.Altura = altura;
            this.Largura = largura;
            this.TipoCombu = tipoCombu;
            this.Marca = marca;
            this.numPortas = numPortas;
            this.carroceria = carroceria;
            this.qtdPass = qtdPass;
            this.tamPMAlas = tamPMAlas;
        }

        // propriedades dos atributos
        private int NumPortas { get; set; }
        private string Carroceria { get; set; }
        private int QtdPass { get; set; }
        private string TamPMAlas { get; set; }

        public override string Consultar()
        {
            String s = String.Empty;
            s = $"Placa: {Placa}\n Peso: {Peso}\n Altura: {Altura}\n Largura: {Largura}\n Tipo Combustivel: {TipoCombu}\n, Marca: {Marca}\n Número Portas: {NumPortas}\ns Carroceria: {Carroceria}\n Quantidade Passageiros: {QtdPass}\n Tamanho Porta Malas: {TamPMAlas}";
            return s;
        }
    }
}