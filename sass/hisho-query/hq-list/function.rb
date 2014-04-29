#
# hq-list functions
# list操作関数を集めたrubyファイル
#
module HishoQueryList
  #
  # hq-list-to-string($map)
  # return string
  #

  #
  # [name] hq-list-toString v1.0.0
  # [desc] listを文字列に変換。debugで等で利用
  # [return] string
  # [exsample] hq-list-toString($map)
  #
  def hq_list_toString(list)
    result = list.to_s
    Sass::Script::String.new(result)
  end
end
