class ChangeVotesToQuestionVotes < ActiveRecord::Migration
	def change
	remove_column :question_votes, :votes, :boolean
	add_column :question_votes, :votes, :integer
	remove_column :answer_votes, :votes, :boolean
	add_column :answer_votes, :votes, :integer
	end
end
