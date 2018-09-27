class AddTechnologiesToCareers < ActiveRecord::Migration[5.1]
  def change
    add_column :careers, :technologies, :string
  end
end
