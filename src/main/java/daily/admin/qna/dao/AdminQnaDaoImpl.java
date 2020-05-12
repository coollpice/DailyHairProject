package daily.admin.qna.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import daily.admin.qna.vo.replyVO;
import daily.client.qna.vo.QnaVO;
@Repository
public class AdminQnaDaoImpl implements AdminQnaDao {

	@Autowired
	SqlSession sqlSession;
	@Override
	public QnaVO detail(QnaVO qvo) {
		return sqlSession.selectOne("detail", qvo);
	}
	@Override
	public int insertReply(replyVO repVO) {
		return sqlSession.insert("insertReply", repVO);
	}
	@Override
	public int updateState(replyVO repVO) {
		return sqlSession.update("updateState", repVO);
	}
	@Override
	public replyVO selectReply(int qna_num) {
		return sqlSession.selectOne("selectReply",qna_num);
	}
	@Override
	public int boardListCnt(QnaVO qvo) {
		return sqlSession.selectOne("boardListCnt",qvo);
	}
	@Override
	public List<QnaVO> List(QnaVO qvo) {
		return sqlSession.selectList("List",qvo);
	}
	@Override
	public int Delete(replyVO repVO) {
		return sqlSession.delete("Delete", repVO);
	}
	@Override
	public void updateStateDel(replyVO repVO) {
		int result = sqlSession.update("updateStateDel", repVO);
	}


}
