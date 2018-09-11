class CreateCareers < ActiveRecord::Migration[5.1]
  def change
    create_table :careers do |t|
    	  t.string :f_name
	      t.string :l_name
	      t.string :email
	      t.string :phn_number
	      t.string :job_position
	      t.string :work_experience
	      t.string :current_salary
	      t.string :expected_salary
	      t.attachment :resume_file 
     	  t.timestamps
    end
  end
end
