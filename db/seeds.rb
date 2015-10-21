user = User.new({
  name: 'Andrew',
  email: 'aarcher520@gmail.com',
  phone_number: '415-555-5555',
})

user.password = 'testdb'
user.save!