class RemoveCurrentSalaryFromCareers < ActiveRecord::Migration[5.1]
  def change
    remove_column :careers, :current_salary, :string
    remove_column :careers, :expected_salary, :string
  end
end
