

class GamesControllerTest < ActionDispatch::IntegrationTest
	test 'first' do
		get games_url
		assert_response	:success
	end
end
