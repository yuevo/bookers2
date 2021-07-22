# user = 1太郎, book = 1~5冊
5.times do |n|
  num = n + 1
  Book.seed do |s|
    s.id = num
    s.title = "本のタイトル その#{num}"
    s.opinion = "本の感想 その#{num}"
    s.user_id = 1
  end
end

# user = 2太郎, book = 6~10冊
5.times do |n|
  num = n + 6
  Book.seed do |s|
    s.id = num
    s.title = "本のタイトル その#{num}"
    s.opinion = "本の感想 その#{num}"
    s.user_id = 2
  end
end

# user = 3太郎, book = 11~15冊
5.times do |n|
  num = n + 11
  Book.seed do |s|
    s.id = num
    s.title = "本のタイトル その#{num}"
    s.opinion = "本の感想 その#{num}"
    s.user_id = 3
  end
end
