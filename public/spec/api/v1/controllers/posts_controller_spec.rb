require 'rails_helper'
RSpec.describe Api::V1::TopicsController, type: :controller do
  let(:my_user) {create(:user)}
  let (:my_topic) {create(:topic)}
  let (:my_post) {create(:post)}

  context "unauthenticated user" do

    it 'GET index returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'GET show returns http success' do
      get :show, id: my_post.id
      expect(response).to have_http_status(:success)
    end

    it 'POST create returns http unauthenticated' do
      post :create, post: {title: "New title", body: "New body"}
      expect(response).to have_http_status(401)
    end

    it 'Delete destroy returns http unauthenticated' do
      delete :destroy, id: my_topic.id
      expect(response).to have_http_status(401)
    end

  end

  context "unauthorized user" do

    before do
       controller.request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(my_user.auth_token)
     end

     it 'GET index returns http success' do
       get :index
       expect(response).to have_http_status(:success)
     end

     it 'GET show returns http success' do
       get :show, id: my_post.id
       expect(response).to have_http_status(:success)
     end

     it 'PUT update returns http forbidden' do
       put :update, post: my_post.id, post: {title: "New title", body: "New body"}
       expect(response).to have_http_status(403)
     end

     it 'Delete destroy returns http forbidden' do
       delete :destroy, id: my_topic.id
       expect(response).to have_http_status(403)
     end
   end
end
