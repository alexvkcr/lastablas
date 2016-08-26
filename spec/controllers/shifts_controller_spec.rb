require 'rails_helper'

RSpec.describe ShiftsController, type: :controller do
  context "When user logged in" do
  end
  context "When admin logged in" do
    let(:admin) { FactoryGirl.create(:admin) }
    before(:each) do
      sign_in admin
    end

    it "#GET new" do
      get :new
      expect(response).to have_http_status(:success)
    end

    describe "#POST create" do
      before(:each)do
        @room = FactoryGirl.create(:room)
        @room.save
      end
      it "succesfully" do
        expect do
          post :create, shift: {day_of_week: 1, start_time: "10:00", end_time: "11:00", room: @room}
        end.to change(Shift.all, :count).by(1)
        expect(response).to have_http_status(:success)
      end
      it "without day_of_week" do
        debugger
        expect do
          post :create, shift: {start_time: "10:00", end_time: "11:00", room: @room}
        end.to change(Shift.all, :count).by(0)
        expect(response).to redirect_to(new_shift_path)
      end
      it "without start_time" do
        expect do
          post :create, shift: {day_of_week: 1, end_time: "11:00", room: @room}
        end.to change(Shift.all, :count).by(0)
        expect(response).to redirect_to(new_shift_path)
      end
      it "without end_time" do
        expect do
          post :create, shift: {day_of_week: 1, start_time: "10:00", room: @room}
        end.to change(Shift.all, :count).by(0)
        expect(response).to redirect_to(new_shift_path)
      end
      it "without room" do
        expect do
          post :create, shift: {day_of_week: 1, start_time: "10:00", end_time: "11:00"}
        end.to change(Shift.all, :count).by(0)
        expect(response).to redirect_to(new_shift_path)
      end
    end

    describe "#GET show" do
      it "existing shift" do
        shift = FactoryGirl.create(:shift)
        get :show, id: shift.id
        expect(response).to have_http_status(:success)
      end
      it "non-existing shift" do
        get :show, id: -1
        expect(response).to redirect_to(home_path)
      end
    end

    describe "#GET edit" do
      it "existing shift" do
        shift = FactoryGirl.create(:shift)
        get :edit, id: shift.id
        expect(response).to have_http_status(:success)
      end
      it "non-existing shift" do
        get :edit, id: -1
        expect(response).to redirect_to(home_path)
      end
    end

    describe "#PUT update" do
      it "succesfully" do
        shift = FactoryGirl.create(:shift)
        put :update, id: shift.id, shift: {day_of_week: 1, start_time: "10:00", end_time: "11:00"}
        expect(response).to have_http_status(:success)
      end
      it "non-existing shift" do
        put :update, id: -1, shift: {day_of_week: 1, start_time: "10:00", end_time: "11:00"}
        expect(response).to redirect_to(shifts_path)
      end
    end

    describe "#DELETE destroy" do
      it "succesfully" do
        shift = FactoryGirl.create(:shift)
        expect { delete :destroy, id: shift.id }.to change(Shift.all, :count).by(-1)
        expect(response).to redirect_to(shifts_path)
      end
      it "non-existing shift" do
        expect { delete :destroy, id: -1 }.to change(Shift.all, :count).by(0)
        expect(response).to redirect_to(shifts_path)
      end
    end
  end

  context "When NOT logged in" do
    it "#GET new" do
      get :new
      expect(response).to redirect_to(new_admin_session_path)
    end

    it "#POST create" do
      expect do
        post :create, shift: {day_of_week: 1, start_time: "10:00", end_time: "11:00"}
      end.to change(Shift.all, :count).by(0)
      expect(response).to redirect_to(new_admin_session_path)
    end

    it "#GET show" do
      shift = FactoryGirl.build_stubbed(:shift)
      get :show, id: shift.id
      expect(response).to redirect_to(new_admin_session_path)
    end

    it "#GET edit" do
      shift = FactoryGirl.build_stubbed(:shift)
      get :edit, id: shift.id
      expect(response).to redirect_to(new_admin_session_path)
    end

    it "#PUT update" do
      shift = FactoryGirl.create(:shift)
      put :update, id: shift.id, shift: {day_of_week: 1, start_time: "10:00", end_time: "11:00"}
      expect(response).to redirect_to(new_admin_session_path)
    end

    it "#DELETE destroy" do
      shift = FactoryGirl.build_stubbed(:shift)
      expect { delete :destroy, id: shift.id }.to change(Shift.all, :count).by(0)
      expect(response).to redirect_to(new_admin_session_path)
    end
  end
end
