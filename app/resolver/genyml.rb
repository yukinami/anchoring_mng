require 'yaml'

resolver = Hash.new
resolver[:anchoring] = Hash.new
resolver[:anchoring][:report_org] = {row: 7, col: 7}
resolver[:anchoring][:category] = {row: 7, col: 28}
resolver[:anchoring][:ship_name] = {row: 9, col: 5}
resolver[:anchoring][:ship_name_en] = {row: 9, col: 18}
resolver[:anchoring][:country] = {row: 9, col: 29}
resolver[:anchoring][:ship_type] = {row: 9, col: 39}
resolver[:anchoring][:ship_length] = {row: 11, col: 8}
resolver[:anchoring][:cargo] = {row: 11, col: 23}
resolver[:anchoring][:amount] = {row: 11, col: 27}
resolver[:anchoring][:gt] = {row: 11, col: 35}
resolver[:anchoring][:nt] = {row: 11, col: 40}
resolver[:anchoring][:max_draft] = {row: 13, col: 8}
resolver[:anchoring][:power] = {row: 13, col: 21}
resolver[:anchoring][:anchor_reason] = {row: 13, col: 35}
resolver[:anchoring][:anchor_date] = {row: 15, col: '7..19'}
resolver[:anchoring][:sail_date] = {row: 15, col: '26..38'}
resolver[:anchoring][:pier] = {row: 17, col: 8}
resolver[:anchoring][:ship_contact] = {row: 17, col: 25}
resolver[:anchoring][:contacter] = {row: 19, col: 6}
resolver[:anchoring][:cellphone] = {row: 19, col: 18}
resolver[:anchoring][:fax] = {row: 19, col: 33}

File.open("resolver.yml", "w+") do |aFile|
  aFile.write(resolver.to_yaml)
end

