# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Student, type: :model do
  let(:student) { build(:student) }

  describe 'Validations' do
    context 'Presence' do
      it { is_expected.to validate_presence_of(:first_name) }
      it { is_expected.to validate_presence_of(:last_name) }
      it { is_expected.to validate_presence_of(:birth_date) }
      it { is_expected.to validate_presence_of(:address) }
      it { should define_enum_for(:school_grade).with_values([:inicial, :primaria, :secundaria]) }
      it "Doesn't allow future dates" do
        student = build(:student, birth_date: Date.tomorrow)
        expect(student).to_not be_valid
        expect(student.errors[:birth_date]).to include("No se pudo crear el estudiante")
      end
    end
  end
    describe 'Associations' do
      it { should belong_to(:user) }
    end

    describe 'Length' do
      it { is_expected.to validate_length_of(:first_name).is_at_least(3) }
      it { is_expected.to validate_length_of(:last_name).is_at_least(3) }
    end

    describe 'Enum Type' do
      it { should define_enum_for(:school_grade).with_values(%i[inicial primaria secundaria]) }
    end

    describe 'Format' do
      it { is_expected.not_to allow_value('Juan1').for(:first_name) }
      it { is_expected.not_to allow_value('Jua1n').for(:first_name) }
      it { is_expected.not_to allow_value('Perez1').for(:last_name) }
      it { is_expected.not_to allow_value('Pe1rez').for(:last_name) }
      it { is_expected.not_to allow_value('Juan!').for(:first_name) }
      it { is_expected.not_to allow_value('Ju!an').for(:first_name) }
    end

end