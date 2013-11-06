Anchoring.transaction do
  (1..100).each do |i|
    Anchoring.create(:ship_name => '新华',
		  :country => '中国',
		  :category => '散',
		  :ship_length => 151,
		  :cargo => '钢材',
		  :gt => '10850t',
		  :nt => '6021t',
		  :max_draft => '8.6',
		  :anchor_reason => '待泊',
		  :anchor_date => DateTime.new(2013, 10, 29, 14),
		  :sail_date => DateTime.new(2013, 10, 29, 18),
		  :pier => '黄天港',
		  :ship_contact => '13705019360',
		  :contacter => '殷浩',
		  :cellphone => '13222898222',
		  :status => 'sailed' )
  end
end


