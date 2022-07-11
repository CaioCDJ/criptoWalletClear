namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
  # funcoes bem mais inchutas 
    if Rails.env.development?
      show_spinner("Apagando DB..."){ %x(rails db:drop )}
      show_spinner("Criando DB..."){ %x(rails db:create ) }
      show_spinner("Migrando DB..."){ %x(rails db:migrate ) }
      show_spinner("Semeando DB..."){ %x(rails db:seed ) }
    else
      puts "Você não está em ambiente de desenvolvimento!"
    end
  end

  #   yield um bloco de codigo que sera passado 
  # quando a funcao chamada
  #
  # private above the func
  private 
  def show_spinner(msg_start)
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}" )
      spinner.auto_spin    
      yield
      spinner.success('(Concluido com sucesso!)');
  end
end
