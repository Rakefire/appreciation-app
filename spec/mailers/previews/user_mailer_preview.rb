# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome
  def welcome
    user = User.create(email: "test@email.com", verified_at: Time.now)
    UserMailer.welcome(user)
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/verification
  def verification
    user = User.create(email: "test@email.com", verification_token: "abcd")
    UserMailer.verification(user)
  end
end
