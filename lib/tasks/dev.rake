namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
  # funcoes bem mais inchutas 
    if Rails.env.development?
      show_spinner("Apagando DB..."){ %x(rails db:drop )}
      show_spinner("Criando DB..."){ %x(rails db:create ) }
      show_spinner("Migrando DB..."){ %x(rails db:migrate ) }
      %x(rails dev:add_mining_types ) 
      %x(rails dev:add_coins ) 
    else
      puts "Você não está em ambiente de desenvolvimento!"
    end
  end
  desc "Cadastra Moedas" 
  task add_coins: :environment do
     spinner = TTY::Spinner.new("[:spinner] Cadastrando Moedas" )
      spinner.auto_spin   
    # facilidade
    coins = [
    {
      description: "Bitcoin",
      acronym:"BTC",
      url_image:"https://logos-world.net/wp-content/uploads/2020/08/Bitcoin-Emblem.png",
      mining_type:MiningType.find_by(acronym:"PoW")
    },
    {
      description: "Ethereum",
      acronym:"ETH",
      url_image:"https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Ethereum_logo_2014.svg/1257px-Ethereum_logo_2014.svg.png",
      mining_type:MiningType.all.sample
    },
    {
      description: "Monero",
      acronym:"XMR",
      url_image:"https://seeklogo.com/images/M/monero-logo-4EB9795194-seeklogo.com.png",
      mining_type:MiningType.all.sample
  }
]

 coins.each do |coin|
    sleep(1)
    Coin.find_or_create_by!(coin)
  end


end
  desc "Cadastro dos tipos de Mineração"
  task add_mining_types: :environment do
    spinner = TTY::Spinner.new("[:spinner] Cadastrando Tipos de Mineração" )
    mining_types =[
      {description:"Proof of Work", acronym:"PoW"},
      {description:"Proof of Stake", acronym:"PoS"},
      {description:"Proof of Capacity", acronym:"PoC"}
    ]

    mining_types.each do |type|
      sleep(1)
      MiningType.find_or_create_by!(type)
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
