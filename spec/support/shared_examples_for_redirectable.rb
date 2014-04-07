shared_examples 'redirectable' do
  let(:explicit_redirect) { 'http://explicit_redirect.org' }
  let(:implicit_redirect) { 'http://implicit_redirect.org' }

  before { request.env['HTTP_REFERER'] = implicit_redirect }

  context 'with redirect_to set' do
    before do
      params[:redirect_to] = explicit_redirect
    end

    it 'redirects to the given url' do
      send(verb, action, params)
      expect(response).to redirect_to explicit_redirect
    end
  end

  context 'without redirect_to set' do
    context 'without after_completion_path defined' do
      it 'redirects back' do
        send(verb, action, params)
        expect(response).to redirect_to implicit_redirect
      end
    end

    context 'with after_completion_path defined' do
      let(:after_completion_path ) { 'http://after_completion_path.org' }

      before { expect(subject).to receive(:after_completion_path).and_return after_completion_path }

      it 'redirects to the configured url' do
        send(verb, action, params)
        expect(response).to redirect_to after_completion_path
      end
    end
  end
end
