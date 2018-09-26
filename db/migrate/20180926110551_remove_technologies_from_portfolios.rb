class RemoveTechnologiesFromPortfolios < ActiveRecord::Migration[5.1]
  def change
    remove_column :portfolios, :technologies, :string
    remove_column :portfolios, :tools, :string
  end
end
