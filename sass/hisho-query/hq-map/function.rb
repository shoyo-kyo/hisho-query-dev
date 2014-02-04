#
# hq-map functions
# map操作関数を集めたrubyファイル
#
module HishoQueryMap
  #
  # hq-map-to-string($map)
  # return string
  #

  #
  # [name] hq-map-to-string v1.0.0
  # [desc] mapを文字列に変換。debugで等で利用
  # [return] string
  # [exsample] hq-map-to-string($map)
  #
  def hq_map_to_string(map)
    assert_type map, :Map, :map
    result = to_h(map).to_s
    Sass::Script::String.new(result)
  end
end
