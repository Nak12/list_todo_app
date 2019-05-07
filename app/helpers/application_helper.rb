module ApplicationHelper

  def public_private(is_private)
    is_private ? "Privado" : "Público"
  end
  
end
