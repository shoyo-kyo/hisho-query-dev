#
# hq-num functions
# Number操作関数を集めたrubyファイル
#

module HishoQueryNum

  #
  # [name] hq-num-toString v1.0.0
  # [desc] string型に変換
  # [return] string
  # [exsample] hq-num-toString(120)
  #
  def hq_num_toString(num)
    assert_type num, :Number
    result = num.to_s
    Sass::Script::String.new(result)
  end


  #
  # [name] hq-num-match v1.0.0
  # [desc] 数値の検索
  # [return] string
  # [exsample] hq-num-match(abbc,"/a.*c/")
  #
  def hq_num_match(num, find)
    assert_type num, :Number
    assert_type find, :String
    str = num.to_s
    if (/\/.+\// =~ find.value) then
      findValue = find.value.gsub(/\//, "")
      isMatch = str.match(/#{findValue}/)
    else
      isMatch = str.match(find.value)
    end
    result =  if isMatch then true else false end
    Sass::Script::Bool.new(result)
  end

  #
  # [name] hq-num-replace v1.0.0
  # [desc] 数値の置換
  # [return] string
  # [exsample] hq-num-replace(aabb, "/aa(.*)/", "xx\1")
  #
  def hq_num_replace(num, find, rep)
    assert_type num, :Number
    assert_type find, :String
    assert_type rep, :String
    str = num.to_s
    if (/\/.+\// =~ find.value) then
      findValue = find.value.gsub(/\//, "")
      result = str.gsub(/#{findValue}/, rep.value)
    else
      result = str.sub(find.value, rep.value)
    end
    result = result.to_i
    Sass::Script::Number.new(result)
  end


end
