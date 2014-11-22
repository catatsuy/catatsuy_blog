require "erb"

entries = [
  {
    id: 25,
    title: "黒人集団に襲われて in San Francisco",
    date: "2011/09/14",
  },
  {
    id: 243,
    title: "tmuxのすすめ",
    date: "2012/11/14",
  },
  {
    id: 229,
    title: "はてなインターン2012でスコンブを刺し損ねた話",
    date: "2012/09/23",
  },
  {
    id: 147,
    title: "数式をツイートするWebアプリを試作してみました",
    date: "2012/01/28",
  },
  {
    id: 259,
    title: "pixivインターンに参加してきた",
    date: "2013/01/19",
  },
  {
    id: 250,
    title: "LT大会まとめ",
    date: "2012/12/01",
  },
  {
    id: 226,
    title: "0==’hoge’の挙動（PHP/Perl/Javascript/Ruby）",
    date: "2012/08/29",
  },
]

template = <<EOS
---
title: <%= e[:title] %>
date: <%= e[:date] %>
---
article
  hgroup
    h2= current_page.data.title
    .post-meta
      | Posted on \#{current_page.data.date}
  = partial "entry<%= e[:id] %>"
  = partial "sns_button"

EOS

entries.each do |e|
  erb = ERB.new(template)
  File.write("source/entry#{e[:id]}.html.slim", erb.result(binding))
end
