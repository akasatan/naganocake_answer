# 【DMM WEBCAMPの成果物の模範コード】naganocake_answer
DMM WEBCAMPの成果物の模範コードを解読、一部修正したものです。
メンターの岩田さんS2がめっちゃいい人で色々教えてもらいました！！！
忘備録書いておきます。

## 自身で調べて分かった部分
- @cart_items.sum(&:subtotal)で掛け算した合計を出せる
- .confirm_deposit?とは？（モデルメゾット？）→enum。enum_helperで変換してるから紛らわしいね
- SQLを気にするコメントアウトがview/public/items/indexにあったのだが、それならitemモデルのself.recommendedもfind_eachにしないのか→find_eachは1000件ずつSQLで検索だからこの規模なら使わないのかな？

## 岩田さんに聞いて分かった部分

### admin/orders_controller
- .includes(:item)を使用することで、paramsが:itemだけ格納される？
→その通り。SQLの負担軽減である

### public/orders_controller
- params[:select_address] == '2' && (@order.postal_code =~ /\A\d{7}\z/) && @order.destination? && @order.name?でなぜデータ保存出来るのか
→form_with内でmodel: @orderにすると@orderに値が格納される為上記の表記はバリデーションチェックの意味。(@order = Order.new(order_params)で仮で値が入り、@order.name?で空白かどうかのバリデーションをし、@order.saveで保存される)

### itemモデル
- recommends = []とは？
空の配列を定義するというもの。each文もSQL処理軽減の為に.lastを用いている。総じてSQL軽減用。

### 模範コードが古い表記のかこの表記の方がいいのかの判断
- :numericality => {:greater_than_or_equal_to => 1}はlength {in 1..5}とかmaximumとかではいけないのか<br>
→length1だとpresense:trueと大差無い（”文字列”が1以上という判定の為）。:numericalityだと数値が1以上みたいな感じなので00円とかでもバリデーション、-1円、0円でもバリデーションが出来る。<br>
模範コードが:greater_than_or_equal_to => 0だったので、greater_thanのみにするかそのまま1に書き換えるか･･･はたまたセールで0円の商品とかを作りたかったんですかね･･･?(笑)とのこと。

### customer/itemモデル
- scopeの書き方（○○_activeとコントローラに書けばtrueのものだけ抽出してくれるという意味だと思うが、どういう仕組みなのか。○○_activeにwhere(SQL文？)で探したtrueを代入しているという意味なのか。
→モデルメゾットみたいなもの。scopeは覚えると便利。時間があればぜひ学習して。
https://qiita.com/ngron/items/14a39ce62c9d30bf3ac3

### CSS
- reset.cssの記述（こんなに書くのか･･･!?)
→好き好き。やりたければ突き詰めるべし。カリキュラムではbootstrapでやっているのでそのままでOK。
