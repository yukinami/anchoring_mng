# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Anchoring.delete_all
Anchoring.create(:report_org => '江阴通远',
		  :category => '候泊',
		  :ship_name => '新华',
		  :country => '中国',
		  :ship_type => '散',
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
		  :cellphone => '13222898222')
confirmed_anchoring = Anchoring.create(:report_org => '江阴通远',
		  :category => '过船',
		  :ship_name => '兴中',
		  :country => '中国',
		  :ship_type => '散',
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
		  :status => 'confirmed')

AnchorageGround.delete_all
AnchorageGround.create(:name => '12号锚地').anchorings<<(confirmed_anchoring)
AnchorageGround.create(:name => '15号锚地')
AnchorageGround.create(:name => '14号停泊区')
AnchorageGround.create(:name => '15号停泊区')

User.delete_all
User.create(:name => 'admin', :password => 'admin', :password_confirmation => 'admin')
