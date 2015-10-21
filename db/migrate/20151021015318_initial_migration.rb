class InitialMigration < ActiveRecord::Migration
  def change
    create_table :tabs do |t|
      t.string :name, default: "Untitled Tab"
      t.date :dine_date, default: Date.today
      t.text :raw_text
      t.string :url
      t.string :img_url
      t.belongs_to :user
      t.timestamps
    end

    create_table :items do |t|
      t.string :name
      t.integer :price
      t.belongs_to :tab
      t.timestamps
    end

    create_table :rabbits do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.belongs_to :user
      t.timestamps
    end

    create_table :rabbits_tabs do |t|
      t.belongs_to :tab
      t.belongs_to :rabbit
      t.timestamps
    end

    create_table :items_rabbits do |t|
      t.belongs_to :item
      t.belongs_to :rabbit
      t.timestamps  
    end

    create_table :users do |t|
      t.string :password_hash
      t.string :name
      t.string :email
      t.string :phone_number
      t.integer :avatar_rabbit_id
      t.string :vm_authtoken
      t.string :vm_authrefreshtoken
      t.timestamps
    end
  end
end
