hisho-query
===========
Sass3.3 and compass1.0 Library  

sass3.3(RC)とcompassで動作する、sass function Library  

※※※※※※※※※※※※  
まだ制作中(バグ有り)  
※※※※※※※※※※※※  

バージョン
------
0.1.0

開発環境
------
Sass 3.3.0.rc.2
compass 1.0.0.alpha.17


利用方法
------

1. sassフォルダ内に"hisho-query"フォルダを作成

2. 上記にファイルを配置 

	/sass/hisho-query/_hquery-0.1.0.scss
	/sass/hisho-query/_hquery-function-0.1.0.rb

3. compassの"config.rb"内に追記  
  
	require "./sass/hisho-query/_hquery-function-0.1.0.rb"

4. sass内でinclude  

	@import "hisho-query/_hquery-0.1.0";


method list (ざっくり)
------

各typeを処理する為のfunctionを用意。  
第一引数にmethod名、第二引数以降はmethodで使う引数を指定  

	$hoge: hq-css("method name",$argument);
	$hoge: hq-is("method name",$argument);
	$hoge: hq-list("method name",$argument);
	$hoge: hq-map("method name",$argument);
	$hoge: hq-num("method name",$argument);
	$hoge: hq-str("method name",$argument);


下記を記載しcompassでコンパイルすると、利用できるmethod一覧がプロンプト（ターミナル）に表示される。  
methodの役割はmethod名から判断してくださいw  

-scss
	$hoge: hq-css("help");

-プロンプト（ターミナル）
	- method -
	[custom]  $toMap : hq-css("toMap", "border", solid 1px #ccc);
	        -> shorthandで指定した値をmap形式に変換

	[custom]  $toMap : hq-css("toShort", $map);
	        -> mapで指定した値をshorthand形式に変換

	[custom]  $getWidth  : hq-css("getWidth", 500px, solid 1px #ccc, 0 2px 3px);
	        -> padding borderを省いたwidthを取得

	[custom]  $getHeight : hq-css("getHeight", 500px, solid 1px #ccc, 0 2px 3px);
	        -> padding borderを省いたheightを取得


あと下記のfunctionで、指定した変数の値の型がプロンプト（ターミナル）に表示される。  

-scss
	$hoge: hq-console($value);

-プロンプト（ターミナル）

	- CONSOLE -
	Sass::Script::Value::String
	"hogehogehoge"



今後
------
* functionの他にもmixinも作っているので出来次第release
* 2日で適当に作ったので、コードが冗長化してる。どこかのタイミングでリファクタリングする
* color系のfunctionはめんどくさいので、要望ない限り実装しない。






