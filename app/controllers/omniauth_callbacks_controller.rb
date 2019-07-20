class OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController
  def omniauth_success
    get_resource_from_auth_hash
    set_token_on_resource
    create_auth_params

    if confirmable_enabled?
      # don't send confirmation email!!!
      @resource.skip_confirmation!
    end

    sign_in(:user, @resource, store: false, bypass: false)

    @resource.save!

    yield @resource if block_given?

    render json: @auth_params.as_json
    # render_data_or_redirect('deliverCredentials', @auth_params.as_json, @resource.as_json)
  end
end