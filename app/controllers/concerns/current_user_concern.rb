module CurrentUserConcern
  extend ActiveSupport::Concern

  included do
    before_action :current_user
  end

  def current_user
    # override devise current_user
    # super returns same devise method
    super || guest_user
  end

  def guest_user
    OpenStruct.new(
      name: "Guest User",
      first_name: "Guest",
      last_name: "User",
      email: "guest@example.com"
    )
  end
end
