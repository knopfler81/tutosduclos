require "administrate/base_dashboard"

class TutoDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
<<<<<<< HEAD
    title: Field::String,
=======
    name: Field::String,
>>>>>>> d2736d999df6e532ce658f9fcff9b8b17a83896c
    content: Field::Text,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :created_at,
    :updated_at,
<<<<<<< HEAD
    :title,
=======
    :name,
>>>>>>> d2736d999df6e532ce658f9fcff9b8b17a83896c
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :created_at,
    :updated_at,
<<<<<<< HEAD
    :title,
=======
    :name,
>>>>>>> d2736d999df6e532ce658f9fcff9b8b17a83896c
    :content,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
<<<<<<< HEAD
    :title,
=======
    :name,
>>>>>>> d2736d999df6e532ce658f9fcff9b8b17a83896c
    :content,
  ].freeze

  # Overwrite this method to customize how tutos are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(tuto)
  #   "Tuto ##{tuto.id}"
  # end
end
