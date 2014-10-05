ActiveAdmin.register BoardsGroup, as: "BoardsThemedGroup" do
  permit_params :name, :description
end
