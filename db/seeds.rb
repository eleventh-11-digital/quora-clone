a = User.create(full_name: "bbc", email: "bbc321@gmail.com", password: "bbc321", password_confirmation: "bbc321")
b = User.create(full_name: "jjp", email: "jjp5320@amail.com", password: "jjp5320", password_confirmation: "jjp5320")

5.times do |i|
	Question.create(question: "Question #{i + 1}", user_id: a.id)
end

5.times do |i|
	Question.create(question: "Question #{i + 6}", user_id: b.id)
end

q1 = Question.find(1)
2.times do |i|
	Answer.create(answer: "Answer #{i + 1}", question_id: q1.id, user_id: b.id)
end

q2 = Question.find(2)
3.times do |i|
	Answer.create(answer: "Answer #{i + 1}", question_id: q2.id, user_id: b.id)
end

q3 = Question.find(3)
1.times do |i|
	Answer.create(answer: "Answer #{i + 1}", question_id: q3.id, user_id: b.id)
end

q4 = Question.find(4)
4.times do |i|
	Answer.create(answer: "Answer #{i + 1}", question_id: q4.id, user_id: b.id)
end

q5 = Question.find(5)
2.times do |i|
	Answer.create(answer: "Answer #{i + 1}", question_id: q5.id, user_id: b.id)
end

q6 = Question.find(6)
6.times do |i|
	Answer.create(answer: "Answer #{i + 1}", question_id: q6.id, user_id: a.id)
end

q7 = Question.find(7)
3.times do |i|
	Answer.create(answer: "Answer #{i + 1}", question_id: q7.id, user_id: a.id)
end
q8 = Question.find(8)
2.times do |i|
	Answer.create(answer: "Answer #{i + 1}", question_id: q8.id, user_id: a.id)
end
q9 = Question.find(9)
4.times do |i|
	Answer.create(answer: "Answer #{i + 1}", question_id: q9.id, user_id: a.id)
end
q10 = Question.find(10)
1.times do |i|
	Answer.create(answer: "Answer #{i + 1}", question_id: q10.id, user_id: a.id)
end