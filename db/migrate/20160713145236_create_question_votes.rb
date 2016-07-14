class CreateQuestionVotes < ActiveRecord::Migration
	def change
		create_table :question_votes do |t|
			t.integer :user_id
			t.boolean :votes
			t.integer :question_id
			t.timestamps
		end
	end
end
