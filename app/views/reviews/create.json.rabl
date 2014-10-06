object @review
attributes :id, :content, :user_id, :created_at

child(:user) do
	attributes :id, :username
end