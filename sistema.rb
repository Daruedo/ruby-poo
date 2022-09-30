require_relative "livro"
require_relative "contador"
require_relative "estoque"

algoritmos = Livro.new("Algoritmos", 100.00, 1998, true, "", "livro")
arquitetura = Livro.new("Introdução a Arquitetura e Design de Software", 70.00, 2011, true, "", "livro")
programmer = Livro.new("The Pragmatic Programmer", 120.00, 1999, true, "", "livro")
ruby = Livro.new("Programming Ruby", 90.50, 2004, true, "", "livro")
curioso = Livro.new("Mundo Curioso vol.1", 10, 2012, true, "Revistas", "revista")


estoque = Estoque.new

estoque << algoritmos << algoritmos << arquitetura << programmer << ruby << ruby << ruby

def livro_para_newsletter(livro)
    if livro.ano_lancamento < 1999
        puts "Newsletter/Liquidacao"
        puts livro.titulo
        puts livro.preco
        puts livro.possui_reimpressao?
    end
end

#livro_para_newsletter(algoritmos)

# baratos = estoque.mais_baratos_que 80
# baratos.each do |livro|
#     puts livro.titulo
# end
# ---

# puts estoque.maximo_necessario

# estoque.exporta_csv

estoque.vende algoritmos
estoque.vende algoritmos
estoque.vende ruby
estoque.vende ruby
estoque.vende ruby
estoque.vende curioso

puts estoque.livro_mais_vendido_por_titulo.titulo
puts estoque.revista_mais_vendido_por_titulo.titulo