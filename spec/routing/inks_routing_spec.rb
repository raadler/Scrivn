require 'rails_helper'

RSpec.describe InksController, type: :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(get: '/inks').to route_to('inks#index')
    end

    it 'routes to #new' do
      expect(get: '/inks/new').to route_to('inks#new')
    end

    it 'routes to #show' do
      expect(get: '/inks/1').to route_to('inks#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/inks/1/edit').to route_to('inks#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/inks').to route_to('inks#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/inks/1').to route_to('inks#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/inks/1').to route_to('inks#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/inks/1').to route_to('inks#destroy', id: '1')
    end
  end
end
