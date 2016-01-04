require 'rails_helper'
include RandomData

RSpec.describe SponsoredPostsController, type: :controller do

let(:my_topic){Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph)}

let(:sponsored){my_topic.sponsored_posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_number)}

describe "GET show" do

    it "returns http success" do
      get :show, topic_id: my_topic.id, id: sponsored.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, topic_id: my_topic.id, id: sponsored.id
      expect(response).to render_template :show
    end

    it "assigns sponsored to @sponsored" do
       get :show, topic_id: my_topic.id, id: sponsored.id
       expect(assigns(:sponsored)).to eq(sponsored)
     end

   end

   describe "GET new" do

      it "returns http success" do
        get :new, topic_id: my_topic.id
        expect(response).to have_http_status(:success)
     end

      it "renders the #new view" do
        get :new, topic_id: my_topic.id
        expect(response).to render_template :new
    end

      it "initializes @sponsored" do
        get :new, topic_id: my_topic.id
        expect(assigns(:sponsored)).not_to be_nil
     end

   end

     describe "POST create" do

        it "increases the number of SponsoredPost by 1" do
        expect{post :create, topic_id: my_topic.id, sponsored_posts: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}.to change(SponsoredPost,:count).by(1)
        end

        it "assigns the new SponsoredPost to @sponsored" do
          post :create, topic_id: my_topic.id, sponsored_posts: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
          expect(assigns(:sponsored)).to eq SponsoredPost.last
        end

        it "redirects to the new SponsoredPost" do
          post :create, topic_id: my_topic.id, sponsored_posts: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
          expect(response).to redirect_to [my_topic, SponsoredPost.last]
        end

      end

      describe "GET edit" do

         it "returns http success" do
           get :edit, topic_id: my_topic.id, id: sponsored.id
           expect(response).to have_http_status(:success)
         end

          it "renders the #edit view" do
            get :edit, topic_id: my_topic.id, id: sponsored.id
            expect(response).to render_template :edit
          end

          it "assigns post to be updated to @sponsored" do
            get :edit, topic_id: my_topic.id, id: sponsored.id
            sponsored_instance = assigns(:sponsored)

            expect(sponsored_instance.id).to eq sponsored.id
            expect(sponsored_instance.title).to eq sponsored.title
            expect(sponsored_instance.body).to eq sponsored.body
          end

        end

        describe "PUT update" do

           it "updates SponsoredPost with expected attributes" do
              new_title = RandomData.random_sentence
              new_body = RandomData.random_paragraph

           put :update, topic_id: my_topic.id, id: sponsored.id, sponsored_posts: {title: new_title, body: new_body}

              updated_post = assigns(:sponsored)
              expect(updated_post.id).to eq sponsored.id
              expect(updated_post.title).to eq new_title
              expect(updated_post.body).to eq new_body
            end

            it "redirects to the updated SponsoredPost" do
                new_title = RandomData.random_sentence
                new_body = RandomData.random_paragraph

                put :update, topic_id: my_topic.id, id: sponsored.id, sponsored_posts: {title: new_title, body: new_body}

                expect(response).to redirect_to [my_topic, sponsored]
              end
            end

            describe "DELETE destroy" do

              it "deletes the SponsoredPost" do
                delete :destroy, topic_id: my_topic.id, id: sponsored.id
                count = SponsoredPost.where({id: sponsored.id}).size
                expect(count).to eq 0
              end

              it "redirects to topic show" do
                delete :destroy, topic_id: my_topic.id, id: sponsored.id
                expect(response).to redirect_to my_topic
            end
          end
        end
