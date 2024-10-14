ActiveAdmin.register User do
  actions :all, except: [:edit, :update, :destroy]

  index do
    selectable_column
    id_column
    column "full name",:name
    column :username
    column :email
    column "Mobile number", :phone_number
    actions

  end


end
