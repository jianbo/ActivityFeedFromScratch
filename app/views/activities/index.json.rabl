object false


node(:total_page, :object_root => true) { @activities.total_pages }
node(:current_page, :object_root => true) { @activities.current_page }


child(@activities => "activities") do
	attributes :id, :trackable_type, :trackable_id, :action, :created_at, :title

	node(:trackable_path) { |object|
		"/#{object.trackable_type.pluralize.downcase}/#{object.trackable_id}" if object.trackable_type
	}

	child(:user) do
		attributes :id, :username
	end

	child(:trackable) do
		attributes :id, :content, :title
	end

	node(:reviewable_type) { |object|
		if object.trackable.is_a?(Review)
			object.trackable.reviewable.class.name.downcase
		end
	}

	node(:reviewable_path) { |object|
		if object.trackable.is_a?(Review)
			"/#{object.trackable.reviewable_type.pluralize.downcase}/#{object.trackable.reviewable_id}"
		end
	}

	node(:reviewable_title) { |object|
		if object.trackable.is_a?(Review)
			object.trackable.reviewable.title
		end
	}
end