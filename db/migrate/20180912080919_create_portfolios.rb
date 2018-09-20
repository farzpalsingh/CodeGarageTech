class CreatePortfolios < ActiveRecord::Migration[5.1]
  def change
    create_table :portfolios do |t|
	  t.string :name
      t.string :description
      t.string :technologies
      t.string :tools
      t.string :area
      t.attachment :photo 
 	  t.timestamps
    end
  end
end
