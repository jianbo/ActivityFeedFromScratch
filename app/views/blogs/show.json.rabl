object @blog
attributes :id, :content, :title, :created_at, :user_id

child(:user) do
	attribute :id, :username
end

child(:reviews) do
	attributes :id, :content, :created_at

	child(:user) do
		attributes :id, :username
	end
end