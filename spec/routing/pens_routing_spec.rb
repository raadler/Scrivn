require 'rails_helper'

RSpec.describe PensController, type: :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(get: '/pens').to route_to('pens#index')
    end

    it 'routes to #new' do
      expect(get: '/pens/new').to route_to('pens#new')
    end

    it 'routes to #show' do
      expect(get: '/pens/1').to route_to('pens#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/pens/1/edit').to route_to('pens#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/pens').to route_to('pens#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/pens/1').to route_to('pens#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/pens/1').to route_to('pens#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/pens/1').to route_to('pens#destroy', id: '1')
    end
  end
end
