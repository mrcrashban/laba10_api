require "test_helper"

class XmlControllerTest < ActionDispatch::IntegrationTest
  test 'check rss format' do
    get '/', params: { format: :rss }
    assert_response :success
  end
  test 'work' do
    get '/', params: { format: :rss }
    assert_response :success
    assert_includes @response.headers['Content-Type'], 'application/rss'
    assert_equal 13, assigns(:result).size
    assert_equal [1, 1, 1, 2, 3, 'Нет'], assigns(:result)[0]
    assert_equal [2, 2, 1, 2, 3, 'Нет'], assigns(:result)[1]
    assert_equal [3, 3, 1, 2, 3, 'Да'], assigns(:result)[2]
    assert_equal [4, 3, 2, 3, 4, 'Нет'], assigns(:result)[3]
    assert_equal [5, 4, 2, 3, 4, 'Да'], assigns(:result)[4]
    assert_equal [6, 4, 3, 4, 5, 'Нет'], assigns(:result)[5]
    assert_equal [7, 5, 3, 4, 5, 'Нет'], assigns(:result)[6]
    assert_equal [8, 5, 4, 5, 6, 'Да'], assigns(:result)[7]
    assert_equal [9, 5, 5, 6, 7, 'Нет'], assigns(:result)[8]
    assert_equal [10, 6, 5, 6, 7, 'Нет'], assigns(:result)[9]
    assert_equal [11, 6, 6, 7, 8, 'Нет'], assigns(:result)[10]
    assert_equal [12, 6, 7, 8, 9, 'Нет'], assigns(:result)[11]
    assert_equal [13, 6, 8, 9, 10, 'Да'], assigns(:result)[12]

  end
end
