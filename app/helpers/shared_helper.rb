module SharedHelper
  def user_name(name)
    split_email = name.split('@')
    split_email[0]
  end
end