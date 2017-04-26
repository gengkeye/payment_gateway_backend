class TestMailerPreview < ActionMailer::Preview
  def sample_mail_preview
    TestMailer.sample_email(User.first)
  end
end
