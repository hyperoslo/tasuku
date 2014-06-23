shared_examples 'illustrations' do
  it 'renders the image' do
    expect(rendered).to have_xpath "//img[contains(@src, \"#{request.image.url}\")]"
  end

  it 'renders the video' do
    expect(rendered).to have_xpath "//div[@class='video']"
  end
end

shared_examples 'no illustrations' do
  it 'does not render an image' do
    expect(rendered).not_to have_xpath "//img"
  end

  it 'does not render a video' do
    expect(rendered).not_to have_xpath "//div[@class='video']"
  end
end
