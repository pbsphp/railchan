ActiveAdmin.register Ban do
  permit_params :ip, :reason, :expires_at
end
