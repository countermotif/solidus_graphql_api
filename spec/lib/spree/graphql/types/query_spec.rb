# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Spree::Graphql::Types::Query do
  subject { described_class.send(:new, {}, {}) }

  it { expect(described_class.method_defined?(:countries)).to be_truthy }
  it { expect(described_class.method_defined?(:taxonomies)).to be_truthy }

  describe '#products' do
    let(:query_object) { spy(:query_object) }

    before { allow(Spree::Queries::ProductsQuery).to receive(:new).and_return(query_object) }

    after { subject.products }

    it { expect(Spree::Queries::ProductsQuery).to receive(:new) }

    it { expect(query_object).to receive(:call) }
  end

  describe '#product_by_slug' do
    let(:query_object) { spy(:query_object) }

    let(:slug) { 'slug' }

    before { allow(Spree::Queries::ProductBySlugQuery).to receive(:new).with(no_args).and_return(query_object) }

    after { subject.product_by_slug(slug: slug) }

    it { expect(query_object).to receive(:call).with(slug: slug) }
  end
end
