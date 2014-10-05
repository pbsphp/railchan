ActiveAdmin.register Comment, as: "TopicComment" do
  permit_params :author, :subject, :email, :ip, :text
end
