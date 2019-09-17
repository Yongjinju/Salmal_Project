package kr.co.salmal.persistence;


import kr.co.salmal.domain.RatingVO;

public interface RatingDAO {

	public int checkChoice(RatingVO vo);
	public int selectChoice(int productnum);
	public int selectNChoice(int productnum);
	public void insertChoice(RatingVO vo);
	public void insertNChoice(RatingVO vo);

}
