class UsersSeed
  def self.create_users
    email = ENV["ADMIN_EMAIL"]
    if User.find_by(email:).blank?
      User.create!(
        username: ENV["ADMIN_USERNAME"],
        email:,
        password: ENV["ADMIN_PASSWORD"],
        role: :admin
      )
      print "\nuser: #{email}\n"
    end

    company_email = ENV["COMPANY_EMAIL"]
    if User.find_by(email: company_email).blank?
      user = User.create!(
        username: ENV["COMPANY_USERNAME"],
        email: company_email,
        password: ENV["COMPANY_PASSWORD"]
      )
      print "\nuser: #{user.username}\n"
    end
  end
end
