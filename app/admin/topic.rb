ActiveAdmin.register Topic do
  permit_params :author, :subject, :email, :text, :ip, :bumped_at
end
