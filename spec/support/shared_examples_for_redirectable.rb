shared_examples 'redirectable' do
  let(:explicit_redirect) { 'http://explicit_redirect.org' }
  let(:implicit_redirect) { 'http://implicit_redirect.org' }

  before { request.env['HTTP_REFERER'] = implicit_redirect }

  context 'with redirect_to set' do
    before do
      params[:redirect_to] = explicit_redirect
      send(verb, action, params)
    end

    it 'redirects to the given url' do
      expect(response).to redirect_to explicit_redirect
    end
  end

  context 'without redirect_to set' do
    before do
      send(verb, action, params)
    end

    it 'redirects back' do
      expect(response).to redirect_to implicit_redirect
    end
  end
end
