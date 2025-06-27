class UsersSeed
  def self.create_users
    email = "kotomairau@gmail.com"
    if User.find_by(email:).blank?
      User.create!(
        email: "kotomairau@gmail.com",
        password: 'test1234',
        role: :admin
      )
      print "\nuser: #{email}\n"
    end
  end
end
