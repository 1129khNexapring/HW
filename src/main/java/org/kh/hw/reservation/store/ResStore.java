package org.kh.hw.reservation.store;



import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.kh.hw.reservation.domain.PageInfo;
import org.kh.hw.reservation.domain.Res;

public interface ResStore {

	public int insertReservation(SqlSession sqlSession, Res reservation);
	public int insertReservationId(SqlSession sqlSession, Res reservation);
	public Res selectViewReservation(SqlSession sqlSession, Res reservation);
	public Res selectOneByRes(SqlSession sqlSession, String resMemId);
	public int deleteReservation(SqlSession sqlSession, Res reservation);
	public int selectListCount(SqlSession sqlSession);
	public List<Res> selectAll(SqlSession sqlSession, PageInfo pi);

}
