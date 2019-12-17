if Admin.count < 1
  Admin.create(
    first_name: 'First',
    last_name: 'Admin',
    login: 'admin',
    password: '12345678',
    password_confirmation: '12345678',
    role: 'hight'
  )
end
