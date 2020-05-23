# frozen_string_literal: true

require 'spec_helper'

RSpec.describe TinyUtils do
  subject { call }

  let(:call) { described_class.send(method, *args, **kwargs) }
  let(:args) { [] }
  let(:kwargs) { {} }

  describe '.concat_strings([str,str,...], separator: " ")' do
    let(:method) { :concat_strings }

    shared_examples 'concatenates' do |s|
      let(:args) { [strings] }
      let(:kwargs) { { separator: separator } }
      let(:separator) { s || " " }

      context 'with multiple values' do
        let(:strings) { ["a", "b"] }
        let(:result) { "a#{separator}b" }

        it { is_expected.to eq result }
      end

      context 'with single value' do
        let(:strings) { ["a"] }
        let(:result) { "a" }

        it { is_expected.to eq result }
      end

      context 'with nil values' do
        let(:strings) { ["a", nil, "b"] }
        let(:result) { "a#{separator}b" }

        it { is_expected.to eq result }
      end

      context 'with empty strings' do
        let(:strings) { ["a", " ", "b"] }
        let(:result) { "a#{separator}b" }

        it { is_expected.to eq result }
      end
    end

    context 'with no separator specified' do
      include_examples 'concatenates'
    end

    context 'with separator specified' do
      include_examples 'concatenates', '--'
    end
  end

  describe '.random_hash' do
    let(:method) { :random_hash }

    context "returns a random hash" do
      it { is_expected.to be_an(String) }
    end
  end

  describe '.encode(int)' do
    let(:method) { :encode }

    context "with any id" do
      let(:args) { [id] }
      let(:kwargs) { { salt: "pepper" } }
      let(:id) { 123 }

      it "equals .decode" do
        expect(id).to eq(described_class.decode(subject, salt: "pepper"))
      end

      context "with different salts" do
        let(:id) { 123 }
        let(:salt1) { "chocolate" }
        let(:salt2) { "cheese" }

        it "returns different encoded ids" do
          expect(described_class.encode(id, salt: salt1)).not_to eq(described_class.encode(id, salt: salt2))
        end
      end
    end
  end

  describe '.round_to_next_30_min_interval(datetime_obj)' do
    let(:method) { :round_to_next_30_min_interval }
    let(:args) { [Time.now.beginning_of_hour + 20.minutes] }

    context "returns DateTime rounded to 30 minutes" do
      it { is_expected.to be_an(DateTime) }
      it { is_expected.to eq(Time.now.beginning_of_hour + 30.minutes) }
    end
  end

  describe '.filter_hash_by_keys(hash)' do
    let(:method) { :filter_hash_by_keys }
    let(:args) { [hash, keys] }
    let(:hash) { { a: "🌞", b: "🦙", c: "🍩" } }
    let(:keys) { [:a, :c] }

    context "returns DateTime rounded to 30 minutes" do
      it { is_expected.to be_an(Hash) }
      it { is_expected.to have_key(:a) }
      it { is_expected.not_to have_key(:b) }
      it { is_expected.to have_key(:c) }
    end
  end

  describe '.cast_boolean(val)' do
    let(:method) { :cast_boolean }

    TinyUtils::FALSE_VALUES.each do |val|
      # nil as argument breaks *args therefore needs to be handled explicitly
      if val.nil?
        context "return false for nil" do
          let(:args) { [nil] }

          it { is_expected.to eq false }
        end
      else
        context "return false for #{val}" do
          let(:args) { val }
          let(:result) { false }

          it { is_expected.to eq result }
        end
      end
    end

    [1, '1', 'yes', 'pizza', -1, 0.0000001, 'okay sure', 'maybe'].each do |val|
      context "return true for #{val}" do
        let(:args) { val }
        let(:result) { true }

        it { is_expected.to eq result }
      end
    end
  end
end
