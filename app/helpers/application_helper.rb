module ApplicationHelper

  # helpers criados 
  #
  # funcoes que podem ser chamadas em 
  # multiplas partes do projeto
  #
  # helper no aplication = " funcao global"

  def data_br(data_us)
    data_us.strftime("%d/%m/%Y")
  end

  def nome_aplicacao
    "Criptowallet"
  end
end
