package kr.co.sbsj.cart;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.sbsj.md.MdDTO;

@Repository
public class CartDAO {

	@Autowired
	private SqlSession sqlSession;

	public int updateBuyQty( MdDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.delete("CartMapper.updateBuyQty", dto);
		return successCount;
	}//updateBuyQty

	public int delete( MdDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.delete("CartMapper.delete", dto);
		return successCount;
	}//delete

	public List<MdDTO> list(String member_id) {
		List<MdDTO> list = null;
		list = sqlSession.selectList("CartMapper.list", member_id);
		return list;
	}//list

	public int insert(MdDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("CartMapper.insert", dto);
		return successCount;
	}//insert

}//class
