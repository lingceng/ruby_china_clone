module ApplicationHelper
  def gravatar_url(email)
    hash = Digest::MD5.hexdigest(email.downcase)
    "//www.gravatar.com/avatar/#{hash}?s=47"
  end


end
