require_relative '../test/test_helper'
require_relative '../lib/DreamTeam/Films/parsing_films'

class ParsingFilmsTest < Minitest::Test
  def test_count_of_elements_in_get_all_films
    films = get_all_films(get_films_id())
    assert_equal(films.size, 250)
  end

  def test_id_of_arr_film
    films = Film.new('id:"tt0111161",rank:"1",title:"The Shawshank Redemption", fullTitle:"The Shawshank Redemption (1994)",year:"1994",image:"https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UX128_CR0,12,128,176_AL_.jpg",crew:"Frank Darabont (dir.), Tim Robbins, Morgan Freeman",imDbRating:"9.2",imDbRatingCount:"2650504"')
    assert_equal(films.id, "tt0111161")
  end

  def test_rank_of_arr_film
    films = Film.new('id:"tt0111161",rank:"1",title:"The Shawshank Redemption", fullTitle:"The Shawshank Redemption (1994)",year:"1994",image:"https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UX128_CR0,12,128,176_AL_.jpg",crew:"Frank Darabont (dir.), Tim Robbins, Morgan Freeman",imDbRating:"9.2",imDbRatingCount:"2650504"')
    assert_equal(films.rank, 1)
  end

  def test_title_of_arr_film
    films = Film.new('id:"tt0111161",rank:"1",title:"The Shawshank Redemption", fullTitle:"The Shawshank Redemption (1994)",year:"1994",image:"https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UX128_CR0,12,128,176_AL_.jpg",crew:"Frank Darabont (dir.), Tim Robbins, Morgan Freeman",imDbRating:"9.2",imDbRatingCount:"2650504"')
    assert_equal(films.title, "The Shawshank Redemption")
  end

  def test_full_title_of_arr_film
    films = Film.new('id:"tt0111161",rank:"1",title:"The Shawshank Redemption", fullTitle:"The Shawshank Redemption (1994)",year:"1994",image:"https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UX128_CR0,12,128,176_AL_.jpg",crew:"Frank Darabont (dir.), Tim Robbins, Morgan Freeman",imDbRating:"9.2",imDbRatingCount:"2650504"')
    assert_equal(films.title_full, "The Shawshank Redemption (1994)")
  end
  def test_year_of_arr_film
    films = Film.new('id:"tt0111161",rank:"1",title:"The Shawshank Redemption", fullTitle:"The Shawshank Redemption (1994)",year:"1994",image:"https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UX128_CR0,12,128,176_AL_.jpg",crew:"Frank Darabont (dir.), Tim Robbins, Morgan Freeman",imDbRating:"9.2",imDbRatingCount:"2650504"')
    assert_equal(films.year, 1994)
  end

  def test_image_of_arr_film
    films = Film.new('id:"tt0111161",rank:"1",title:"The Shawshank Redemption", fullTitle:"The Shawshank Redemption (1994)",year:"1994",image:"https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UX128_CR0,12,128,176_AL_.jpg",crew:"Frank Darabont (dir.), Tim Robbins, Morgan Freeman",imDbRating:"9.2",imDbRatingCount:"2650504"')
    assert_equal(films.image, "https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UX128_CR0,12,128,176_AL_.jpg")
  end

  def test_crew_of_arr_film
    films = Film.new('id:"tt0111161",rank:"1",title:"The Shawshank Redemption", fullTitle:"The Shawshank Redemption (1994)",year:"1994",image:"https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UX128_CR0,12,128,176_AL_.jpg",crew:"Frank Darabont (dir.), Tim Robbins, Morgan Freeman",imDbRating:"9.2",imDbRatingCount:"2650504"')
    assert_equal(films.crew, "Frank Darabont (dir.), Tim Robbins, Morgan Freeman")
  end

  def test_rating_of_arr_film
    films = Film.new('id:"tt0111161",rank:"1",title:"The Shawshank Redemption", fullTitle:"The Shawshank Redemption (1994)",year:"1994",image:"https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UX128_CR0,12,128,176_AL_.jpg",crew:"Frank Darabont (dir.), Tim Robbins, Morgan Freeman",imDbRating:"9.2",imDbRatingCount:"2650504"')
    assert_equal(films.imDbRating, 9.2)
  end

  def test_imDbRatingCount_of_arr_film
    films = Film.new('id:"tt0111161",rank:"1",title:"The Shawshank Redemption", fullTitle:"The Shawshank Redemption (1994)",year:"1994",image:"https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UX128_CR0,12,128,176_AL_.jpg",crew:"Frank Darabont (dir.), Tim Robbins, Morgan Freeman",imDbRating:"9.2",imDbRatingCount:"2650504"')
    assert_equal(films.imDbRatingCount, 2650504)
  end

end
