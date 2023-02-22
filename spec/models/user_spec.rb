# frozen_string_literal: true

require 'pundit/rspec'
require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }
  let(:colaborador) { build(:user, :colaborador) }
  let(:administrador) { build(:user, :administrador) }

  describe 'Validations' do
      it { is_expected.to validate_presence_of(:email) }
      
    context 'Presence' do
      it { is_expected.to validate_presence_of(:first_name) }
      it { is_expected.to validate_presence_of(:last_name) }
    end

    context 'Length' do
      it { is_expected.to validate_length_of(:password).is_at_least(3) }
    end
  end

  describe 'Format' do
    it { is_expected.not_to allow_value('nicolas123').for(:first_name) }
    it { is_expected.to allow_value('nicolas').for(:first_name) }
    it { is_expected.not_to allow_value('gar123').for(:last_name) }
    it { is_expected.to allow_value('garci').for(:last_name) }
    it { is_expected.not_to allow_value('gar%').for(:last_name) }
    it { is_expected.to allow_value('email@example.com').for(:email) }
    it { is_expected.not_to allow_value('not_an_email').for(:email) }
  end

  describe 'Policy' do
    it 'permite a un administrador actualizar un usuario' do
      expect { UserPolicy.new(administrador, colaborador).update? }.not_to raise_error
    end
  end
end
