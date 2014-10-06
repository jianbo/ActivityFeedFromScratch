module PermittedAttributes
  ATTRIBUTES = [
    :blog_attributes,
    :review_attributes,
    :recipe_attributes
  ]
  
  mattr_reader *ATTRIBUTES
  
  @@blog_attributes = [
    :content, :title
  ]

  @@review_attributes = [
    :content
  ]

  @@recipe_attributes = [
    :content, :title
  ]
end