require "test_helper"

class PlayerMailerTest < ActionMailer::TestCase
  test "youre_invited" do
    mail = PlayerMailer.youre_invited
    assert_equal "Youre invited", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
