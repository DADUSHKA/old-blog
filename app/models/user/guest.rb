class User::Guest
  def guest?
    true
  end

  def admin?
    false
  end

  def has_access_for_party?(dump)
    false
  end
end
