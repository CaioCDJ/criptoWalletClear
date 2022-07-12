class MiningTypeToCoins < ActiveRecord::Migration[5.2]
  def change
    # Adicionando Fk a tabela Coins
    add_reference :coins,   :mining_type, foreign_key: true
  end
end
