class CreateSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :sessions, id: :uuid do |t|
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
