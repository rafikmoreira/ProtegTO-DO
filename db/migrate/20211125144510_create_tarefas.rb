class CreateTarefas < ActiveRecord::Migration[6.1]
  def change
    create_table :tarefas do |t|
      t.string :titulo
      t.text :descricao
      t.integer :status
      t.integer :visibilidade
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
