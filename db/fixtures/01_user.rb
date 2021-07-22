3.times do |n|
  num = n + 1
  User.seed do |s|
    s.id = num
    s.name = "#{num}太郎"
    s.email = "test@#{num}"
    s.password = "password123"
    s.introduction = "#{num}太郎さんの自己紹介文"
  end
end
