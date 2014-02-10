#
# hq-str functions
# 文字列操作関数を集めたrubyファイル
#

module HishoQueryStr

  #
  # [name] hq-str-strip v1.0.0
  # [desc] 前後にあるspace除去
  # [return] string
  # [exsample] hq-str-strip("  AbC")
  #
  def hq_str_strip(str)
    assert_type str, :String
    result = str.value.strip
    Sass::Script::String.new(result)
  end

  #
  # [name] hq-str-succ v1.0.0
  # [desc] 次の文字を返す
  # [return] string
  # [exsample] hq-str-succ("a") -> b
  #
  def hq_str_succ(str)
    assert_type str, :String
    result = str.value.succ
    Sass::Script::String.new(result)
  end

  #
  # [name] hq-str-reverse v1.0.0
  # [desc] 文字反転
  # [return] string
  # [exsample] hq-str-reverse("AbC")
  #
  def hq_str_reverse(str)
    assert_type str, :String
    result = str.value.reverse
    Sass::Script::String.new(result)
  end

  #
  # [name] hq-str-capitalize v1.0.0
  # [desc] 先頭大文字化(以外は小文字に)
  # [return] string
  # [exsample] hq-str-capitalize("aBC")
  #
  def hq_str_capitalize(str)
    assert_type str, :String
    result = str.value.capitalize
    Sass::Script::String.new(result)
  end

  #
  # [name] hq-str-first-letter-upper-case v1.0.0
  # [desc] 先頭のみ大文字化
  # [return] string
  # [exsample] hq_str_first_letter_upper_case("aBC")
  #
  def hq_str_first_letter_upper_case(str)
    assert_type str, :String
    result = str.value.gsub(/^\w/){|word| word.upcase}
    Sass::Script::String.new(result)
  end

  #
  # [name] hq-str-first-letter-lower-case v1.0.0
  # [desc]先頭のみ小文字化
  # [return] string
  # [exsample] hq-str-first-letter-lower-case("ABC")
  #
  def hq_str_first_letter_lower_case(str)
    assert_type str, :String
    result = str.value.gsub(/^\w/){|word| word.downcase}
    Sass::Script::String.new(result)
  end

  #
  # [name] hq-str-match v1.0.0
  # [desc] 文字列の検索
  # [return] string
  # [exsample] hq-str-match(abbc,"/a.*c/")
  #
  def hq_str_match(str, find)
    assert_type str, :String
    assert_type find, :String
    if (/\/.+\// =~ find.value) then
      findValue = find.value.gsub(/\//, "")
      isMatch = str.value.match(/#{findValue}/)
    else
      isMatch = str.value.match(find.value)
    end
    result =  if isMatch then true else false end
    Sass::Script::Bool.new(result)
  end

  #
  # [name] hq-str-replace v1.0.0
  # [desc] 文字列の置換
  # [return] string
  # [exsample] hq-str-replace(aabb, "/aa(.*)/", "xx\1")
  #
  def hq_str_replace(str, find, rep)
    assert_type str, :String
    assert_type find, :String
    assert_type rep, :String
    if (/\/.+\// =~ find.value) then
      findValue = find.value.gsub(/\//, "")
      result = str.value.gsub(/#{findValue}/, rep.value)
    else
      result = str.value.sub(find.value, rep.value)
    end
    Sass::Script::String.new(result)
  end

  #
  # [name] hq-str-split v1.0.0
  # [desc] 指定した区切り文字で分割
  # [return] string
  # [exsample] hq-str-split("aa|bb|cc", "|", 2)
  #
  def hq_str_split(*args)
    str = args[0]
    find = args[1]
    index = args[2]

    datas = str.value.split(find.value)
    if index != nil then
       Sass::Script::String.new(datas[index.to_i].strip)
    else
      Sass::Script::List.new(datas.map{|i| Sass::Script::String.new(i)}, :comma)
    end
  end

  #
  # [name] hq-console v1.0.0
  # [desc] ターミナルに値の結果を表示
  # [return] null
  # [exsample] hq-console(1 + 2)
  #
  def hq_console( *args )
    args.each {|v|
      puts "\n- CONSOLE - "
      puts v.class
      if v.class == Sass::Script::Value::Map then
        puts to_h(v)
      else
        puts v
      end
    }
    Sass::Script::String.new("")
  end

  #
  # [name] hq-str-puts v1.0.0
  # [desc] ターミナルに文字列を表示する
  # [return] null
  # [exsample] hq-str-puts(1 + 2)
  #
  def hq_str_puts(str)
    puts "\n"
    if str.class == Sass::Script::Value::Map then 
      puts to_h(str)
    else
      puts str
    end
    puts "\n"
    Sass::Script::String.new("")
  end

end
