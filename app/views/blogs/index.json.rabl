object @blogs
attributes :id, :content, :title, :created_at

child(:user) do
	attributes :id, :username
end
