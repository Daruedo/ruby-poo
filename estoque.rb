require_relative "contador"

class Estoque
    attr_reader :livros
    def initialize
        @livros = []
        @vendas = []
        @livros.extend Contador
    end

    def quantidade_vendas_por(produto, &campo)
        @vendas.count {|venda| campo.call(venda) === campo.call(produto)}
    end

    def mais_vendido_por(tipo, &campo)
        @vendas.select {|l| l.tipo == tipo}.sort {|v1,v2| quantidade_vendas_por(v1, &campo) <=> quantidade_vendas_por(v2, &campo)}.last
    end

    def livro_mais_vendido_por_titulo
        mais_vendido_por("livro", &:titulo)
    end

    def livro_mais_vendido_por_ano
        mais_vendido_por("livro", &:ano_lancamento)
    end

    def livro_mais_vendido_por_editora
        mais_vendido_por("livro", &:editora)
    end

    def revista_mais_vendido_por_titulo
        mais_vendido_por("revista", &:titulo)
    end

    def revista_mais_vendido_por_ano
        mais_vendido_por("revista", &:ano_lancamento)
    end

    def revista_mais_vendido_por_editora
        mais_vendido_por("revista", &:editora)
    end

    def exporta_csv
        @livros.each do |livro|
            puts livro.to_csv
        end
    end

    def mais_baratos_que(valor)
        @livros.select do |livro|
            livro.preco <= valor
        end
    end

    def total
        @livros.size
    end

    def <<(livro)
        @livros << livro if livro
        self
    end

    def vende(livro)
        @livros.delete livro
        @vendas << livro
    end

    def maximo_necessario
        @livros.maximo_necessario
    end
end