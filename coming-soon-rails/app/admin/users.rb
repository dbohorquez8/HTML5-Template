ActiveAdmin.register User do
	index do
			column :email
			column :created_at
			default_actions
		end
end