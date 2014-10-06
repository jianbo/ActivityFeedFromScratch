object @recipe
attribute :id, :content, :title, :created_at, :user_id

child(:user) do
	attribute :id, :username
end