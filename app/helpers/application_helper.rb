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

  def ambiente_rails
    if Rails.env.development?
      "Desenvolvimento"

    elsif Rails.env.production?
      "Produção"
    else 
      "Teste"
    end
  end

  def locale
    
    I18n.locale==:en ? "ingles - Americano" : "Portugues - Brasil"
  
  end
end
