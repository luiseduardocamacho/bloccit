include RandomData

 # Create Posts
 50.times do
 # #1
   Post.create!(
 # #2
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 posts = Post.all

 # Create Comments
 # #3
 100.times do
   Comment.create!(
 # #4
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end

 Post.create!(title:'Testing Creating without find_or_create_by',
              body: 'This is a test body')

 Post.find_or_create_by(title:'SEC to Pursue Amended Civil Case Against Hedge-Fund Billionaire Steven Cohen') do |post|
  post.body = 'The Securities and Exchange Commission said it would pursue an amended civil
  case against hedge-fund billionaire Steven Cohen, after criminal prosecutors were forced
     to drop a related insider-trading case against one of his employees.'
     end

     Comment.find_or_create_by(
     post: posts.find_by(title:'SEC to Pursue Amended Civil Case Against Hedge-Fund Billionaire Steven Cohen'),
     body: 'testing')

 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
